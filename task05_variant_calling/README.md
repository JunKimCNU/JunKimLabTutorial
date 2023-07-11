- BWA가 아닌 다른 매핑 프로그램도 활용해봅시다. 이번에 사용해볼 건 [HISAT2](https://www.nature.com/articles/s41587-019-0201-4)입니다. 다음 명령어를 차례로 입력하면 C. elegans의 DNA 시퀀싱 리드가 표준 마이토콘드리아 지놈에 매핑되고 정렬된 파일이 만들어지는데요, 각각이 어떤 의미인지 알아봅시다. 그리고 화면에 출력되는 정보를 활용해 매핑된 리드 수와 리드 비율을 확인해봅시다. 이 결과 파일을 활용해 ```bcftools```를 이용한 변이 추출 과정도 진행해봅시다.

```
hisat2-build wbcel235.mt.fa mt
hisat2 -x mt -1 srr3440952.sub.1.fq.gz -2 srr3440952.sub.2.fq.gz | samtools sort -O SAM -o mt.sam
```

- ```samtools```를 활용하면 더 다양한 통계치와 결과를 얻어낼 수 있습니다. ```samtools flagstat```과 ```samtools coverage -m``` 옵션을 활용해 SAM 파일을 좀 더 자세하게 이해해봅시다.

