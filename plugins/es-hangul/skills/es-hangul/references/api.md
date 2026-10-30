# es-hangul API (한국어 문서 모음)

원본: https://github.com/toss/es-hangul/tree/0ecc91e/docs/src/pages/docs/api

# core

## assemble

인자로 받은 배열에 담긴 한글 문장과 문자를 한글 규칙에 맞게 합성합니다.

```typescript
function assemble(
  // 한글 문자와 문장을 담고 있는 배열
  fragments: string[]
): string;
```

## canBeChoseong

인자로 받은 문자가 초성으로 위치할 수 있는 문자인지 검사합니다.

```typescript
function canBeChoseong(character: string): boolean;
```

### Examples

```typescript
canBeChoseong('ㄱ'); // true
canBeChoseong('ㅃ'); // true
canBeChoseong('ㄱㅅ'); // false
canBeChoseong('ㅏ'); // false
canBeChoseong('가'); // false
```

## canBeJongseong

인자로 받은 문자가 종성으로 위치할 수 있는 문자인지 검사합니다.

```typescript
function canBeJongseong(character: string): boolean;
```

### Examples

```typescript
canBeJongseong('ㄱ'); // true
canBeJongseong('ㄱㅅ'); // true
canBeJongseong('ㅎㄹ'); // false
canBeJongseong('가'); // false
canBeJongseong('ㅏ'); // false
canBeJongseong('ㅗㅏ'); // false
```

## canBeJungseong

인자로 받은 문자가 중성으로 위치할 수 있는 문자인지 검사합니다.

```typescript
function canBeJungseong(character: string): boolean;
```

### Examples

```typescript
canBeJungseong('ㅏ'); // true
canBeJungseong('ㅗㅏ'); // true
canBeJungseong('ㅏㅗ'); // false
canBeJungseong('ㄱ'); // false
canBeJungseong('ㄱㅅ'); // false
canBeJungseong('가'); // false
```

## combineCharacter

인자로 받은 초성, 중성, 종성을 조합해 한글 1자를 반환합니다.

```typescript
function combineCharacter(choseong: string, jungseong: string, jongseong?: string): string;
```

### Examples

```typescript
combineCharacter('ㄱ', 'ㅏ', 'ㅂㅅ'); // '값'
combineCharacter('ㅌ', 'ㅗ'); // '토'
```

## combineVowels

인자로 두 개의 모음을 받아 합성하여 겹모음을 생성합니다. 만약 올바른 한글 규칙으로 합성할 수 없는 모음들이라면 단순 Join합니다.

```typescript
function combineVowels(vowel1: string, vowel2: string): string;
```

### Examples

```typescript
combineVowels('ㅗ', 'ㅏ'); // 'ㅘ'
combineVowels('ㅗ', 'ㅐ'); // 'ㅙ'
combineVowels('ㅗ', 'ㅛ'); // 'ㅗㅛ'
```

## disassemble

한글 문자열을 글자별로 초성/중성/종성 단위로 완전히 분리하여, 하나의 문자열로 만듭니다.

자세한 예시는 아래 Example을 참고하세요.

```typescript
function disassemble(
  // 분리할 한글 문자열
  str: string
): string;
```

### Examples

```tsx
disassemble('값'); // 'ㄱㅏㅂㅅ'
disassemble('값이 비싸다'); // 'ㄱㅏㅂㅅㅇㅣ ㅂㅣㅆㅏㄷㅏ'
disassemble('ㅘ'); // 'ㅗㅏ'
disassemble('ㄵ'); // 'ㄴㅈ'
```

## disassembleCompleteCharacter

완전한 한글 문자열을 초성, 중성, 종성으로 분리합니다.

```typescript
function disassembleCompleteCharacter(letter: string): ReturnTypeDisassembleCompleteCharacter | undefined;
```

### Examples

