use strict;
use POSIX;

# 이 스트립트는 원래 영국에서 시작되었으며... 아아니 미국 해양연구소 (Marine Biology Labs, 메사추세츠 우즈홀)에서 시작하였으며 
# Stephan J Sanders 교수(캘리포니아 대학 샌프란시스코)가 신경생물학 코스에서 유닉스 강의를 하기 위해 고안되었음.
# 그 강의의 교육조교로 착취당하던 시바가 동아시아로 밀수했고, 
# 이후 이 코드는 준킴이 한글로 번역하였음.

# 이 스크립트는 유닉스 기본 명령어 및 Sanders 교수의 문학 갬성을 주입, 아아니 가르치기 위해 제작되었으며, 
# 비 사업적인 용도를 위해 사용이 가능하다. 단, 한가지 조건이 있다. 그것은

# 무조건, 반드시 당신은 진짜 "보물"을 준비해야한다.

# You can describe where the treasure is 
# hidden here:

my $theTreasure = "보물을 발견했다!\n".
"보물을 준비해놓지 않았다면 혼내주도록 하자.\n".
"또 항상 기억하도록 하자. 훌륭한 생물정보마술사는 포트 로더데일 합의를 준수하고,\n".
"자신들의 데이터/연구를 공유한다는 것을! (보물 찾기 종료. 수고하셨습니다!)";

# Create locations
my @places = (
"pineTree", "largeStone", "blueHouse", "church", "pub", 
"boat", "smallStone", "bridge", "ashTree", "beach", "oakTree", 
"waterTower", "bellTower", "harbour", "ferryPort", "busStop", 
"library", "giftShop", "lab", "cafe", "bikeShop", "bikePath", 
"lake", "piratesCove", "parrotShop", "prostheticShop", 
"ophthalmologist", "rumBarrel", "sailMakers", "plankMaker", 
"swordShop", "lightHouse", "newsAgent"
);
 
my @directions = (
"eastOneStep", "eastTwoSteps", "eastThreeSteps", "eastFourSteps", "eastFiveSteps",
"southOneStep", "southTwoSteps", "southThreeSteps", "southFourSteps", "southFiveSteps",
"westOneStep", "westTwoSteps", "westThreeSteps", "westFourSteps", "westFiveSteps",
"northOneStep", "northTwoSteps", "northThreeSteps", "northFourSteps", "northFiveSteps"
);

my @directions2 = (
"eastOneStep", "eastTwoSteps", "eastThreeSteps", "eastFourSteps", "eastFiveSteps",
"southOneStep", "southTwoSteps", "southThreeSteps", "southFourSteps", "southFiveSteps",
"westOneStep", "westTwoSteps", "westThreeSteps", "westFourSteps", "westFiveSteps",
"northOneStep", "northTwoSteps", "northThreeSteps", "northFourSteps", "northFiveSteps",
"closeEyesAndWalkTowardsTheSoundOfTheWaves", "atThreeOClockFollowParallelToTheShadowFromTheFlagPole", 
"atTheSummerSolsticeDigWhereTheFirstRayOfLightMeetsThePath"
);

foreach my $dir (@places){
	mkdir $dir;
	foreach my $dir2 (@directions){
		mkdir $dir.'/'.$dir2;
		foreach my $dir3 (@directions2){
			mkdir $dir.'/'.$dir2.'/'.$dir3;
		}
	}
}

# Create output files
my $output1 = 'Clue01_S.txt';
my $OUT1 = &openOut($output1);

