# graduate_project_git
졸업 프로젝트 - 자연어처리를 이용한 감정분석 및 공감코멘트 생성 일기장 어플리케이션

* ### 데이터 전처리 방식

국립국어원의 [모두의 말뭉치](https://corpus.korean.go.kr/)에서 '비출판물 말뭉치'에서 '카테고리: 일기' 데이터의 일부를 추출 및 정제하여 이용하였습니다.

*(데이터 전처리 수행 파일: gp_data-processing.ipynb)*

데이터 전처리 후, 팀원 4명이서 직접 감정과 공감코멘트를 라벨링하였습니다.

감정 분류는 총 5가지 종류로 분류하였습니다. (기쁨, 슬픔, 두려움, 분노, unknown)

> 전처리한 일기 데이터셋에 대해 감정과 공감코멘트를 라벨링한 파일(train dataset): [다운로드](https://drive.google.com/file/d/1b_wNzeSSiYj1WuoYZwp2paPvIkCEXyQn/view?usp=sharing)


* ### 연구 수행 방식

#### <방안1>
kogpt2 모델 하나만 사용하여 emotion classification & comment generation을 한 번에 수행

*(실행파일: gp_original_model.ipynb)*

> ( 방안1의 train input form: '일기데이터' ) / ( 방안1의 train label form: '감정|공감코멘트' )

#### <방안2>
kobert를 이용하여 1차적으로 감정분류를 수행하고, 이후 kogpt2를 이용하여 공감코멘트를 생성

*(실행파일 및 순서: gp_new_model_bert.ipynb -> gp_new_model_gpt2.ipynb -> gp_new_model_conv.ipynb)*

> ( 방안2' kobert의 train input form: '일기데이터' ) / ( 방안2' kobert의 train label form: '감정' )

> ( 방안2' kogpt2의 train input form: '일기데이터|감정' ) / ( 방안2' kogpt2의 train label form: '공감코멘트' )

#### <결과>
최종적으로 <방안2>의 방식을 채택하였습니다. 아직 원인은 파악하지 못했으나 <방안1>에서의 감정 분류가 생각처럼 잘 되지 않았으며, 생성되는 공감코멘트 또한 <방안2>의 공감코멘트의 quality가 더 높았습니다.

#### <참고>
gp_original_model.ipynb , gp_new_model_bert.ipynb , gp_new_model_gpt2.ipynb 파일에는 모두 참고한 사이트의 링크가 걸려있습니다. 또한 각 파일은 모두 평가를 수행하는 코드를 포함하고 있습니다.


* ### 모델
훈련시킨 모델은 checkpoint 디렉토리에 저장되도록 경로를 설정하였습니다. colab의 ram 용량 문제로 모든 gpt 모델은 batch_size=1로 훈련되었습니다.  (방안1)과 (방안2)의 성능을 비교하기 위해 두 방안 모두 batch_size=1, epoch=30으로 훈련을 시킨 후 성능을 평가하였습니다. 평가 결과 (방안2)의 성능이 더 뛰어났기에 (방안2) 모델을 최종 선정한 뒤, (방안2)의 모델의 성능을 조금 더 높이기 위해 여러 epoch으로 훈련을 수행해보았습니다. 

#### <(방안1)의 kogpt를 훈련시킨 모델>
> batch_size=1, epoch=30의 (방안1)' kogpt 훈련 모델: [다운로드](https://drive.google.com/file/d/1ChdPqcFGFr8QckD9fiqRFMKOvDdr2I-P/view?usp=sharing)

#### <(방안2)의 kobert를 훈련시킨 모델>
> (방안2)' kobert 훈련 모델: [다운로드](https://drive.google.com/file/d/1hjNbMDWyiM124gV2n3H9x0GGESdRAZrf/view?usp=sharing)

#### <(방안2)의 kogpt를 훈련시킨 모델>
batch_size=1로 고정한채로 epoch 횟수를 30, 20, 15, 10, 1로 점차 줄여가며 훈련을 시켰을 때, 의외로 epoch=1일 때의 성능이 가장 뛰어난 것을 확인할 수 있었습니다. 

> batch_size=1, epoch=30의 (방안2)' kogpt 훈련 모델: [다운로드](https://drive.google.com/file/d/16blY-V7oIaF20o0AluH1oPKpwSpmx_jH/view?usp=sharing)

> batch_size=1, epoch=1의 (방안2)' kogpt 훈련 모델: [다운로드](https://drive.google.com/file/d/1mNB5Q16OwlnuoPjFJlTAyhgj3ILcgSAI/view?usp=sharing)


* ### (참고) gp_data_summarize_kobart.ipynb에 대하여

코퍼스 생성(라벨링)에 편리성을 추구하기 위하여, kobart로 1차적으로 일기 데이터셋을 요약한 뒤, 요약문을 정제하여 공감코멘트를 작성하는 방식으로 코퍼스를 생성하고자 하였습니다. 다만 kobart가 일기 데이터셋 요약에는 아주 좋지 못한 성능을 보였기에 거의 활용하지는 못하였습니다.


* ### (참고) 디렉토리 내부 형태

data 디렉토리는 ipynb 파일과 같은 디렉토리에 둡니다.

data 디렉토리를 같은 위치에 두고, 위의 ipynb 파일을 모두 수행했을 시, 자동으로 KoBERT, KoBERTScore, KoGPT2 등과 같은 디렉토리가 다운로드되어 다음과 같은 디렉토리 형태가 됩니다.

![image](https://user-images.githubusercontent.com/81811255/191420939-5cf8d607-9fea-48be-9d66-94a2e2fddb5d.png)

data 디렉토리 내부 형태는 다음과 같습니다. kobart_after, kobart_before, total-data.csv 디렉토리는 무시해도 무방합니다.

![image](https://user-images.githubusercontent.com/81811255/191418517-9a532cb4-ee97-4db7-b3f7-2f6ae3dcdd30.png)

![image](https://user-images.githubusercontent.com/81811255/191418538-0834a640-6528-48cf-be13-9f41320a9732.png)

new-model(bert)_train_data.tsv와 new-model(bert)_test_data.tsv는 kobert를 수행하기 위해 csv 파일을 tsv 파일로 변환한 것입니다.  gp_new_model_bert.ipynb 파일에 tsv 파일을 생성하는 코드가 포함되어 있습니다. 본 tsv 파일을 드라이브 링크로 불러와 사용하기 때문에, tsv 파일의 링크를 생성한 뒤, 링크를 가진 모든 사용자에게 공개하도록 설정하여 kobert룰 훈련시킬 때 사용하면 됩니다. gp_new_model_bert.ipynb 파일에 적혀있는 링크는 글쓴이의  tsv 파일로 연결된 url입니다. 본인 파일로 경로를 변경하여 사용하고 싶다면 url 중간의 파일 id 링크를 변경하여 사용하면 됩니다.

![image](https://user-images.githubusercontent.com/81811255/191421739-bfcdf98f-c2fb-4b6d-a38e-880acd102a77.png)


* ### (추가) KoBART로 감정코멘트 생성하기 + 데이터 되먹임

기본적으로 감정코멘트는 generation이라기보단 summarization에 가까운 task이기에, GPT보다 BART에서의 성능이 더 뛰어남을 확인하였습니다. KoGPT 대신 KoBART를 이용하여 감정코멘트를 생성한 파일은 다음과 같습니다. 

*(kobart 훈련을 위한 데이터전처리: _gp_bart_data_processing.ipynb)*

*(kobart 훈련: _gp_bart_recurrent_train.ipynb / 감정분류(BERT)~코멘트생성(BART) 전체수행: _gp_bart_model_conv.ipynb)*

bart를 수행 시, 조금 더 핵심적인 feature를 추출하여 summarization할 수 있도록 데이터를 되먹였습니다. (직접 만든 코퍼스로 kobart를 학습시킨 뒤, 학습된 kobart가 train set에 대하여 summarization하게 하여, 자신이 summarization한 코퍼스로 다시 kobart 학습 수행)

되먹임은 총 2번 수행하였습니다. (1번: 사람이 만든 코퍼스, 2번: kobart 자신이 만든 코퍼스)

train된 kobart model 원본(.ckpt): [다운로드](https://drive.google.com/file/d/1-P7Yc9s25lwbh_iWnfg9Laj5DfknGuKS/view?usp=sharing)

from_pretrained()로 불러올 수 있도록 정제한 model 파일(.bin): [다운로드](https://drive.google.com/file/d/1-bqNm-OqVA72fbDDZGJHpofLrLvGdt9C/view?usp=sharing)
