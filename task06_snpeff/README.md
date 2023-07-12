- 다음 명령어를 입력해 예제용 데이터를 다운 받아보자. 이는 [NCBI의 human genome resoure](https://www.ncbi.nlm.nih.gov/genome/guide/human/)에서 확보한 데이터로, [사람이 지니고 있는 변이와 그것이 건강에 끼치는 영향](https://www.ncbi.nlm.nih.gov/clinvar/intro/) 등을 종합해둔 데이터이다.
```console
(basicGenomics) 어쩌구@저쩌구:~/06_snpeff$ mkdir 01_quiz && cd 01_quiz
(basicGenomics) 어쩌구@저쩌구:~/06_snpeff/01_quiz$ wget https://ftp.ncbi.nlm.nih.gov/refseq/H_sapiens/annotation/GRCh37_latest/refseq_identifiers/GRCh37_latest_clinvar.vcf.gz
```
- (인풋 아웃풋 등 옵션 제대로 입력하는 법 익혀보기) SnpEff를 이용해 이 변이가 끼치는 영향을 분석해보자. 새로운 스크립트인 ```01_snpEff_ClinVar.sh```라는 파일을 생성하자. 이 파일의 내용은 상위 디렉토리에 있는 ```00_snpEff.sh``` 파일 내용과 똑같이 맞추되, 실행 파일의 위치를 수정하고(```snpEff/snpEff.jar``` 부분을 변경해서 제 위치를 지정해줘야 함), 인풋 파일 이름은 ```GRCh37_latest_clinvar.vcf.gz```로, 아웃풋 파일 이름은 ```GRCh37_latest_clinvar.ann.vcf```로 변경해서 진행하도록 하자. 마찬가지로 ```nohup bash 01_snpEff_ClinVar.sh &```로 명령어를 실행해보자.
- 마찬가지로 ```nohup.out```, ```snpEff_summary.html``` 파일의 내용을 확인해보자.
- (awk 등 활용) ```snpEff_genes.txt``` 파일을 활용하여, high/low/moderate/modifier impact를 주는 변이가 1개 이상 존재하는 유전자 개수를 확인해보자.
