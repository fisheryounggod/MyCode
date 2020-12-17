1.get()：强烈推荐的字典键值访问方式
# %%
display(d.get('name'))
display(d.get('age'))
display(d.get('weight'))   # 返回None，不报错

2. items()：获取字典中的键值对
# %%
display(d.items())
display(d.keys())
display(d.values())
