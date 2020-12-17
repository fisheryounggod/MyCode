#%% 自定义类型

class Point:
    """Respresents a point in 2-D space."""


# %%
Point #由于 Point 是定义在顶层的,所以它的“全名”是__main__.Point。

# %% 类对象就像是一个用来创建对象的工厂。 要创建一个点,你可以像调用函数那样调用 Point
# 创建一个新对象的过程叫做实例化(instantiation),这个新对象叫做这个类的一个实例(instance)。
blank = Point()

# %%
