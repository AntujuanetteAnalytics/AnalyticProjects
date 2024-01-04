#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
df = pd.read_csv('coding_qual_input.txt', header=None)


# In[2]:


def decode(message):
    split_text=df[0].str.split(' ',expand=True)
    split_text[0] = pd.to_numeric(split_text[0])
    sorted_text=split_text.sort_values(0,ascending=True)
    Numbers=sorted_text[0].tolist()
    Messages=sorted_text[1].tolist()
    invalid = 'invalid_range'
    words_decoded = []
    index = 0
    for i in range(1, len(Messages)):
        row = Messages[index:index+i]
        if row:
            index += i
            words_decoded.append(row[-1])
    solved=' '.join(words_decoded)        
    if i > index:
        return invalid
    else:
        return solved


# In[3]:


decode(df)

