# cybersecurity

증거 기반(evidence-driven) 보안 방법론 스킬 22개. 정찰·OSINT부터 취약점 스캔, 웹·API·클라우드·모바일·OT/ICS 보안, 악성코드 분석, 위협 헌팅, 사고 대응(IR), SOC 자동화, 로그 분석, 암호, 공급망, 위협 인텔리전스, 레드·블루·퍼플팀, GRC까지 다룬다. 각 스킬은 방법론(SKILL.md)과 선택적으로 딸린 파이썬 스크립트·예시를 갖는다. 출처: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill) (MIT). 원문 문서: [`../upstream/cybersecurity/`](../upstream/cybersecurity/)

## 준비
- 스킬 방법론만 쓸 때는 추가 설치가 없다. 딸린 스크립트는 대부분 표준 라이브러리로 동작하고, 없는 선택 패키지는 경고만 남기고 해당 기능만 건너뛴다.
- 스크립트의 선택 의존성(필요한 스킬에서만): `requests`(01·09·20·21), `pyyaml`(02·09·11·20·22), `boto3`(10), `yara-python`(05), `scapy`(08), `pyaxmlparser`(17), `pymodbus`(18). 쓰려는 스킬이 안내할 때 `pip install <패키지>`로 넣는다.
- 스크립트 두 개(`06-threat-hunting`, `21-threat-intelligence`)는 플러그인 루트의 공용 패키지 `cyberskill/`을 가져온다. `install.sh`가 건 심볼릭 링크를 `.resolve()`로 따라가면 루트가 `plugins/cybersecurity/`로 잡혀 그대로 동작한다.
- 벤더링할 때 스크립트는 복사만 하고 실행하지 않는다. 각 스크립트는 `--help`로 인자를 확인한 뒤 명시적으로 돌린다.

## 범위·권한 주의
- 공격·침투 성격의 스킬(`03-exploit-development`, `14-red-team-ops`, `22-purple-team`)과 안전 민감 스킬(`16-ai-llm-security`, `18-ot-ics-security`)은 SKILL.md 안에 권한·범위 확인 게이트를 둔다. 본인이 소유했거나 서면으로 허가받은 대상에만 쓴다.
- `03-exploit-development`의 `payload_generator.py`는 인가된 테스트용 페이로드 문자열 템플릿을 만든다(업스트림 `SECURITY.md`에 의도된 동작으로 문서화). 네트워크 전송·자동 실행은 하지 않는다.

## 사용 예
- "이 리포의 의존성에서 알려진 취약점이 있는지 점검해 줘" (`02-vulnerability-scanner`)
- "이 코드가 OWASP Top 10 관점에서 위험한 데가 있는지 봐 줘" (`09-web-security`)
- "이 Terraform·클라우드 설정에서 보안 설정 미스를 찾아 줘" (`10-cloud-security`)
- "이 로그에서 이상 징후를 뽑고 Sigma 룰 초안을 만들어 줘" (`12-log-analysis`)
- "이 TLS 엔드포인트의 암호 스위트·인증서를 점검해 줘" (`13-crypto-analysis`)

<!-- GENERATED: scripts/gen-skill-docs.py 가 아래를 다시 만든다. 위쪽만 손으로 고친다. -->

## 스킬 목록 (22개)

### `/01-recon-osint`

Passive and active reconnaissance, subdomain enumeration, DNS analysis, technology fingerprinting, and OSINT data correlation for authorized security assessments

