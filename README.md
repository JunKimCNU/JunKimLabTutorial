## 김준네 연구실 튜토리얼
## 목록
- [튜토리얼을 시작하시는 걸 환영합니다](#wellcome_to_JunKimLabTutorial)
- [대용량 시퀀싱 데이터에 대한 기본적인 이해](#basis_for_huge_sequencing_data)
- [까만 바탕에 하얀 글씨-리눅스에서 작업 하기](#linux_tutorial)
- [1주차 숙제에 대한 간략하면서도 쓸데없이 긴 해설](#hw1_ans)
- [시퀀싱 데이터 다루기 101](#how_to_handle_sequencing_data)
- [염기서열을 다뤄보기-포맷 익히기](#atgc)
- [2주차 숙제에 대한 간략하면서도 쓸데없이 긴 해설](#hw2_ans)

## <a name="wellcome_to_JunKimLabTutorial"></a> 튜토리얼을 시작하시는 걸 환영합니다

- 이 자료는 충남대학교 생명시스템과학대학 생명정보융합학과에서 일하고 있는 김준이 만들었습니다.
- 일단은 제 연구실에 관심 있는 학생들에게 컴퓨터를 이용해 어떻게 생명현상을 이해할 수 있는지 가르쳐주기 위해 만든 자료입니다.
- 주로 **롱리드 시퀀싱(long-read sequencing)** 데이터과 이를 활용한 다양한 생물학 연구를 다룹니다.
- 교육용 목적으로는 어떤 식으로 이용해도 좋으니 편하게 가져다 쓰시길 바랍니다.
- 궁금한 점은 위쪽에 보이는 [Issues](https://github.com/JunKimCNU/JunKimLabTutorial/issues)에 남기시면 됩니다.
- 각 실습 자료는 읽는 데 1시간 이내, 실습하는 데 3-4시간 정도를 들이면 충분하도록 짰습니다만, 익숙해지는 정도에 따라 시간 차가 있을 순 있습니다.
- 중요한 건 하다 보면 금방 익숙해질 거라는 점입니다. 사람마다 시간 차가 있을지언정, 충분한 시간만 들이면 누구나 익숙해질 수 있습니다.
- 기본적으로는 코딩하는 법을 다루지 않습니다. 좋은 프로그램이 이미 정말 많이 개발돼 있기 때문에 코딩할 필요가 거의 없기 때문입니다.
- 그렇기 때문에 주로 다루는 일은 이런 프로그램을 갖다 쓰는 방법입니다. 코딩보다는 스크립팅에 가깝습니다.
- 현존하는 다양한 프로그램만 잘 활용할 줄 알아도 수많은 생물학 연구를 해낼 수 있습니다.
- 이 튜토리얼을 다 끝낸 뒤에는 본격적인 연구를 시작할 수 있는 수준일 겁니다. 그렇게 되길 기대합니다.

## <a name="basis_for_huge_sequencing_data"></a> 대용량 시퀀싱 데이터에 대한 기본적인 이해
- 본 튜토리얼에서는 대용량 시퀀싱 데이터에 대해 이해하고, 고성능 컴퓨터를 이용해 이를 처리하는 방식에 대해 배웁니다.
### 시퀀싱이란?
- 그 첫 번째 단계로 시퀀싱 데이터가 무엇인지, 왜 고성능 컴퓨터를 활용해야 하는지 알아보고자 합니다.
- 시퀀싱이란 DNA, RNA, 단백질 등 실처럼 생긴 선형(linear) 분자 안에 담긴 단량체(monomer)의 정보를 읽어내는 과정을 가리킵니다.
- 이들 DNA, RNA, 단백질은 생물학의 중심 원리(central dogma)에 등장하는 가장 핵심 생체 분자입니다. 그러니 이 분자들에 담긴 정보를 읽어내 사람마다 어떤 DNA/RNA/단백질이 다르기에 어떤 사람은 특정한 병에 더 잘 걸리는데 다른 사람은 그렇지 않은지 확인하고 싶은 연구자가 많습니다. 이런 표현형 차이를 만들어내는 유전형 등의 차이를 이해할 수 있다면 진단이나 약물 개발과 치료 등 다양한 시도를 해볼 수 있을 테니까요.
- 우리가 맨눈으로도 이런 선형 분자에 담긴 정보를 읽어낼 수 있다면 좋겠지만, 현실적으로는 불가능합니다. 그러니 우리 눈을 대신할 수 있는 간접적인 방식을 통해 선형 분자 안에 담긴 단량체 정보를 확인하는 일이 필요합니다. 그리고 이렇게 확인한 정보를 우리가 이해할 수 있는 문자 형태의 분자로 바꾸면 좋겠죠. 이 과정이 시퀀싱 과정인 셈입니다. 시퀀싱이란 말 그대로, 기다란 선형 분자 안에 담긴 단량체의 정보를 순서대로 읽어내는 것입니다.

### DNA 시퀀싱
- DNA는 이러한 주요 선형 분자 중에서도 가장 효과적으로 시퀀싱 데이터를 대량 생산할 수 있는 주요 생체 분자입니다. 생체의 DNA는 주로 아데닌, 타이민, 구아닌, 사이토신이라는 4개 분자로 이뤄져 있습니다. 그리고 이 4개의 분자가 각각 양손을 내민 채 옆 분자를 붙들고 있는 게 DNA라는 선형 분자의 생김새입니다.
- 예컨대 사람의 DNA는 약 30억 개의 단량체로 이루어져 있는데요, 이를 30억 **염기쌍**(basepair; bp)이라고 부릅니다. 이들 중 거의 대부분은 23개의 염색체에 담겨있으며, 이러한 염색체는 그 자체로 나름 안정화된 구조를 이룹니다. 참고로 DNA는 2개의 실이 서로 마주 보고 뱀처럼 휘감긴 형태를 띠고 있는데, 이중나선이라는 표현은 여기에서 나온 것입니다.
- DNA를 시퀀싱한다는 것은, 이처럼 사람의 DNA에 있는 단량체 정보를 순서대로 읽어내 우리가 이해할 수 있는 문자로 변환하는 것입니다. 여기서 아데닌은 A, 타이민은 T, 구아닌은 G, 사이토신은 C로 표현합니다. 시퀀싱이 끝난 데이터는 예를 들면 ATGCTAGCTTTAGCCTAGCTACGT 같은 문자열이 됩니다.
- DNA를 시퀀싱할 수 있는 기법은 상당히 많고 지금도 계속해서 개발되고 있습니다만, 본 튜토리얼에서는 이를 크게 둘로 나누고자 합니다. 하나는 숏리드(short-read) 시퀀싱 기법이며, 다른 하나는 롱리드 시퀀싱 기법입니다. 이는 한번에 읽어내는 DNA 분자의 길이에 따라 나누는 구분입니다. 숏리드 시퀀싱이란 대개 300염기쌍 미만의 DNA 단량체 서열을 한번에 읽어내는 기법을 가리키며, 롱리드 시퀀싱이란 보통 대부분의 서열 정보가 10,000염기쌍 이상의 DNA 단량체 서열을 한번에 읽어내는 기법을 가리킵니다. 이렇게 한번에 읽어낸 DNA 서열 정보를 **리드**라고 부릅니다.
- DNA 시퀀싱 실험 과정을 이해함으로써 리드에 대해 조금 더 정확하게 알아봅시다.
- DNA 시퀀싱 과정은 실험마다 차이가 있긴 합니다만, 보통은 DNA를 자르는 데에서 시작합니다. DNA를 자르는 이유는 단순합니다. 한없이 긴 DNA라면, 그 안에 담긴 단량체 정보를 처음부터 끝까지 한번에 읽어낼 수 있는 기술이 없는 것이나 다름 없기 때문입니다(있긴 합니다). 그렇기 때문에 DNA를 시퀀싱하는 경우에는 대부분 DNA를 잘라서 읽기 편한 길이로 맞춰줍니다. 숏리드 시퀀싱 기법이라면 500염기쌍에서 700염기쌍 정도로, 롱리드 시퀀싱 기법이라면 20,000염기쌍이나 그보다 긴 길이 정도로 맞춰줍니다. 그리고 이 조각난 DNA에 담긴 단량체 정보를 A, T, G, C 등으로 바꿔주는 것입니다. 다시 한 번 강조하자면, 이렇게 한번에 읽은 DNA 조각을 리드라고 부릅니다.
- 보통 이런 DNA 조각, 즉 리드를 한두 개만 읽진 않습니다. 사람의 유전체 정보를 분석한다고 하면 전체를 적어도 한 번은 읽어야 할 테니 30억 염기쌍은 읽어야겠죠. 대충 150염기쌍을 읽어내는 숏리드 시퀀싱 기법으로는 이런 리드를 적어도 2천만 개를 읽어야 합니다. 대충 15,000염기쌍을 읽어내는 롱리드 시퀀싱 기법이라면 20만 개면 거뜬하죠. 물론 실제로는 이러한 숫자의 30배 정도를 생산하긴 합니다.

### DNA 시퀀싱 데이터 양식
- DNA에 담긴 정보는 여러 형태로 저장될 수 있습니다만, 가장 표준화된 데이터 양식(format)은 크게 두 가지가 있습니다. 하나는 **FASTA**, 다른 하나는 **FASTQ**입니다. 파스타와 파스트큐, 패스트에이와 패스트큐 등등 다양하게 불립니다. 대충 아무렇게나 불러도 다 알아듣는다는 뜻입니다.
- 참고로 DNA에만 쓰이는 양식은 아니며, 선형 분자라면 어떤 것이든 표현할 수 있습니다.
- FASTA 포맷은 DNA 분자의 **이름**과 단량체 **서열** 정보를 담고 있습니다. 예를 들면 다음과 같은 형태를 띱니다.
```
>read_00001
ATGCTACGTACGTACGTAGCTACGATCGATCGATCGTAGTACACAATTTCGCGCCGCTCG
AAATCTCGGGCTCCCATCACGTACGAGCTAGCTAGCTAGCTACGATCGATCGATCGATGT
```
- FASTA 포맷에서 DNA 분자의 이름은 ```>```로 시작합니다. 여기서는 ```read_00001```이라는 것이 해당 DNA의 이름이 됩니다. 그리고 ```ATGCT......GATGT```에 해당하는 부분이 이 read_00001이라는 DNA 분자에 담겨있던 단량체의 서열 정보가 됩니다.
- FASTA는 한 파일에 여러 개의 DNA 서열 정보가 담기기도 합니다. 다음과 같이 여러 줄로 DNA 정보가 표현되는 것이죠.
```
>read_00001
ATGCTACGTACGTACGTAGCTACGATCGATCGATCGTAGTACACAATTTCGCGCCGCTCG
AAATCTCGGGCTCCCATCACGTACGAGCTAGCTAGCTAGCTACGATCGATCGATCGATGT
>read_00002
ATGATAAATCGTACGATTTTTTTCCCCCCCGATGCTAGTCGATCGAAAACGTACGTAGCT
TAGCTAGCTTTACACACGGGGAAAGTGCAAAGTCGTACGGGCACATGTCGGACTAGCTAG
GTAGCTAGCTAACAGTCGCTGGCATGCATCATTGCTAGCTAGCCGCTAGCTAGTCGATTT
```
- 이때 한 DNA의 정보가 시작되고 끝나는 위치는 DNA의 이름을 알려주는 ```>``` 문자를 통해 확인할 수 있습니다. 위 예제에서처럼 한 DNA 분자는 120염기쌍 정보를 담고 있고, 다른 DNA 분자는 180염기쌍을 담고 있으면 길이가 달라서 어디서부터 어디까지가 이름인지 알기 어렵겠죠? 그렇기 때문에 길이가 아닌 ```>``` 문자가 시작하면 새로운 DNA 분자에 대한 정보가 나온다는 약속을 해둔 것입니다. DNA 길이는 엄청나게 길어질 수도 있습니다. 다음 ```>``` 문자가 나오기 전까지는 아무리 길어도 하나의 DNA 정보라고 생각하면 됩니다.
- FASTQ는 FASTA와 정말 비슷하지만, 중요한 차이점을 몇 가지 지니고 있습니다. FASTA는 DNA의 이름과 서열 정보만 담고 있지만, FASTQ는 이름과 서열 외에도 부가적인 **옵션** 정보와 각 염기의 정확도를 알려주는 **퀄리티(quality)** 정보가 함께 담겨 있다는 것이 가장 중요한 차이점입니다. 예를 들면 다음과 같은 형태를 띠고 있습니다.
```
@read_00001
ATGCTACGTACGTACGTAGCTACGATCGATCGATCGTAGTACACAATTTCGCGCCGCTCG
AAATCTCGGGCTCCCATCACGTACGAGCTAGCTAGCTAGCTACGATCGATCGATCGATGT
+
DBD0@GHIIHHHHIGEHFH@G1@GCGHHFHIE1GHIIIHIIHHHHHIIG@GFCF@D@DHC
HHHHIEHI1@@CGHI@GH1G1D0@CC@CE@CCFH@1@CEHHHHFCHHHCHHIHEHHEHEH
```
- FASTQ에서 DNA의 이름은 **@** 문자 다음에 나옵니다. 그 다음 줄부터 **서열** 정보가 시작되며, **+** 기호가 나오면 DNA 서열 정보가 끝났다는 뜻이 됩니다. 그리고 마지막 줄에 **퀄리티** 정보가 담기게 되죠. 마찬가지로 이 품질 정보는 다음 **@** 기호가 나오면 끝나게 됩니다.
- 현존하는 시퀀싱 기법은 대부분 오류를 만들어낼 가능성이 있기 때문에 이러한 퀄리티 정보가 포함된 FASTQ 양식이 널리 쓰이고 있습니다.
- 여기서 퀄리티 정보의 길이는 DNA의 서열 정보와 같은데요, 이는 퀄리티 줄의 각 문자 하나가 짝지어진 DNA 서열의 정확도를 가리키기 때문입니다.
- 예를 들면 첫 번째 DNA 서열 정보인 A, 그 다음의 T, 그 다음의 G는 각각 "D", "B", "D"라는 퀄리티를 지니고 있다는 뜻이 됩니다.
- 이 퀄리티는 기본적으로는 ```-10×log(Error rate)```입니다.
- 예를 들면 시퀀싱 결과 첫 번째 단량체가 A라고 판정했는데, 실험적 오류로 인해 10% 정도는 T일 것 같다고 쳐봅시다. 그러면 이때 퀄리티 값은 ```-10×log(0.1) = 10``` 이 되겠죠.
- 그런데 이렇게 십진법으로 나타내면 퀄리티 값이 2개의 문자로 표현하게 될 가능성이 매우 높다는 문제가 생깁니다. 서열 정보와 짝 지어질 수 없게 되는 게 문제입니다. 예를 들면 ATGC라는 서열 1021121이라는 퀄리티 정보를 지닌다고 했을 때, 각 단량체 정보의 정확도가 10, 21, 12, 1인지, 아니면 10, 2, 11, 21인지 등등 알기가 어렵겠죠. 서열 문자와 퀄리티 정보가 모두 1개의 문자로 표현되는 게 필요한 겁니다.
- 이런 문제를 해결하기 위해 퀄리티 값을 1개의 문자만으로 표현할 수 있도록 하는 [장치](https://support.illumina.com/help/BaseSpace_OLH_009008/Content/Source/Informatics/BS/QualityScoreEncoding_swBS.htm)가 쓰이고 있습니다. 십진법으로는 두 자리인 숫자도 모두 1개의 문자로 표현할 수 있는 방식이죠.
- 예컨대 ```read_00001```의 첫 3개 정보인 A, T, G는 각각 D, B, D라는 퀄리티 값을 지니고 있는데요, 이는 각각 35, 33, 35를 가리킵니다. 오류일 가능성은 각각 10<sup>-3.5</sup>, 10<sup>-3.3</sup>, 10<sup>-3.5</sup>인 셈이니 상당히 믿을만한 정확도라고 볼 수 있겠죠.

### 시퀀싱 플랫폼별 차이점
- 현재 가장 널리 쓰이는 숏리드 시퀀싱 기법은 Illumina, BGI 등이 제공하고 있으며, 가장 널리 쓰이는 롱리드 시퀀싱 기법은 PacBio와 ONT 등이 제공하고 있습니다. 