```tsx
disassembleCompleteCharacter('값'); // { choseong: 'ㄱ', jungseong: 'ㅏ', jongseong: 'ㅂㅅ' }
disassembleCompleteCharacter('리'); // { choseong: 'ㄹ', jungseong: 'ㅣ', jongseong: '' }
disassembleCompleteCharacter('빚'); // { choseong: 'ㅂ', jungseong: 'ㅣ', jongseong: 'ㅈ' }
disassembleCompleteCharacter('박'); // { choseong: 'ㅂ', jungseong: 'ㅏ', jongseong: 'ㄱ' }
```

## disassembleToGroups

한글 문자열을 글자별로 초성/중성/종성 단위로 완전히 분리합니다.

`ㄵ`와 같은 겹자음은 `['ㄴ', 'ㅈ']`와 같이 풀고, `ㅘ`와 같은 겹모음은 `['ㅗ', 'ㅏ']`와 같이 풉니다.

자세한 예시는 아래 Example을 참고하세요.

```typescript
function disassembleToGroups(
  // 분리할 한글 문자열
  str: string
): string[][];
```

### Examples

```typescript
disassembleToGroups('사과'); // [['ㅅ', 'ㅏ'], ['ㄱ', 'ㅗ', 'ㅏ']]
disassembleToGroups('ㅘ'); // [['ㅗ', 'ㅏ']]
disassembleToGroups('ㄵ'); // [['ㄴ', 'ㅈ']]
```

## getChoseong

단어에서 초성을 추출합니다. (예: `사과` -> `'ㅅㄱ'`)

자세한 예시는 아래 Example을 참고하세요.

```typescript
function getChoseong(
  // 초성을 추출 할 한글 문자열
  word: string
): string;
```

### Examples

```tsx
getChoseong('사과'); // 'ㅅㄱ'
getChoseong('띄어 쓰기'); // 'ㄸㅇ ㅆㄱ'
```

## getJongseong

단어에서 종성을 추출합니다. (예: `별` -> `'ㄹ'`)

자세한 예시는 아래 Example을 참고하세요.

```typescript
function getJongseong(
  // 종성을 추출할 한글 문자열
  word: string
): string;
```

### Examples

```tsx
getJongseong('별');        // 'ㄹ'
getJongseong('하늘');      // 'ㄹ'
getJongseong('띄어 쓰기'); // ' '
getJongseong('파이팅');    // 'ㅇ'
```

## getJungseong

단어에서 중성을 추출합니다. (예: `사과` -> `'ㅏㅘ'`)

자세한 예시는 아래 Example을 참고하세요.

```typescript
function getJungseong(
  // 중성을 추출할 한글 문자열
  word: string
): string;
```

### Examples

```tsx
getJungseong('사과');      // 'ㅏㅘ'
getJungseong('하늘');      // 'ㅏㅡ'
getJungseong('띄어 쓰기'); // 'ㅢㅓ ㅡㅣ'
```

## hasBatchim

한글 문자열의 마지막 글자가 받침이 있는지 확인합니다.

```typescript
hasBatchim(
  str: string,
  options?: { only?: "single" | "double" }
): boolean
```

### Examples

```typescript
hasBatchim('값'); // true
hasBatchim('토'); // false
hasBatchim('갑', { only: 'single' }); // true
hasBatchim('값', { only: 'single' }); // false
hasBatchim('토', { only: 'double' }); // false
```

## josa

한글 문자열에 `'이/가'`, `'을/를'`, `'은/는'`, `'으로/로'`, `'와/과'`, `'이나/나'`, `'이란/란'`, `'아/야'`, `'이랑/랑'`, `'이에요/예요'`, `'으로서/로서'`, `'으로써/로써'`, `'으로부터/로부터'`, `'이라/라'` 와 같은 조사를 붙여줍니다.

```typescript
function josa(
  // 조사를 붙일 한글 문자열
  word: string,
  // 붙일 조사
  josa:
    | '이/가'
    | '을/를'
    | '은/는'
    | '으로/로'
    | '와/과'
    | '이나/나'
    | '이란/란'
    | '아/야'
    | '이랑/랑'
    | '이에요/예요'
    | '으로서/로서'
    | '으로써/로써'
    | '으로부터/로부터'
    | '이라/라'
): string;
```

