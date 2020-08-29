# 列表生成式
l = [12, 34, 56, 78]
print([i // 10 for i in l])
print([i - 10 * (i // 10) for i in l])
