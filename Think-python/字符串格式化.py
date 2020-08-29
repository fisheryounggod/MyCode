#!/usr/bin/env python

principal = 1000  # 初始金额
rate = 0.05  # 利率
numyears = 5  # 年数
year = 1

# 法一
while year <= numyears:
    principal = principal * (1 + rate)
    print('%3d %.2f' % (year, principal))
    year += 1
print('\n')
# 法二
for i in range(1, numyears + 1):
    principal *= (1 + rate)
    print(format(i, '3d'), format(principal, '.2f'))  # format函数的用法

    # 冒号前表示字符串方法format（）的参数，后部表示格式说明
    print("{0:3d} {1:0.2f}".format(i, principal))
