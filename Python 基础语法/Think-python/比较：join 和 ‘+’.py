"+"与"join"拼接字符串比较
    * 字符串进行拼接时，推荐使用"join"，少用"+"
# %%
import time
t1 = time.time()
s = ""
for i in range(1000000):
    s += "哈哈"
t2 = time.time()
display("用时：" + str(t2-t1))
t3 = time.time()
l = []
for i in range(1000000):
    l.append("哈哈")
m = "".join(l)
t4 = time.time()
display("用时：" + str(t4-t3))