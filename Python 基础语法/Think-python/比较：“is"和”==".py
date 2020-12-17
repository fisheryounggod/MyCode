# “is"和”=="的不同点
字符串驻留机制

    1. 字符串驻留机制的含义

Python支持字符串驻留机制，对于符合标识符的字符串（注意：仅仅包含下划线_、字母、数字），才会启用字符串驻留机制。此时，保存一份相同且不可变的字符串，不同的值被存在驻留池中，因此，它们还是同一个东西。

    2. “is"和”=="的不同点

"=="用于判断两个对象的内容是否相同，只关注两个对象的值是否相等。
"is"是用于判断两个对象的内存地址是否相同，真正判断两个对象是不是同一个对象。
因此，is的要求更高，不仅要求值一样，同时还要求对象内存地址也是一样。
# %%
p = 'ab#'
q = 'ab#'
display(id(p),id(q))
display(p == q)
display(p is q)

# %%
m = '12_abv'
n = '12_abv'
display(id(m))
display(id(n))
display(m == n)
display(m is n)
p = 'ab#'
q = 'ab#'
display(id(p))
display(id(q))
display(p == q)
display(p is q)
