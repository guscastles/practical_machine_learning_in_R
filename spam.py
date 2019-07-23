# coding: utf-8
from __future__ import print_function

import pandas as pd
spam = pd.read_csv('spam.csv')
prediction = spam['your'].map(lambda x: "spam" if x > 0.5 else "nonspam")
pred_table = pd.crosstab(prediction, spam['type'], rownames=['prediction'], colnames=["type"])
accuracy = pred_table/len(spam['type'])
print(round(accuracy.loc['nonspam', 'nonspam'] + accuracy.loc['spam', 'spam'], 3))
