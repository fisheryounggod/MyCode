# %% 格式化运算符
camels = 42
'%s' % camels

# %%
'I have spotted %d camels' % camels

# %%
'In %d years I have spotted %g %s.' % (3, 0.1, 'camels') # 元素个数必须相匹配

# %%
'In {:0>2f} years I have spotted {1} {2}.'.format(3.14, 0.1, 'camels')

# %%
help(format)
