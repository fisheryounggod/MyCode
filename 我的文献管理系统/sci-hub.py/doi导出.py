#%%
from pyzotero import zotero
import pandas as pd

library_id = '7419495'  # 填入自己的id
library_type='user'  # 'user' or 'group'
api_key='jLaZeMrvj5H09dt4I8EqjPtb'   #填入自己的api_key

zot = zotero.Zotero(library_id, library_type, api_key)

colls = zot.collections() # 所有集合名称

#%%
# # 选择待分析的集合
# for coll in colls:
#     if coll['data']['name'] == '资本账户':
#         KEY=coll.get('key')

pyz = zot.collection_items("TQ4SI9WA")

print(pyz[0])
# %%