- 호출: `/01-recon-osint` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `resources/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/01-recon-osint)
- 이 레포 사본: [`plugins/cybersecurity/skills/01-recon-osint/SKILL.md`](../../plugins/cybersecurity/skills/01-recon-osint/SKILL.md)

### `/02-vulnerability-scanner`

Dependency auditing, CVE detection, configuration security review, CVSS scoring, and prioritized vulnerability reporting

- 호출: `/02-vulnerability-scanner` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/02-vulnerability-scanner)
- 이 레포 사본: [`plugins/cybersecurity/skills/02-vulnerability-scanner/SKILL.md`](../../plugins/cybersecurity/skills/02-vulnerability-scanner/SKILL.md)

### `/03-exploit-development`

Proof-of-concept development, payload crafting, shellcode analysis, and exploitation technique research for authorized security testing

- 호출: `/03-exploit-development` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/03-exploit-development)
- 이 레포 사본: [`plugins/cybersecurity/skills/03-exploit-development/SKILL.md`](../../plugins/cybersecurity/skills/03-exploit-development/SKILL.md)

### `/04-reverse-engineering`

Binary analysis, assembly interpretation, disassembly, decompilation, firmware RE, and protocol reverse engineering

- 호출: `/04-reverse-engineering` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/04-reverse-engineering)
- 이 레포 사본: [`plugins/cybersecurity/skills/04-reverse-engineering/SKILL.md`](../../plugins/cybersecurity/skills/04-reverse-engineering/SKILL.md)

### `/05-malware-analysis`

Static and dynamic malware analysis, YARA rule generation, sandbox configuration, behavioral profiling, and malware family classification

- 호출: `/05-malware-analysis` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/05-malware-analysis)
- 이 레포 사본: [`plugins/cybersecurity/skills/05-malware-analysis/SKILL.md`](../../plugins/cybersecurity/skills/05-malware-analysis/SKILL.md)

### `/06-threat-hunting`

IOC extraction, threat intelligence correlation, MITRE ATT&CK mapping, hunt hypothesis generation, and detection rule creation

- 호출: `/06-threat-hunting` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/06-threat-hunting)
- 이 레포 사본: [`plugins/cybersecurity/skills/06-threat-hunting/SKILL.md`](../../plugins/cybersecurity/skills/06-threat-hunting/SKILL.md)

### `/07-incident-response`

IR playbook execution, evidence collection, forensic timeline analysis, memory forensics, and post-incident reporting following NIST SP 800-61 and SANS PICERL methodology

- 호출: `/07-incident-response` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/07-incident-response)
- 이 레포 사본: [`plugins/cybersecurity/skills/07-incident-response/SKILL.md`](../../plugins/cybersecurity/skills/07-incident-response/SKILL.md)

### `/08-network-security`

Network traffic analysis, PCAP parsing, IDS/IPS rule creation, firewall configuration auditing, and network anomaly detection

- 호출: `/08-network-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/08-network-security)
- 이 레포 사본: [`plugins/cybersecurity/skills/08-network-security/SKILL.md`](../../plugins/cybersecurity/skills/08-network-security/SKILL.md)

### `/09-web-security`

OWASP Top 10 testing, injection vulnerability detection, API security assessment, authentication testing, and web vulnerability reporting for authorized assessments

- 호출: `/09-web-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/09-web-security)
- 이 레포 사본: [`plugins/cybersecurity/skills/09-web-security/SKILL.md`](../../plugins/cybersecurity/skills/09-web-security/SKILL.md)

### `/10-cloud-security`

AWS/Azure/GCP security auditing, container and Kubernetes hardening, Infrastructure as Code scanning, and cloud compliance assessment

- 호출: `/10-cloud-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/10-cloud-security)
- 이 레포 사본: [`plugins/cybersecurity/skills/10-cloud-security/SKILL.md`](../../plugins/cybersecurity/skills/10-cloud-security/SKILL.md)

### `/11-csoc-automation`

SOC alert triage, incident playbook automation, escalation workflows, shift reporting, and SOC KPI tracking

- 호출: `/11-csoc-automation` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/11-csoc-automation)
- 이 레포 사본: [`plugins/cybersecurity/skills/11-csoc-automation/SKILL.md`](../../plugins/cybersecurity/skills/11-csoc-automation/SKILL.md)

### `/12-log-analysis`

Security log parsing, anomaly detection, SIEM query building, Sigma rule creation, and correlation rule development across Splunk, Elastic, QRadar, and Microsoft Sentinel

- 호출: `/12-log-analysis` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/12-log-analysis)
- 이 레포 사본: [`plugins/cybersecurity/skills/12-log-analysis/SKILL.md`](../../plugins/cybersecurity/skills/12-log-analysis/SKILL.md)

### `/13-crypto-analysis`

SSL/TLS auditing, cipher suite analysis, hash algorithm identification, encryption implementation review, and cryptographic weakness detection in code

- 호출: `/13-crypto-analysis` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/13-crypto-analysis)
- 이 레포 사본: [`plugins/cybersecurity/skills/13-crypto-analysis/SKILL.md`](../../plugins/cybersecurity/skills/13-crypto-analysis/SKILL.md)

### `/14-red-team-ops`

Authorized red team engagement planning, C2 architecture design, attack methodology, lateral movement strategy, OPSEC, and professional reporting

- 호출: `/14-red-team-ops` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/14-red-team-ops)
- 이 레포 사본: [`plugins/cybersecurity/skills/14-red-team-ops/SKILL.md`](../../plugins/cybersecurity/skills/14-red-team-ops/SKILL.md)

