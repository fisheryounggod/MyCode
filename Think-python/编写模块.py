#%%
def linecount(filename):
    count = 0
    for line in open(filename):
        count +=1
        return count
#%%
if __name__ == '__main__':
    print(linecount('编写模块.py'))

# %%
import 编写模块     # 作为模块，代码被跳过

# %%
编写模块

# %%
s = '1 2\t 3\n 4'
print(s)
print(repr(s))  # repr 返回字符串表示
# %%