print $OUT1 "대학 도서관을 뒤지던 도중에 당신은 준킴의 오래된 일기장을 발견했다. 일기장 마지막에는 다음과 같은 흥미로운 이야기가 적혀 있었다:\n\n".
"00년 00월 00일, 예쁜꼬마선충 폴리와 나는 우리의 보물을 아무도 찾지 못할 곳에 묻어놨다! 폴리 말로는 대학 안에 있는 장소만 해도 60,000곳이 넘기 때문에 결코 찾을 수 없을 거라고 한다.\n\n".
"안타까운 점은 학부를 졸업했을 때 하필이면 대학원, 그것도 생명과 대학원에 가야겠다는 잘못된 선택을 한 것이다. 덕분에 기억력이 예전 같지 못해 나중에 보물 위치를 기억할 수 있을지 모르겠다.\n".
"그래서 나중에 내 보물을 다시 찾을 수 있도록, 오직 박사과정이면서 생물정보마술사인 나만이 이해할 수 있는 몇 개의 단서(Clue) 안에 이 보물의 행방을 남겨두었다.\n".
"이제 두 번째 단서를 찾으려면 물의 탑(water tower)으로 들어가 서쪽으로 세 걸음, 남쪽으로 다섯 걸음 가서 땅을 파내라!\n".
"쾅!\n".
"시바님, 무슨 일입니까?\n".
"준님! 교수님들이 오고 계세요!\n".
"이런, 교수들이 우릴 발견했다. 학부생들을 탈출시키려던 우리의 꿈은 이렇게 무너지는 건가. 도망쳐, 폴리! 생명과는 안 돼...\n\n".
"더 자세한 이야기를 듣고 싶어 사서에게 물어보니,  준킴은 한때 이 대학에서 가장 촉망받는 대학원생이었지만, 생명과의 한계를 극복할 순 없었다고 한다. 그의 기록은 오직 그가 남긴 단서밖에 없는 셈이었다.\n".
"(팩트: 이렇게 징징거렸지만 지금은 운 좋게 교수돼서 잘 먹고 잘 살고 있음)\n\n".
"문제를 풀기 전에, 먼저 단서를 담아둘 \'toteBag\' 디렉토리를 하나 만들자(mkdir).\n".
"방금 찾아낸 이 첫번째 단서를 그 디렉토리 안에 복사하고(cp), 디렉토리 안에 잘 들어갔는지 확인하자(ls).\n\n이제 물의 탑으로 출발하라!\n";

my $output2 = 'waterTower/westThreeSteps/southFiveSteps/Clue02_W.txt';
my $OUT2 = &openOut($output2);

print $OUT2 "다음 단서는 99% 에탄올 병으로 위장한 오래된 럼주 통(rumBarrel) 근처에 숨겨두었다. 럼주 통을 기준으로 북쪽으로 두 걸음, 서쪽으로 네 걸음 가면 찾을 수 있다.\n".
"참고로 시약병 사이에 단서를 숨겨두려다 보니 작게 쪼그라뜨리고 압축해서 집어넣어둘 수밖에 없었다. 단서를 읽으려면 gunzip을 써서 압축을 풀도록 하자.\n".
"지금 읽고 있는 이 단서를 가방(toteBag) 안에 복사(cp)해두는 것도 잊지 말 것!\n";

my $output3 = 'rumBarrel/northTwoSteps/westFourSteps/Clue03_O.txt';
my $OUT3 = &openOut($output3);

print $OUT3 "이 동네에 컴퓨터를 잘 아는 다른 과학 덕후들이 많다 보니, 이들이 우리가 남긴 단서를 쫓아올까봐 예쁜꼬마선충 폴리가 걱정하고 있다.\n".
"하지만 걱정하지 마라. 손은 눈보다 빠르니까. 이들을 속일 심산으로, 우린 99개의 빈 종이를 섞어두고, 딱 1개에만 단서를 적어 신문가판대(newsAgent) 안에 숨겨뒀다.\n".
"ls를 잘 사용할 줄 아는 우리만이 이 단서를 찾을 수 있을 것이다. 신문가판대 안에서 남쪽으로 다섯 걸음, 서쪽으로 한 걸음 내딛자.\n";

`gzip $output3`;

foreach my $num (0..100){
	my $output4 = 'newsAgent/southFiveSteps/westOneStep/Clue04_R_'.$num.'.txt';
	my $OUT4 = &openOut($output4);
}

my $here = `pwd`;
$here =~ s/[\n\r]//g;
my $output4 = 'newsAgent/southFiveSteps/westOneStep/Clue04_R_78.txt';
my $OUT4 = &openOut($output4);
print $OUT4 "이런, 세포 미디어 갈아줘야 할 시간이다.\n".
"어떻게든 컬쳐룸에 바로 찾아가야 하는데...\n".
"다행히 다음 단서가 있는 컬쳐룸 위치를 정확히 어디에 있는지 알고 있다.\n".
"cd 치고 다음 문구를 붙여넣으면 그쪽으로 단번에 갈 수 있다.\n".
$here."/harbour/westThreeSteps/northTwoSteps\n";

my $output5 = 'harbour/westThreeSteps/northTwoSteps/Clue05_D.txt';
my $OUT5 = &openOut($output5);