### `/15-blue-team-defense`

System hardening, detection engineering, security baseline monitoring, patch management, defense-in-depth architecture, and security posture improvement

- 호출: `/15-blue-team-defense` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/15-blue-team-defense)
- 이 레포 사본: [`plugins/cybersecurity/skills/15-blue-team-defense/SKILL.md`](../../plugins/cybersecurity/skills/15-blue-team-defense/SKILL.md)

### `/16-ai-llm-security`

LLM and AI application security testing — prompt injection, jailbreak resistance, OWASP LLM Top 10 (2025), RAG and agent/tool-use security, model supply chain, and AI red teaming for authorized assessments

- 호출: `/16-ai-llm-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/16-ai-llm-security)
- 이 레포 사본: [`plugins/cybersecurity/skills/16-ai-llm-security/SKILL.md`](../../plugins/cybersecurity/skills/16-ai-llm-security/SKILL.md)

### `/17-mobile-security`

Android and iOS application security testing — static and dynamic analysis, APK/IPA inspection, OWASP MASVS/MASTG verification, secure-storage and transport review, and mobile malware triage for authorized assessments

- 호출: `/17-mobile-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/17-mobile-security)
- 이 레포 사본: [`plugins/cybersecurity/skills/17-mobile-security/SKILL.md`](../../plugins/cybersecurity/skills/17-mobile-security/SKILL.md)

### `/18-ot-ics-security`

Operational Technology and industrial control system security — Purdue model segmentation, industrial protocol analysis (Modbus, DNP3, S7, EtherNet/IP), PLC/HMI exposure, IEC 62443 alignment, and MITRE ATT&CK for ICS, for authorized and safety-conscious assessments

- 호출: `/18-ot-ics-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/18-ot-ics-security)
- 이 레포 사본: [`plugins/cybersecurity/skills/18-ot-ics-security/SKILL.md`](../../plugins/cybersecurity/skills/18-ot-ics-security/SKILL.md)

### `/19-grc-compliance`

Governance, risk, and compliance — risk assessment and scoring, control mapping across NIST CSF 2.0 / ISO 27001:2022 / SOC 2 / CIS Controls v8, gap analysis, audit evidence preparation, and security policy generation

- 호출: `/19-grc-compliance` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/19-grc-compliance)
- 이 레포 사본: [`plugins/cybersecurity/skills/19-grc-compliance/SKILL.md`](../../plugins/cybersecurity/skills/19-grc-compliance/SKILL.md)

### `/20-supply-chain-security`

Software supply chain security — SBOM generation and analysis, dependency confusion and typosquatting detection, malicious package indicators, CI/CD pipeline hardening, and artifact provenance/signing (SLSA, Sigstore)

- 호출: `/20-supply-chain-security` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/20-supply-chain-security)
- 이 레포 사본: [`plugins/cybersecurity/skills/20-supply-chain-security/SKILL.md`](../../plugins/cybersecurity/skills/20-supply-chain-security/SKILL.md)

### `/21-threat-intelligence`

Cyber threat intelligence production — the intelligence cycle, IOC extraction/normalization/enrichment, STIX/TAXII and MISP, structured analytic models (Diamond, Kill Chain, ATT&CK), source scoring, actor/campaign tracking, and finished intelligence reporting

- 호출: `/21-threat-intelligence` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/21-threat-intelligence)
- 이 레포 사본: [`plugins/cybersecurity/skills/21-threat-intelligence/SKILL.md`](../../plugins/cybersecurity/skills/21-threat-intelligence/SKILL.md)

### `/22-purple-team`

Collaborative purple-team operations — threat-informed adversary emulation planning (ATT&CK, CTID, Atomic Red Team, CALDERA), the detect-tune-validate loop, detection coverage measurement (DeTT&CT/Navigator), safe execution and deconfliction, and MTTD/coverage reporting

- 호출: `/22-purple-team` 또는 설명에 맞는 요청을 하면 자동으로 쓰임
- 딸린 폴더: `examples/`, `scripts/`
- 원조 GitHub: [Masriyan/Claude-Code-CyberSecurity-Skill](https://github.com/Masriyan/Claude-Code-CyberSecurity-Skill/tree/HEAD/skills/22-purple-team)
- 이 레포 사본: [`plugins/cybersecurity/skills/22-purple-team/SKILL.md`](../../plugins/cybersecurity/skills/22-purple-team/SKILL.md)
