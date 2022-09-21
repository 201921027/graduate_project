# graduate_project_git
졸업 프로젝트 - 자연어처리를 이용한 감정분석 및 공감코멘트 생성 일기장 어플리케이션

* ### 데이터 전처리 방식

국립국어원의 [모두의 말뭉치](https://corpus.korean.go.kr/)에서 '비출판물 말뭉치'에서 '카테고리: 일기' 데이터의 일부를 추출 및 정제하여 이용

*(데이터 전처리 수행 파일: gp_data-processing.ipynb)*

데이터 전처리 후, 팀원 4명이서 직접 감정과 공감코멘트를 라벨링하였음.

전처리한 일기 데이터셋에 대해 감정과 공감코멘트를 라벨링한 파일: [다운로드](https://drive.google.com/file/d/1b_wNzeSSiYj1WuoYZwp2paPvIkCEXyQn/view?usp=sharing)


* ### (참고) 연구 수행 방식

#### <방안1>
kogpt2 모델 하나만 사용하여 emotion classification & comment generation을 한 번에 수행한다.

*(실행파일: gp_original_model.ipynb)

> ( 방안1의 train input form: '일기데이터' ) / ( 방안1의 train label form: '감정|공감코멘트' )

#### <방안2>
kobert를 이용하여 1차적으로 감정분류를 수행하고, 이후 kogpt2를 이용하여 공감코멘트를 생성한다.

*(실행파일 및 순서: gp_new_model_bert.ipynb -> gp_new_model_gpt2.ipynb -> gp_new_model_conv.ipynb)*

> ( 방안2' kobert의 train input form: '일기데이터' ) / ( 방안2' kobert의 train label form: '감정' )

> ( 방안2' kogpt2의 train input form: '일기데이터|감정' ) / ( 방안2' kogpt2의 train label form: '공감코멘트' )


* ### (참고) 디렉토리 내부 형태

data 디렉토리는 ipynb 파일과 같은 디렉토리에 둠.

data 디렉토리 내부 형태는 다음과 같음. total-data.csv 디렉토리는 무시해도 됨.

![image](https://user-images.githubusercontent.com/81811255/191417172-4475c138-ae51-4d1b-9bc1-9842451a2912.png)


위의 ipynb 파일을 모두 수행하였을 시, 다음과 같은 디렉토리 형태가 됨.

![image](https://user-images.githubusercontent.com/81811255/191413705-e3b3878a-2791-41c9-85ec-d299aaec2303.png)