print $OUT5 "아주 예쁜 진주(Perl)가 해안(beach)에 떨어져 있다. perl을 이용하면 이 진주에 담긴 단서를 꺼낼 수 있을 것 같다.\n".
"이 정도면 우릴 쫓아오는 사람들을 속일 수 있을 거다. 동쪽으로 한 걸음, 남쪽으로 한 걸음.\n";

#`cp ~/scripts/Clue06.pl beach/eastOneStep/southOneStep/`;

my $output7 = 'bridge/northFiveSteps/westOneStep/Clue07_H.txt';
my $OUT7 = &openOut($output7);

print $OUT7 "진정한 생물정보마술사만이 키보드 탭(Tab) 키를 이용해 파일 이름을 쉽게 완성할 수 있는 법! 이를 시험하고자 엄청나게 이름이 긴 파일을 만들었다.\n".
"탭 안 쓰고 직접 하나하나 따라 치려면 손가락 떨어질 걸? 소나무(pineTree)로 가라. 북쪽으로 다섯 걸음 향한 뒤, 깃대 그림자와 평행하게 3시 방향(3\'o clock)으로 향해라.\n";

my $output8 = 'pineTree/northFiveSteps/atThreeOClockFollowParallelToTheShadowFromTheFlagPole/Clue08_O.txt';
my $OUT8 = &openOut($output8);

print $OUT8 "탭 만세! 탭이란 얼마나 소중한 버튼인가. 두 말할 필요가 없다. 탭이 없었다면 파이펫 아닌 키보드로도 관절염에 걸릴 수 있다는 걸 배우게 됐겠지.".
"이제 앵무새를 구하러 가자(parrotShop). 동쪽으로 세 걸음 간 뒤, 눈을 감고 파도 소리가 들려오는 곳을 향해 걸어라.\n";

my $output9 = 'parrotShop/eastThreeSteps/closeEyesAndWalkTowardsTheSoundOfTheWaves/Clue09_P.txt';
my $OUT9 = &openOut($output9);

print $OUT9 "다른 박사과정 대학원생들이 탭 안 쓰고 명령어 일일이 치고 있는 걸 보고 있자면, 새벽에 티타임 갖는 걸 지켜보는 것만큼이나 너어어무 고통스럽다.\n".
"다시 한 번 해보자. 등대(lightHouse)로 가서 서쪽으로 다섯 걸음, 다시 하지(summer solstice)에 최초로 비치는 빛이 만나는 지점을 향해 나아가라.\n";

my $output10 = 'lightHouse/westFiveSteps/atTheSummerSolsticeDigWhereTheFirstRayOfLightMeetsThePath/Clue10_5.txt';
my $OUT10 = &openOut($output10);

print $OUT10 "좋아, 지금까지 뭔가를 만드는 일을 해봤다. 이제 박사과정들이 뭔가(우리 인생 같은 거?)를 지우는 데 얼마나 일가견 있는지 한번 살펴보자.\n".
"보철 기구 파는 가게(prostheticShop)로 가자. 북쪽으로 한 걸음, 동쪽으로 네 걸음.\n";

my $output11 = 'prostheticShop/northOneStep/eastFourSteps/falseClue11.txt';
my $OUT11 = &openOut($output11);
print $OUT11 "아무것도 없잖아!!! 펄 스크립트를 시도해보자(perl).\n";

my $output11a = 'prostheticShop/northOneStep/eastFourSteps/Clue11_N.txt';
my $OUT11a = &openOut($output11a);

print $OUT11a "다음 단서를 얻으려면 파일을 이동시키거나 이름을 바꿔야 한다. 거대한 바위(largeStone)로 향해 남쪽으로 두 걸음, 서쪽으로 네 걸음 가라.\n".
"석영(quartz) 덩어리가 보일 것이다. 이걸 가방(toteBag)에 복사하지 말고 이동(mv)시키도록 하자.\n".
"가방으로 이동하고 나면 파일 이름을 \'Clue12_5.txt\' 으로 바꿔보자(mv).\n";

`mv prostheticShop/northOneStep/eastFourSteps/Clue11_N.txt prostheticShop/southThreeSteps/westThreeSteps/Clue11_N.txt`;
#`cp ~/scripts/realClue11.pl prostheticShop/northOneStep/eastFourSteps/`;

my $output12 = 'largeStone/southTwoSteps/westFourSteps/quartz.txt';
my $OUT12 = &openOut($output12);

