### 먼저 다음 명령어를 실행시켜서 예제 데이터를 다운 받도록 하자.
```
wget https://raw.githubusercontent.com/JunKimCNU/JunKimLabTutorial/main/task02_parsing/cb4856.substr.fa
wget https://raw.githubusercontent.com/JunKimCNU/JunKimLabTutorial/main/task02_parsing/lsp41_scaffolds.substr.fa
```
### 그 뒤 다음 질문에 대해 답해보자
```
(1) lsp41_scaffolds.substr.fa 에 포함된 contig 개수는?(힌트: 모든 contig는 > 로 시작하는 문장 다음에 염기서열 정보가 따라옴)
(2) cb4856.substr.fa 파일에 포함된 contig 개수는?
(3) cb4856.substr.fa 에 포함된 contig 이름은 "tig00015902|quiver|quiver|pilon|pilon" 등으로 되어있다. 여기서 |quiver|quiver|pilon|pilon 부분을 제거하고 싶다면 어떻게 해야 할까?
(4) Assemblytics_structural_variants.bed 는 50 bp 이상의 structural variants에 관한 정보를 포함하는 tab으로 분리된 형식이다(tab-separated values; tsv). 2번 염색체에는 몇 개의 variation이 존재하는가? (힌트: grep -P "\t" or grep -w or grep "<>")
(5) 2번 염색체에 생긴 variation 중 insertion은 몇 개인가? (힌트: 7번째 컬럼 정보를 확인해보기)
(6) 이 중 가장 큰 길이를 지닌 15개에 대한 정보만 포함하는 파일을 만들려면 어떻게 해야 하는가?
```
