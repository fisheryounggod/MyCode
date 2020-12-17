字符串处理

1. split拆分字符串
# %%
str_test = "I a,m 极简XksA wh,o are you ？"
# str2 = str_test.split(',')
str2 = str_test.split('')
str2

2. strip删除字符串前后多余字符
# %%
str_test1 = " ABCDE\t \n "
str_test2 = "我爱你啊！ 才怪"
str2 = str_test2.strip("才 怪")
str2

3. join连接列表字符串
# %%
lt3 = ['2018','10','20']
r_join = "-".join(lt3)
r_join
#%%  I love you
import string
l = string.ascii_letters
s =[]
s.append(l[34])
s.append(l[11])
s.append(l[14])
s.append(l[21])
s.append(l[4])
s.append(l[24])
s.append(l[14])
s.append(l[20])
s.insert (1," ")
s.insert (6," ")
string = "".join(s)
print(string)
#%%


4. 字符与ASCII码转换
# %%
n,m = "A",73
print('n的ASCII为：'+str(ord(n)))
print('ASCII m表示：'+chr(m))
#%%


5. 区别两者
#%%
row = ["1", "bob", "developer", "python"]
print(','.join(str(x) for x in row))
# print(str(''.join(str(row))).strip('[]))

# %% 相当于以下
print(*row, sep=',')
#%%

6. 翻转一个字符串
#%%
a = "ilovepython"
print(a[::-1])