my $command = 'touch largeStone/southTwoSteps/westFourSteps/grey.txt largeStone/southTwoSteps/westFourSteps/purple.txt '.
'largeStone/southTwoSteps/westFourSteps/white.txt largeStone/southTwoSteps/westFourSteps/rolling.txt '.
'largeStone/southTwoSteps/westFourSteps/roses.txt largeStone/southTwoSteps/westFourSteps/mason.txt '.
'largeStone/southTwoSteps/westFourSteps/granite.txt largeStone/southTwoSteps/westFourSteps/grit.txt '.
'largeStone/southTwoSteps/westFourSteps/sedimentary.txt largeStone/southTwoSteps/westFourSteps/igneous.txt '.
'largeStone/southTwoSteps/westFourSteps/metamorphic.txt largeStone/southTwoSteps/westFourSteps/marble.txt '.
'largeStone/southTwoSteps/westFourSteps/brown.txt largeStone/southTwoSteps/westFourSteps/bladder.txt '.
'largeStone/southTwoSteps/westFourSteps/kidney.txt largeStone/southTwoSteps/westFourSteps/rosetta.txt '.
'largeStone/southTwoSteps/westFourSteps/blarney.txt largeStone/southTwoSteps/westFourSteps/head.txt '.
'largeStone/southTwoSteps/westFourSteps/sand.txt largeStone/southTwoSteps/westFourSteps/lime.txt ';
`$command`;

print $OUT12 "다음 단서는 파일 시작 부분이 아니라 가장 끝 부분에서 확인할 수 있다(tail). 파일도 아주 기이이이일게 만들어뒀다.\n".
"자전거 길(bikePath)로 가자. 남쪽으로 세 걸음, 동쪽으로 한 걸음.\n";

my $output13 = 'bikePath/southThreeSteps/eastOneStep/Clue13_W.txt';
my $OUT13 = &openOut($output13);

print $OUT13 "여긴 아무것도 없다. tail 을 시도해보자.\n";
foreach my $num (1..5000){
	print $OUT13 "\n";
}

print $OUT13 "훌륭해! 이제 이 단서를 가방에 복사하고, 가방 디렉토리로 이동해 단서 파일들 이름의 마지막 문자를 살펴보자. 우리가 지금까지 읽은 단서들처럼, 장소와 방향, 몇 걸음 가야 하는지에 대한 정보가 적혀 있을 것이다.\n";

my $output14 = 'swordShop/northFiveSteps/westFiveSteps/xMarksTheSpot.txt';
my $OUT14 = &openOut($output14);

print $OUT14 "\'JUN\'이라는 글자가 커다랗게 새겨진 오래된 나무 상자를 발견했다.\n".
"상자 앞에는 \'폴리는 답을 알고 있다.\'라는 문장이 적힌 번호 자물쇠가 달려있다.\n".
"이 파일에서 polly 라는 문자열을 검색하고(grep), 확인한 숫자를 \'key.txt\' 파일에 적어두자(nano 또는 vi 등).\n".
"그 뒤 \'openLock.pl\' perl 스크립트를 실행하자.\n";

my @let = ('a'..'z');
foreach my $num (0..562){
	my $twoDig = ceil(rand(100));
	my $letThree = $let[rand(26)];
	my $letFour = $let[rand(26)];
	my $letFive = $let[rand(26)];
	print $OUT14 "po".$letThree.$letFour.$letFive."\t$twoDig\n" unless ($letThree.$letFour.$letFive eq 'polly');
}
print $OUT14 "polly\t42\n";
foreach my $num (0..324){
	my $twoDig = ceil(rand(100));
	my $letThree = $let[rand(26)];
	my $letFour = $let[rand(26)];
	my $letFive = $let[rand(26)];
	print $OUT14 "po".$letThree.$letFour.$letFive."\t$twoDig\n" unless ($letThree.$letFour.$letFive eq 'polly');
}

my $command14 = 'touch swordShop/northFiveSteps/westFiveSteps/key.txt';
`$command14`;


#my $output15 = 'swordShop/northFiveSteps/westFiveSteps/Treasure.txt';
#my $OUT15 = &openOut($output15);

#print $OUT15 "You've found my treasure! Quietly stand up, head out of the classroom, and look for a plate in the office opposite\n";


###### write the perl scripts #####

# Script 1
my $outputPerl1 = 'beach/eastOneStep/southOneStep/Clue06.pl';
my $OUTP1 = &openOut($outputPerl1);

