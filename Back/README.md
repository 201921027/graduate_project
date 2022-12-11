
# 백엔드
### 개발환경: flask
#### 완전한 서버 구현은 하지 않았고, 로컬 환경에서 서버연결 진행했음

 

* 사용 모델
>
>KoBERT훈련모델: [다운로드](https://drive.google.com/file/d/1etyZ7r9kjWQUk4JVgm3aDmFIdGfIFLUh/view?usp=sharing)
>
>KoBART훈련모델: [다운로드](https://drive.google.com/file/d/1SVxjc6sqRC19PGeY-B4fMqy1bN1QqA0t/view?usp=sharing)
>
> 두개의 모델을 다운 받은 후 app.py와 같은 폴더 내에 위치시키도록 함

 

* app.py 실행 관련
>app.py 파일 내의 line 141
>
>```python
>if __name__ == '__main__':
>    app.run(host='IP', debug=True)
>```
>로컬환경이기 때문에 실행시 'IP'를 자신의 IP주소로 변경 후 실행
>
>ex)
>
>```python
>if __name__ == '__main__':
>    app.run(host='192.168.xx.xx', debug=True)
>``` 

 

*첫 실행전 다운 받아야할 패키지
>```python
>!pip install gluonnlp
>```
>
>```python
>!pip install mxnet
>```
>
>```python
>!pip install git+https://git@github.com/SKTBrain/KoBERT.git@master
>```
>
>패키지를 다운로드 받은 후에 app.py 파일이 있는 프로젝트 폴더 내에서
>```python
>flask run
>```
