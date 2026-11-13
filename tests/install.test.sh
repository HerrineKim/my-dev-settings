#!/usr/bin/env bash
# Run install.sh in a throwaway HOME with stub claude/gh/git/launchctl/nlm/uv, and check what it links,
# registers and writes: a fresh run, a re-run with everything registered, and a run where optional steps fail.
# Nothing under the real HOME is written and nothing goes to the network (install.sh still reads the repo itself).
#
# Usage: tests/install.test.sh
#   INSTALL_SH=path   script to test (default: install.sh). It must sit at the repo root, since it finds the repo from its own path
#   TEST_SANDBOX=dir  keep the sandbox in this folder (emptied first) instead of a temp one that is deleted
set -uo pipefail
repo="$(cd "$(dirname "$0")/.." && pwd)"
install_sh="${INSTALL_SH:-$repo/install.sh}"
if [ -n "${TEST_SANDBOX:-}" ]; then sb="$TEST_SANDBOX"; rm -rf "$sb"; mkdir -p "$sb"
else sb="$(mktemp -d)"; trap 'rm -rf "$sb"' EXIT; fi
sb="$(cd "$sb" && pwd -P)"

home="$sb/home" stubs="$sb/stubs" log="$sb/calls.log"
mkdir -p "$home/.claude/skills" "$stubs" "$home/Library/Mobile Documents/com~apple~CloudDocs"
: > "$log"

# --- stubs: log every call. STUB_REGISTERED=1: claude reports everything as already set up, with a long list after
# the matches so a `claude … | grep -q` reader gets SIGPIPE. STUB_FAIL=1: plugin install and launchctl bootstrap fail.
stub() { printf '#!/usr/bin/env bash\necho "%s $*" >> "%s"\n%s\n' "$1" "$log" "${2:-exit 0}" > "$stubs/$1"; chmod +x "$stubs/$1"; }
stub claude '
case "$1 $2" in
  "mcp get") [ "${STUB_REGISTERED:-0}" = 1 ];;
  "plugin list") [ "${STUB_REGISTERED:-0}" = 1 ] && printf "  \342\235\257 %s\n" career-ops@career-ops oh-my-claudecode@omc \
      vercel@claude-plugins-official figma@claude-plugins-official frontend-design@claude-plugins-official \
      && seq 200000 | sed "s/^/  other-plugin-/"; exit 0;;
  "plugin install") [ "${STUB_FAIL:-0}" != 1 ];;
  "plugin marketplace") [ "$3" = list ] && [ "${STUB_REGISTERED:-0}" = 1 ] && printf "%s\n" career-ops-hq/career-ops \
      Yeachan-Heo/oh-my-claudecode anthropics/claude-plugins-official; exit 0;;
esac'
stub gh 'case "$1" in release) exit 1;; esac'
stub launchctl '[ "$1" = bootstrap ] && [ "${STUB_FAIL:-0}" = 1 ] && exit 5; exit 0'
stub git
stub nlm
stub uv
stub uvx

# --- starting state of ~/.claude
skills="$home/.claude/skills"
mkdir "$skills/tdd-tidy-first"                                                   # a real folder: must be left alone
ln -s "$repo/plugins/gone/skills/gone-skill" "$skills/gone-skill"                 # dangling link into the repo: removed
ln -s "/nowhere/else" "$skills/foreign-dangling"                                 # dangling link elsewhere: kept
excluded_skill="$(cd "$repo/plugins/marketingskills/skills" && ls | head -1)"
ln -s "$repo/plugins/marketingskills/skills/$excluded_skill" "$skills/$excluded_skill"  # excluded plugin: unlinked
printf 'mine\n<!-- MY-CLAUDE-SKILLS:START -->\n@old\n<!-- MY-CLAUDE-SKILLS:END -->\n' > "$home/.claude/CLAUDE.md"

run() { # <label> [env...]
  env -i HOME="$home" PATH="$stubs:/usr/bin:/bin:/usr/sbin:/sbin" TERM=dumb PYTHONDONTWRITEBYTECODE=1 "${@:2}" \
    bash "$install_sh" > "$sb/$1.out" 2>&1
  echo "exit=$?" >> "$sb/$1.out"
}

fails=0
check() { # <description> <command...>
  if "${@:2}" >/dev/null 2>&1; then echo "ok   $1"; else echo "FAIL $1"; fails=$((fails + 1)); fi
}
links_to() { [ "$(readlink "$skills/$1")" = "$repo/plugins/$2" ]; }
not() { ! "$@"; }
logged() { grep -qxF -- "$1" "$log"; }
count() { [ "$(grep -cF -- "$2" "$3")" = "$1" ]; }

