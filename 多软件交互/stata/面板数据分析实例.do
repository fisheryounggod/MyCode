

use "/Users/mac/Stata/计量与stata实例讲解数据//chap16/习题16.1.dta",clear
list year sale cost profit
encode diqu,generate(region)
xtset region year
xtdes
xtsum
xttab sale
xttab cost
xtline sale

//长面板分析

use "/Users/mac/Stata/计量与stata实例讲解数据//chap16/习题16.2.dta",clear

encode shengshi,generate(region)

xtset year region

xtsum

tab region,gen(region) //创建虚拟变量

reg profit cost income region2-region8 year,vce(cluster region ) //矫正面板的标准差
		//面板数据做回归的时候，如果不加cluster选项，默认的标准差假定模型的标准差对于给定个体在时间上是独立的，而事实上往往在各期之间会有相关性。
		//这种假定导致了标准差的低估。加上的话系数不会有改变，标准差的值会上升，模型更加robust.

estimates store ols

xtpcse profit cost income region2-region8 year,corr(ar1)
estimates store ar1

xtpcse profit cost income region2-region8 year,corr(psar1)
estimates store psar1

xtpcse profit cost income region2-region8 year,hetonly
estimates store hetonly
