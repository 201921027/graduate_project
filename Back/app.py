import torch
import numpy as np
device = torch.device("cpu")
from kobert import get_pytorch_kobert_model

bertmodel, vocab = get_pytorch_kobert_model()

import gluonnlp as nlp
from kobert import get_tokenizer

bert_tokenizer = get_tokenizer()
tok = nlp.data.BERTSPTokenizer(bert_tokenizer, vocab, lower=False)

from torch import nn


class BERTClassifier(nn.Module):
    def __init__(self,
                 bert,
                 hidden_size=768,
                 num_classes=5,
                 dr_rate=None,
                 params=None):
        super(BERTClassifier, self).__init__()
        self.bert = bert
        self.dr_rate = dr_rate

        self.classifier = nn.Linear(hidden_size, num_classes)
        if dr_rate:
            self.dropout = nn.Dropout(p=dr_rate)

    def gen_attention_mask(self, token_ids, valid_length):
        attention_mask = torch.zeros_like(token_ids)
        for i, v in enumerate(valid_length):
            attention_mask[i][:v] = 1
        return attention_mask.float()

    def forward(self, token_ids, valid_length, segment_ids):
        attention_mask = self.gen_attention_mask(token_ids, valid_length)

        _, pooler = self.bert(input_ids=token_ids, token_type_ids=segment_ids.long(),
                              attention_mask=attention_mask.float().to(token_ids.device))
        if self.dr_rate:
            out = self.dropout(pooler)
        else:
            out = pooler
        return self.classifier(out)


bert_model = BERTClassifier(bertmodel, dr_rate=0.5).to(device)

# model load
bert_model.load_state_dict(torch.load('bert_model.pt', map_location=device))

max_len = 512


# 기쁨:0 분노:1 혐오:2 두려움:3 슬픔:4 unknown:5
def softmax(vals, idx):
    valscpu = vals.cpu().detach().squeeze(0)
    a = 0
    for i in valscpu:
        a += np.exp(i)
    return ((np.exp(valscpu[idx])) / a).item() * 100


def testModel(model, seq):
    cate = ["기쁨", "분노", "혐오", "두려움", "슬픔", "unknown"]
    tmp = [seq]
    transform = nlp.data.BERTSentenceTransform(tok, max_len, pad=True, pair=False)
    tokenized = transform(tmp)

    model.eval()
    result = model(torch.tensor([tokenized[0]]).to(device), [tokenized[1]], torch.tensor(tokenized[2]).to(device))
    idx = result.argmax().cpu().item()
    print("일기의 감정:", cate[idx])
    print("신뢰도:", "{:.2f}%".format(softmax(result, idx)))
    return cate[idx]
# koBART

import torch
from transformers import PreTrainedTokenizerFast, BartForConditionalGeneration




from flask import Flask, request
input_text = ''
emotion = ''
output = ''
app = Flask(__name__)

# 루트 인터페이스. 서버 주소(127.0.0.1:5000)의 루트 폴더.
@app.route('/emotion_', methods=['POST'])
def emotion_():
    global input_text
    global emotion
    global output
    diary = request.form['diary']
    input_text = diary
    emotion = testModel(bert_model, input_text)

    return emotion
@app.route('/comment')
def comment():
    global input_text
    global emotion
    global output
    tokenizer = PreTrainedTokenizerFast.from_pretrained('digit82/kobart-summarization')
    model = BartForConditionalGeneration.from_pretrained('./KoBART-summarization/logs/model_chp')
    if len(input_text) + len(" TL;DR ") > 800:
        input_text = input_text[0:400] + input_text[len(input_text) - 400:len(input_text)]

    input_text = input_text + " TL;DR "
    text = emotion + '| ' + input_text
    text = text.replace('\n', ' ')

    # print(text)
    raw_input_ids = tokenizer.encode(text)
    input_ids = [tokenizer.bos_token_id] + raw_input_ids + [tokenizer.eos_token_id]

    summary_ids = model.generate(torch.tensor([input_ids]), num_beams=4, max_length=512, eos_token_id=1)
    output = tokenizer.decode(summary_ids.squeeze().tolist(), skip_special_tokens=True)
    return output


@app.route('/')
def index():
    return 'home. nothing.'


# 루트 아래의 string 폴더에 접근할 때 보여줄 내용
@app.route('/emotion_result')
def send_string():
    global emotion

    return emotion


if __name__ == '__main__':
    app.run(host='192.168.0.29', debug=True)
