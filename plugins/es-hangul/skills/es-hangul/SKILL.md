---
name: es-hangul
description: JavaScript·TypeScript에서 한글을 다룰 때 직접 구현하지 않고 toss/es-hangul 함수를 고르고 쓰게 한다. 조사 붙이기(이/가, 을/를), 받침 확인, 초성 추출·초성 검색, 자모 분리·조합, 숫자·금액을 한글로, 수사·서수사, 로마자 표기, 표준 발음, 한영 키보드 변환 요청이나 그런 코드를 짜거나 리뷰할 때 사용.
argument-hint: "[하려는 일 또는 붙여 넣은 코드]"
---

# es-hangul

한글 처리 코드를 손으로 짜기 전에 [es-hangul](https://github.com/toss/es-hangul)(MIT, 토스)에 맞는 함수가 있는지 먼저 본다. 함수별 시그니처와 예시는 `references/api.md`에 있다(원본 한국어 API 문서를 `vendor.sh`가 모아 둔 것). 필요한 함수 절만 찾아 읽는다.

## 순서

1. 프로젝트의 `package.json`에서 `es-hangul` 설치 여부와 버전을 확인한다. 없으면 설치를 제안한다(`npm i es-hangul`, 프로젝트의 패키지 매니저를 따른다). v1에서 올리는 중이면 references의 함수명이 v2 기준이라는 점을 알린다.
2. 아래 표로 후보를 고르고 `references/api.md`에서 그 함수의 시그니처·예시를 읽는다.
3. `import { 함수 } from 'es-hangul'`로 쓰고, 기존에 손으로 짠 정규식·유니코드 계산이 있으면 그 자리를 대체한다. 동작이 같은지 예시 입력으로 확인한다.
4. 맞는 함수가 없으면 없다고 말하고 직접 구현한다. 비슷한 함수를 억지로 끼우지 않는다.

## 함수 고르기

| 하려는 일 | 함수 |
|---|---|
| 단어에 맞는 조사 붙이기 / 조사만 고르기 | `josa`, `josa.pick` |
| 받침 유무(특정 받침 포함) | `hasBatchim` |
| 초성 추출, 초성 검색 | `getChoseong` |
| 중성·종성 얻기 | `getJungseong`, `getJongseong` |
| 자모로 분리 / 그룹으로 분리 / 완성형 한 글자 분리 | `disassemble`, `disassembleToGroups`, `disassembleCompleteCharacter` |
| 자모·문장 조합, 초·중·종성으로 글자 만들기, 모음 합치기 | `assemble`, `combineCharacter`, `combineVowels` |
| 초성·중성·종성 자리에 올 수 있는지 | `canBeChoseong`, `canBeJungseong`, `canBeJongseong` |
| 입력 중인 마지막 글자 한 단계 지우기 | `removeLastCharacter` |
| 숫자를 한글로(순한글, 혼합 표기), 금액을 한글로 | `numberToHangul`, `numberToHangulMixed`, `amountToHangul` |
| 수사(하나, 둘), 서수사(첫째), 날짜 세기(하루, 이틀) | `susa`, `seosusa`, `days` |
| 로마자 표기, 표준 발음으로 바꾸기 | `romanize`, `standardizePronunciation` |
| 한영 키보드 오타 변환 | `convertQwertyToHangul`, `convertHangulToQwerty`, `convertQwertyToAlphabet`, `convertAlphabetToQwerty`(이 함수는 API 문서가 없어 `node_modules/es-hangul`의 타입 정의를 본다) |
