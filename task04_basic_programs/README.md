- 다음 명령어를 입력해서 예제 데이터를 다운 받으시오.
```
svn export https://github.com/JunKimCNU/JunKimLabTutorial/trunk/task04_basic_programs
# svn이 설치돼 있지 않다면 화면에 뭔가를 하라고 나올 텐데, 따라 하면 됨.
# 예컨대 우분투에서는 apt install subversion
mv task04_basic_programs/*f* .
rm -rf task04_basic_programs/
```
- wbcel235.mt.fa는 C. elegans의 미토콘드리아 시퀀스를 담고 있는 파일이다. 이 미토콘드리아 시퀀스의 길이와 A, T, G, C 조성을 확인해보자(seqtk comp). GC 비율이 40% 이상인 지역을 뽑아보자(seqtk gc). 이 파일에 포함된 ATGC를 소문자로 바꾸는 방법과 다시 대문자로 바꾸는 방법을 알아보자(awk 또는 bioawk 활용).
- cb4856.pacbio.subseq.fq.gz은 C. elegans CB4856 strain의 PacBio 롱리드 시퀀싱 결과에서 일부만 뽑아낸 것이다. 이 플랫폼에서는 다양한 길이의 리드가 생산되기 때문에 길이에 대한 정보를 알아둘 필요가 있다. 해당 파일에 포함된 리드의 수는? 평균값은? N50은? 가장 긴 리드의 길이는? (bioawk, assembly-stats 등 활용)
- cb4856.pacbio.subseq.fq.gz 파일에 포함된 10 kb 이상되는 리드의 개수는? 평균값은? N50은? (bioawk, assembly-stats 등 활용)
- srr3440952.sub.1.fq.gz과 srr3440952.sub.2.fq.gz은 같은 C. elegans CB4856 strain의 Illumina 숏리드 시퀀싱 결과에서 일부만 뽑아낸 것이다. 해당 파일에 포함된 리드의 수는? 평균값은? N50은? 가장 긴 리드의 길이는? (assembly-stats 등 활용)
- srr3440952.sub.1.fq.gz과 srr3440952.sub.2.fq.gz에 담긴 FASTQ 정보를 FASTA 포맷으로 바꿔보자(bioawk or seqtk 활용).
- 가끔은 본격적인 분석을 하기 전에 랜덤 추출한 일부 리드만을 이용해 테스트 실험을 해보기도 한다. srr3440952.sub.1.fq.gz과 srr3440952.sub.2.fq.gz에서 리드를 100개씩 짝지어 추출해보자(seqtk sample 활용).