print $OUTP1 'use strict;'."\n\n";
print $OUTP1 '# 이건 컴퓨터 명령어가 포함된 짧은 프로그램인 perl 파일이다. 다음 명령어를 입력해서 실행시킬 수 있다:'."\n".'# perl Clue06.pl'."\n\n";
print $OUTP1 '&out;'."\n\n".'my @num = ('."\n";
foreach my $num (0..943){
	print $OUTP1 "\n".$num.",\n\n\n\n";
}
print $OUTP1 ');'."\n\n".'sub out {'."\n".'print "이거 정말이지 예쁜 진주(perl)로군! 잘만 팔면 대학원 탈출해도 되겠는 걸? 계속하기 전에 이 내용을 기록해두는 게 좋겠다.\n'.
'방금 친 perl 명령어를 다시 실행하고, 지금 화면에 뜬 이 내용(STDOUT)을 잡아서 (> 또는 redirection이라고도 부름) Clue06_S.txt 라는 이름을 지닌 파일에 집어넣도록 하자.\n'.
'그 뒤에 이 단서를 가방(toteBag)에 복사하면 되겠군.\n'.
'모두 정리되면 다리(bridge)로 가서 북쪽으로 다섯 걸음, 서쪽으로 한 걸음 이동하자.\n";'."\n".'}'."\n\n";
print $OUTP1 'my @num = ('."\n";
foreach my $num (0..678){
	print $OUTP1 "\n".$num.",\n\n\n\n";
}
print $OUTP1 ');'."\n";
close $OUTP1;

# Script 2
my $outputPerl2 = 'prostheticShop/northOneStep/eastFourSteps/realClue11.pl';
my $OUTP2 = &openOut($outputPerl2);

print $OUTP2 'use strict;'."\n\n";
print $OUTP2 'my @files = split /\n/, `ls`;'."\n\n";
print $OUTP2 'my $mark = 0;'."\n".'foreach my $file (@files){'."\n";
print $OUTP2 "\t".'$mark = 1 if ($file eq \'falseClue11.txt\');'."\n".'}'."\n\n";
print $OUTP2 'if ($mark == 0) {'."\n";
print $OUTP2 "\t".'`cp '.$here.'/prostheticShop/southThreeSteps/westThreeSteps/Clue11_N.txt ../../../toteBag/`;'."\n";
print $OUTP2 "\t".'print "아이고, 이걸 지워버리다니! 뭔 생각인가 대체? 빠르게 휴지통으로 가서 다시 살려내라!\n";'."\n";
print $OUTP2 "\t".'sleep 3;'."\n";
print $OUTP2 "\t".'print "장난임 깔깔 이미 그 파일은 아예 완전히 사라졌다. UNIX에서 뭔가를 삭제한다면 진짜 그냥 사라진다.\n'.
'휴지통에서 복구하거나 취소하는 것 따위는 불가능하다. rm -rf 잘못 건들지 말어! 손모가지 날아가붕게.\n";'."\n";
print $OUTP2 "\t".'print "진짜 단서 11을 살펴보려면 네 가방(toteBag)을 확인해봐라(cd).\n";'."\n";
print $OUTP2 '} else {'."\n";
print $OUTP2 "\t".'print "잘못된 단서(false clue)를 제거하고(rm) 다시 시도하자,\n";'."\n".'}'."\n";
close $OUTP2;

# Script 3
my $outputPerl3 = 'swordShop/northFiveSteps/westFiveSteps/openLock.pl';
my $OUTP3 = &openOut($outputPerl3);
print $OUTP3 '# Try xMarks the spot'."\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n";
print $OUTP3 'use strict;'."\n\n";
print $OUTP3 'open IN, "key.txt" or die "could not find key.txt: $!\n";'."\n";
print $OUTP3 'my @in = <IN>;'."\n".'if ($in[0] =~ /42/){'."\n";
print $OUTP3 "\t".'open OUT, \'>\', "openTheBox.txt" or die "could not open openTheBox.txt: $!\n";'."\n";
$theTreasure =~ s/\'/\\\'/g;
print $OUTP3 "\t".'print OUT "'.$theTreasure.'\n";'."\n";
print $OUTP3 "\t".'print "철컥, 자물쇠가 풀렸다. 이제 상자를 열어보자(ls).\n";'."\n";
print $OUTP3 '} else {'."\n\t".'print "잘못된 비밀번호입니다.\n";'."\n".'}';
close $OUTP3;

# Opens an output file
sub openOut {
	my ($file) = @_;
	open my $OUT, '>', $file or die "Could not open file $file: $!\n";
	return ($OUT);
}


