# graduate_project_git
졸업 프로젝트 - 자연어처리를 이용한 감정분석 및 공감코멘트 생성 일기장 어플리케이션

* ### 데이터 전처리 방식

국립국어원의 [모두의 말뭉치](https://corpus.korean.go.kr/)에서 '비출판물 말뭉치'에서 '카테고리: 일기' 데이터의 일부를 추출 및 정제하여 이용

*(데이터 전처리 수행 파일: gp_data-processing.ipynb)*

데이터 전처리 후, 팀원 4명이서 직접 감정과 공감코멘트를 라벨링하였음.

전처리한 일기 데이터셋에 대해 감정과 공감코멘트를 라벨링한 파일: [다운로드](https://drive.google.com/file/d/1b_wNzeSSiYj1WuoYZwp2paPvIkCEXyQn/view?usp=sharing)

* ### 감정 분류
기쁨, 슬픔, 두려움, 분노, unknown 총 5가지로 분류하였음.

* ### (참고) gp_data_summarize_kobart.ipynb에 대하여

코퍼스 생성(라벨링)에 편리성을 추구하기 위하여, kobart로 1차적으로 일기 데이터셋을 요약한 뒤, 요약문을 정제하여 공감코멘트를 작성하는 방식으로 코퍼스를 생성하고자 하였음. 다만 kobart가 일기 데이터셋 요약에는 아주 좋지 못한 성능을 보였기에 거의 활용하지는 못하였음.

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

#### <결과>
최종적으로 <방안2>의 방식을 채택하였음. 아직 원인은 파악하지 못했으나 <방안1>에서의 감정 분류가 생각처럼 잘 되지 않았음.

#### (참고)
gp_original_model.ipynb , gp_new_model_bert.ipynb , gp_new_model_gpt2.ipynb 파일에는 모두 참고한 사이트의 링크가 걸려있음. 또한 각 파일은 모두 평가를 수행하는 코드를 포함하고 있음. 


* ### (참고) 디렉토리 내부 형태

data 디렉토리는 ipynb 파일과 같은 디렉토리에 둠.

data 디렉토리를 같은 위치에 두고, 위의 ipynb 파일을 모두 수행했을 시, 자동으로 kobert, kobertscore, kogpt2 등과 같은 디렉토리가 다운로드되어 다음과 같은 디렉토리 형태가 됨.

![image](https://user-images.githubusercontent.com/81811255/191420939-5cf8d607-9fea-48be-9d66-94a2e2fddb5d.png)

data 디렉토리 내부 형태는 다음과 같음. total-data.csv 디렉토리는 무시해도 됨.

![image](https://user-images.githubusercontent.com/81811255/191418517-9a532cb4-ee97-4db7-b3f7-2f6ae3dcdd30.png)

![image](https://user-images.githubusercontent.com/81811255/191418538-0834a640-6528-48cf-be13-9f41320a9732.png)

new-model(bert)_train_data.tsv와 new-model(bert)_test_data.tsv는 kobert를 수행하기 위해 csv 파일을 tsv 파일로 변환한 것. gp_new_model_bert.ipynb 파일을 처음부터 수행할 시 자동으로 생성되게 되어있음. 본 tsv 파일을 드라이브 링크로 불러와 사용하기 때문에, tsv 파일의 링크를 생성한 뒤, 링크를 가진 모든 사용자에게 공개하도록 설정하여 kobert룰 훈련시킬 때 사용하면 됨. gp_new_model_bert.ipynb 파일에 적혀있는 링크는 글쓴이의  tsv 파일로 연결된 url임. 본인 파일로 경로를 변경하여 사용하고 싶다면 url 중간의 파일 id 링크를 변경하여 사용하면 됨.

![image](https://user-images.githubusercontent.com/81811255/191421739-bfcdf98f-c2fb-4b6d-a38e-880acd102a77.png)


