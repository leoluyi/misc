
# coding: utf-8

# In[1]:

import pandas as pd


# In[2]:

articles_df,articles_push_df = pd.read_pickle('PlaYnlp-Corpus/PTT___movie.pickle')


# In[3]:

import jieba


# In[35]:

jieba.enable_parallel(8)


# In[36]:

res = articles_df.text.apply(jieba.cut)


# In[37]:

text = [list(r) for r in res]


# In[15]:

pd.to_pickle(text, "cut_text.pickle")