### Examples

```typescript
josa('샴푸', '이/가'); // '샴푸가'
josa('칫솔', '이/가'); // '칫솔이'
josa('바깥', '으로/로'); // '바깥으로'
josa('내부', '으로/로'); // '내부로'
```

## josa.pick

`josa.pick` 메서드는 주어진 한글 문자열과 조사 옵션에 따라 적절한 조사를 선택하여 반환합니다. 이 메서드는 [josa](https://es-hangul.slash.page/docs/api/core/josa) 함수 내에서 사용되며, 문자열의 마지막 글자에 따라 조사의 형태가 결정됩니다.

```typescript
function josa.pick(
  // 조사를 선택할 기준 한글 문자열
  word: string,
  // 선택하려는 조사 옵션
  josa:
    | '이/가'
    | '을/를'
    | '은/는'
    | '으로/로'
    | '와/과'
    | '이나/나'
    | '이란/란'
    | '아/야'
    | '이랑/랑'
    | '이에요/예요'
    | '으로서/로서'
    | '으로써/로써'
    | '으로부터/로부터'
    | '이라/라'
): string;
```

`word`: 조사를 붙일 한글 문자열입니다.<br/>
`josa`: 붙일 조사를 지정합니다. 이는 '이/가', '을/를', '은/는', '으로/로', '와/과', '이나/나', '이란/란', '아/야', '이랑/랑', '이에요/예요', '으로서/로서', '으로써/로써', '으로부터/로부터', '이라/라'와 같은 옵션들 중 하나를 선택할 수 있습니다.

### Behavior

josa.pick은 주어진 문자열의 마지막 글자가 받침이 있는지, 그리고 특정 조건(예: '로'와 같은 조사 사용시)을 기반으로 적절한 조사를 선택합니다.

특히 다음과 같은 규칙을 따릅니다(예외도 존재합니다)

- 문자열의 마지막 글자에 받침이 있으면 보통 첫 번째 조사를 사용합니다 (예: '이/가'의 경우 '이').
- 받침이 없는 경우 두 번째 조사를 사용합니다 (예: '이/가'의 경우 '가').
- 특별한 경우, 예를 들어 'ㄹ' 받침이 있는 경우 '로' 조사를 사용할 때 조건에 따라 다르게 적용될 수 있습니다.

### Examples

```typescript
josa.pick('샴푸', '이/가'); // '가'
josa.pick('칫솔', '이/가'); // '이'
josa.pick('바깥', '으로/로'); // '으로'
josa.pick('내부', '으로/로'); // '로'
```

## removeLastCharacter

인자로 주어진 한글 문자열에서 가장 마지막 문자 하나를 제거하여 반환합니다.  

자세한 예시는 아래 Example을 참고하세요.

```typescript
function removeLastCharacter(
  // 한글 문자열
  words: string
): string;
```

### Examples

```tsx
removeLastCharacter('안녕하세요 값'); // '안녕하세요 갑'
removeLastCharacter('프론트엔드'); // '프론트엔ㄷ'
removeLastCharacter('일요일'); // '일요이'
removeLastCharacter('전화'); // '전호'
removeLastCharacter('신세계'); // '신세ㄱ'
```

# keyboard

## convertHangulToQwerty

한글을 qwerty 자판과 매칭되는 영어 알파벳으로 변환합니다.

```typescript
function convertHangulToQwerty(word: string): string;
```

### Examples

```typescript
convertHangulToQwerty('뮻'); // 'abc'
convertHangulToQwerty('겨노'); // 'rush'
convertHangulToQwerty('님노'); // 'slash'
convertHangulToQwerty('RㅏㄱEㅜrl'); // 'RkrEnrl'
convertHangulToQwerty('ㅙㅜㅎ 햐ㅣ애ㅜㅎ'); // 'hong gildong'
convertHangulToQwerty('ㄴ대ㅕㅣ, ㅏㅐㄱㄷㅁ'); // 'seoul, korea'
```

## convertQwertyToAlphabet

영어 알파벳을 qwerty 자판과 매칭되는 한글 음소로 변환합니다.

```typescript
function convertQwertyToAlphabet(word: string): string;
```

### Examples

```typescript
convertQwertyToAlphabet('abc'); // 'ㅁㅠㅊ'
convertQwertyToAlphabet('ABC'); // 'ㅁㅠㅊ'
convertQwertyToAlphabet('vm론트'); // 'ㅍㅡ론트'
convertQwertyToAlphabet('RㅏㄱEㅜrl'); // 'ㄲㅏㄱㄸㅜㄱㅣ'
```

## convertQwertyToHangul

영어 알파벳을 qwerty 자판과 매칭되는 한글 문자와 문장으로 변환합니다.

```typescript
function convertQwertyToHangul(word: string): string;
```

### Examples

```typescript
convertQwertyToHangul('abc'); // '뮻'
convertQwertyToHangul('ABC'); // '뮻'
convertQwertyToHangul('vm론트'); // '프론트'
convertQwertyToHangul('RㅏㄱEㅜrl'); // '깍뚜기'
```

# number

## amountToHangul

<Callout type="error" emoji="⚠️">
  Deprecated: 더 유연하게 사용 가능한 [`numberToHangul`](./numberToHangul)을 이용해 주세요.
</Callout>

숫자나 문자를 [국립국어원](https://ko.dict.naver.com/#/correct/korean/info?seq=602) 규칙의 한글 읽기 문자열로 변환합니다.

자세한 예시는 아래 Example을 참고하세요.

```typescript
function amountToHangul(amount: string | number): string;
```

### Examples

```tsx
amountToHangul('15,201,100'); // '일천오백이십만천백'
amountToHangul('120,030원'); // '일십이만삼십'
amountToHangul('12345.6789'); // '일만이천삼백사십오점육칠팔구'
amountToHangul(15_201_100); // '일천오백이십만천백'
```

## days

숫자를 순우리말 날로 바꿔줍니다. 주어진 숫자가 0보다 크고 30 이하일 때 유효합니다.

```typescript
function days(
  // 변환할 숫자
  num: number
): string;
```

### Examples

```typescript
days(1); // '하루'
days(2); // '이틀'
days(3); // '사흘'
days(10); // '열흘'
days(11); // '열하루'
days(20); // '스무날'
days(29); // '스무아흐레'
days(30); // '서른날'
```

## numberToHangul

주어진 숫자를 한자어 수사로 바꿔줍니다.
다양한 요구사항에 대응하도록 '만(萬)' 단위로 띄어쓰기를 지원합니다.

```typescript
function numberToHangul(input: number, options?: { spacing?: boolean }): string;
```

### Examples

```tsx
numberToHangul(210_000); // '이십일만';
numberToHangul(12_345); // '일만이천삼백사십오';
numberToHangul(123_456_780); // '일억이천삼백사십오만육천칠백팔십';
numberToHangul(-12_345.678); // '마이너스일만이천삼백사십오점육칠팔';
numberToHangul(123_456_780, { spacing: true }); // '일억 이천삼백사십오만 육천칠백팔십';
```

## numberToHangulMixed

주어진 숫자에 대해 4자리마다 달라지는 한글의 숫자 단위를 자동으로 붙여주며,
다양한 요구 사항에 맞춰 '만(萬)' 단위 기준으로 띄어쓰기도 지원합니다.

```typescript
function numberToHangulMixed(input: number, options?: { spacing?: boolean }): string;
```

### Examples

```tsx
numberToHangulMixed(210_000); // '21만';
numberToHangulMixed(12_345); // '1만2,345';
numberToHangulMixed(123_456_780); // '1억2,345만6,780';
numberToHangulMixed(-12_345.678); // '-1만2,345.678';
numberToHangulMixed(123_456_780, { spacing: true }); // '1억 2,345만 6,780';
```

## seosusa

숫자를 한글 서수사로 변환합니다.
1부터 99까지의 정수는 순우리말 서수사 문자열로 변환합니다.
100 이상의 정수는 한자어 서수사 문자열로 변환합니다.

```typescript
function seosusa(
  // 변환할 숫자
  num: number
): string;
```

### Examples

```typescript
seosusa(1); // '첫째'
seosusa(2); // '둘째'
seosusa(3); // '셋째'
seosusa(10); // '열째'
seosusa(11); // '열한째'
seosusa(12); // '열두째'
seosusa(13); // '열셋째'
seosusa(20); // '스무째'
seosusa(21); // '스물한째'
seosusa(99); // '아흔아홉째'
seosusa(100); // '백째'
```

## susa

숫자를 순 우리말 [수사](https://ko.dict.naver.com/#/entry/koko/d0ce2b674cae4b44b9028f648dd458b0)로 변환하거나 [수 관형사](https://ko.dict.naver.com/#/entry/koko/c513782b82554ff499c80ec616c5b611)로 변환합니다. 주어진 숫자가 0보다 크고 100 이하일 때 유효합니다.

```typescript
function susa(
  // 변환할 숫자
  num: number,
  // 수 관형사를 사용할지 여부
  classifier?: boolean
): string;
```

### Examples

```typescript
susa(1); // '하나'
susa(2); // '둘'
susa(11); // '열하나'
susa(21); // '스물하나'
susa(99); // '아흔아홉'
susa(100); // '백'

susa(1, true); // '한'
susa(2, true); // '두'
susa(11, true); // '열한'
susa(20, true); // '스무'
susa(21, true); // '스물한'
```

# pronunciation

## romanize

한글 문자열을 로마자로 변경합니다.

자세한 예시는 아래 Example을 참고하세요.

```typescript
function romanize(hangul: string): string;
```

### Examples

```tsx
romanize('백마'); // 'baengma'
romanize('학여울'); // 'hangnyeoul'
romanize('해돋이'); // 'haedoji'
romanize('좋고'); // 'joko'
romanize('압구정'); // 'apgujeong'
romanize('구미'); // 'gumi'
romanize('대관령'); // 'daegwallyeong'
romanize('ㄱ'); // 'g'
romanize('한국어!'); // 'hangugeo!'
romanize('안녕하세요'); // 'annyeonghaseyo'
```

## standardizePronunciation

한글 문자열을 표준 발음법으로 변경합니다.

자세한 예시는 아래 Example을 참고하세요.

```typescript
function standardizePronunciation(
  // 한글 문자열을 입력합니다.
  hangul: string,
  options: {
    // 경음화 등의 된소리를 적용할지 여부를 설정합니다. 기본값은 true입니다.
    hardConversion: boolean;
  } = { hardConversion: true }
): string;
```

### Examples

```tsx
standardizePronunciation('디귿이'); // '디그시'
standardizePronunciation('굳이'); // '구지'
standardizePronunciation('담요'); // '담뇨'
standardizePronunciation('침략'); // '침냑'
standardizePronunciation('먹는'); // '멍는'
standardizePronunciation('신라'); // '실라'
standardizePronunciation('놓고'); // '노코'
standardizePronunciation('곧이듣다'); // '고지듣따'
standardizePronunciation('곧이듣다', { hardConversion: false }); // '고지듣다'
standardizePronunciation('닦다'); // '닥따'
standardizePronunciation('닦다', { hardConversion: false }); // '닥다'
standardizePronunciation('있다'); // '읻따'
standardizePronunciation('있다', { hardConversion: false }); // '읻다'
standardizePronunciation('핥다'); // '할따'
standardizePronunciation('핥다', { hardConversion: false }); // '할다'
standardizePronunciation('젊다'); // '점따'
standardizePronunciation('젊다', { hardConversion: false }); // '점다'
```
