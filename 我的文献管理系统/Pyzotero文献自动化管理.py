#%%
from pyzotero import zotero

library_id = '7419495'
library_type='user'
api_key='jLaZeMrvj5H09dt4I8EqjPtb'

zot = zotero.Zotero(library_id, library_type, api_key)

#%%
items = zot.top(limit=5)
# we've retrieved the latest five top-level items in our library
# we can print each item's item type and ID
for item in items:
    print('item: %s | Key: %s' % (item['data']['itemType'], item['data']['key']))

# %%
zot.key_info() # 查看用户信息

#%%  检索条目
zot.count_items() # 返回库/组中所有项的计数
# %%
zot.top(limit=10) # 返回顶级Zotero库项目
# %%
zot.trash() # 回收站
# %%
zot.publications() # 我的出版物
#%%
zot.deleted(since='2021-01-01') # 我的删除项
# %%

#%%  检索文件

zot.file('MAFXULED')

# %% 去重

# write a file to the current working directory using the stored filename
zot.dump('BM8MZJBB')
# write the same file to a different path, with a new name
zot.dump('BM8MZJBB', 'article_1.pdf', '/home/beckett/pdfs')

#%% 检索集合
zot.collections()
zot.collections_top()

# %%其他
zot.tags() # 检索标签
zot.item_versions() # 版本信息

#%%
items = zot.top(limit=1)
#%%
zot.follow()
#%%
zot.creator_fields()


#%%
zot.attachment_simple(files[, parentid])
Zotero.attachment_both(files[, parentid])
.delete_item(item[, last_modified])
.delete_tags(tag_a[, tag …])
.create_collections(dicts[, last_modified])



# %%
使用案例
2.1 项目用途
提取 2020 年《经济研究》的文章标题、作者和摘要。

2.2 项目思路
将《经济研究》对应的内容添加到 Zotero 相应的集合；
通过Pyzotero库对集合所有的文章进行遍历，提取信息存为列表；
将列表存为DataFrame，导出为 Excel

#%%
from pyzotero import zotero
import pandas as pd

library_id = '7419495'  # 填入自己的id
library_type='user'  # 'user' or 'group'
api_key='jLaZeMrvj5H09dt4I8EqjPtb'   #填入自己的api_key

zot = zotero.Zotero(library_id, library_type, api_key)

colls = zot.collections() # 所有集合名称

# 选择待分析的集合
for coll in colls:
    if coll['data']['name'] == '经济研究':
        KEY=coll.get('key')

pyz = zot.collection_items(KEY) # 待分析集合的key

# 存储标题、摘要和作者
tittle = []
abstract = []
author = []
for p in pyz:
    try:
        tittle.append(p['data']['title'])
        abstract.append(p['data']['abstractNote'])
        # 期刊中的公告无作者
        author.append(p['meta']['creatorSummary'])
    except:
        # author.append("")
        pass

# 写入DataFrame
paper_info = {
    "tittle": tittle,
    "author": author,
    "abstract": abstract
}
df = pd.DataFrame(paper_info)

# 导出为Excel
df.to_excel("经济研究_2020.xlsx")
# %%
dir(zot)
# %%

dir(zot)
[
 'add_parameters',
 'add_tags',
 'addto_collection',
 'all_collections',
 'all_top',
 'api_key',
 'attachment_both',
 'attachment_simple',
 'backoff',
 'backoff_duration',
 'check_items',
 'children',
 'collection',
 'collection_items',
 'collection_items_top',
 'collection_tags',
 'collection_versions',
 'collections',
 'collections_sub',
 'collections_top',
 'content',
 'count_items',
 'create_collection',
 'create_collections',
 'create_items',
 'creator_fields',
 'default_headers',
 'delete_collection',
 'delete_item',
 'delete_saved_search',
 'delete_tags',
 'deleted',
 'deletefrom_collection',
 'dump',
 'endpoint',
 'everything',
 'file',
 'fmt',
 'follow',
 'fulltext_item',
 'get_subset',
 'groups',
 'item',
 'item_attachment_link_modes',
 'item_creator_types',
 'item_fields',
 'item_tags',
 'item_template',
 'item_type_fields',
 'item_types',
 'item_versions',
 'items',
 'iterfollow',
 'key_info',
 'last_modified_version',
 'library_id',
 'library_type',
 'links',
 'locale',
 'makeiter',
 'new_fulltext',
 'num_collectionitems',
 'num_items',
 'preserve_json_order',
 'processors',
 'publications',
 'request',
 'saved_search',
 'savedsearch',
 'searches',
 'self_link',
 'set_fulltext',
 'show_condition_operators',
 'show_conditions',
 'show_operators',
 'snapshot',
 'tag_data',
 'tags',
 'temp_keys',
 'templates',
 'top',
 'trash',
 'update_collection',
 'update_collections',
 'update_item',
 'update_items',
 'upload_attachments',
 'url_params']