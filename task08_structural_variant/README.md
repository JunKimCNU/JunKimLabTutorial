- 다음 명령어를 입력해 예제 데이터를 다운 받도록 하자
```
mkdir 08_structural_variant && cd 08_structural_variant
wget -O ceN2.fa.gz https://downloads.wormbase.org/species/c_elegans/PRJNA13758/sequence/genomic/c_elegans.PRJNA13758.current.genomic.fa.gz
gzip -dk ceN2.fa.gz
samtools faidx ceN2.fa
ln -s ../path_to_your_chr3.fa
ln -s ../path_to_your_chr3Read.fq
```

- ```svim```을 이용해 리드 기반의 구조 변이 분석 기법을 익혀보자. [SVIM 위키](https://github.com/eldariont/svim/wiki)에 적혀 있는 정보를 읽어본 뒤, ```ceN2.fa```를 참조 유전체로, ```chr3Read.fq```를 쿼리로 삼아 구조 변이 정보를 확보해보자. (다양한 방법을 활용해보고 되는 걸로 하면 됨)

- ```svim-asm```을 이용해 유전체 지도 기반의 구조 변이 분석 기법을 익혀보자. [SVIM-asm 홈페이지](https://github.com/eldariont/svim-asm)에 나와있는 정보를 읽어본 뒤, ```ceN2.fa```를 참조 유전체로, ```chr3.fa```를 쿼리로 삼고, 반수체(haploid) 모드로 데이터 분석을 진행해보자. (Alignment부터 시작해서 네 줄은 쳐야 함)

- 두 파일에 담긴 VCF 파일을 확인해보고, PNG 파일에 담긴 정보도 들여다보자. (1) 몇 종류의 구조 변이가 있는가? (2) 각 유형에 해당하는 구조 변이는 몇 개인가? (3) 3번 염색체에 그 구조 변이가 잘 밀집돼 있나? (4) 이러한 구조 변이 중 가장 큰 것은 무엇인가?  등등을 살펴보고, (5) 리드 기반 구조 변이 분석과 유전체 지도 기반 구조 변이 분석의 공통점과 차이점을 분석해보자. (```bedtools``` 활용)