# --- first run: nothing registered yet
run first
check "first run exits 0" grep -qx 'exit=0' "$sb/first.out"
check "links a normal skill" links_to daily-log daily-log/skills/daily-log
check "links a kept skill of an excluded plugin" links_to react magnus-agent-skills/skills/react
check "links frontend-checklist-global" links_to frontend-checklist-global front-end-checklist/skills/frontend-checklist-global
other_fec="$(cd "$repo/plugins/front-end-checklist/skills" && ls | grep -vx frontend-checklist-global | head -1)"
check "does not link other front-end-checklist skills" test ! -e "$skills/$other_fec"
check "unlinks a skill of an excluded plugin" test ! -e "$skills/$excluded_skill"
check "leaves a real folder alone" test -d "$skills/tdd-tidy-first" -a ! -L "$skills/tdd-tidy-first"
check "reports the skipped folder" grep -q 'skip tdd-tidy-first' "$sb/first.out"
check "removes a dangling link into the repo" test ! -L "$skills/gone-skill"
check "keeps a dangling link pointing elsewhere" test -L "$skills/foreign-dangling"
check "adds code-review-graph MCP" logged "claude mcp add -s user code-review-graph -- uvx code-review-graph serve"
check "adds front-end-checklist MCP" logged "claude mcp add -s user --transport http front-end-checklist https://mcp.frontendchecklist.io"
check "does not add excluded korean-law MCP" not grep -q 'mcp add.*korean-law' "$log"
check "adds figma-bridge MCP" grep -q '^claude mcp add -s user figma-bridge -- npx -y @gethopp/figma-mcp-bridge@' "$log"
check "adds financial-datasets MCP" grep -q "^claude mcp add -s user financial-datasets -- uv --directory $repo/mcp/financial-datasets run" "$log"
check "creates a private financial-datasets .env" test "$(stat -f %Lp "$home/.config/financial-datasets/.env")" = 600
check "installs 5 marketplace plugins" count 5 "claude plugin install" "$log"
check "adds a shared marketplace once" count 1 "claude plugin marketplace add anthropics/claude-plugins-official" "$log"
check "links bin/ commands" test "$(readlink "$home/.local/bin/skills-ls")" = "$repo/bin/skills-ls"
check "drops the old CLAUDE.md import block" not grep -q MY-CLAUDE-SKILLS "$home/.claude/CLAUDE.md"
check "adds the CLAUDE.md import block" grep -qx "@$repo/global-claude.md" "$home/.claude/CLAUDE.md"
check "keeps the user's own CLAUDE.md lines" grep -qx mine "$home/.claude/CLAUDE.md"
check "registers daily-log hooks on 3 events" count 3 sync_transcripts.py "$home/.claude/settings.json"
check "creates the shared transcript folder" test -d "$home/Library/Mobile Documents/com~apple~CloudDocs/claude-daily-log/transcripts"
check "writes the LaunchAgent plist" grep -q "$repo/bin/dev-settings-sync" "$home/Library/LaunchAgents/com.herrinekim.my-dev-settings.sync.plist"
check "bootstraps the LaunchAgent" grep -q '^launchctl bootstrap' "$log"

# --- second run: everything already registered, so nothing is added twice
cp "$log" "$sb/first.calls.log"; : > "$log"
run second STUB_REGISTERED=1
check "second run exits 0" grep -qx 'exit=0' "$sb/second.out"
check "adds no MCP the second time" not grep -q 'mcp add' "$log"
check "installs no plugin the second time" not grep -q 'plugin install\|marketplace add' "$log"
check "removes the excluded korean-law MCP" logged "claude mcp remove -s user korean-law"
check "keeps one CLAUDE.md import block" count 1 "MY-DEV-SETTINGS:START" "$home/.claude/CLAUDE.md"
check "keeps one hook per event" count 3 sync_transcripts.py "$home/.claude/settings.json"
check "leaves an unchanged LaunchAgent alone" not grep -q '^launchctl' "$log"
cp "$log" "$sb/second.calls.log"

# --- third run, in a new HOME: optional steps fail, but install.sh still finishes every step
home="$sb/home-fail"; mkdir -p "$home/.claude/skills"; : > "$log"
run failing STUB_FAIL=1
check "failing run still exits 0" grep -qx 'exit=0' "$sb/failing.out"
check "failing run still links bin/ commands" test -L "$home/.local/bin/skills-ls"
check "failing run still adds the CLAUDE.md import" grep -q MY-DEV-SETTINGS "$home/.claude/CLAUDE.md"
check "failing run still prints the reminders" grep -q apps-sync "$sb/failing.out"

echo
if [ "$fails" = 0 ]; then echo "all install.sh checks passed"; else echo "$fails install.sh check(s) failed (output in ${TEST_SANDBOX:-a temp sandbox})"; exit 1; fi
