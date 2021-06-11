webuse grunfeld,clear //利用webuse从网络读取数据

list in 1/10

xtset company year,yearly //设置面板数据格式，利用 Stata 中`xt`开头的命令，必须用该命令进行设置。yearly表示年度数据，详细参考 `help xtset`

// （1）个体效应和随机效应的联合显著性检验
xtreg invest mvalue kstock,fe //fe表示固定效应;若同时包括时期虚拟变量，xtreg invest mvalue kstock i.year,fe，利用 testparm 检验

xtreg invest mvalue kstock,re //re表示随机效应

xttest0  //检验随机效应是否显著，需要运行随机效应模型后使用

// （2）Hausman检验
xtreg invest mvalue kstock,fe
est store fe_result
xtreg invest mvalue kstock,re
est store re_result
hausman fe_result re_result

// （3）异方差和序列相关检验
// 当模型误差项存在序列相关或异方差时，此时经典的Hausman 检验不在适用
xtserial invest mvalue kstock //序列相关检验
xtreg invest mvalue kstock,fe
xttest3                       //异方差检验

// (4)模型选择其它方法
// 第一种：稳健 Hausman 检验**
webuse grunfeld, clear 
xtset company year
quiet xtreg invest mvalue kstock,re
scalar theta = e(theta)
global xlist2 invest mvalue kstock
sort company
foreach x of varlist $xlist2 {
     by company: egen mean`x' = mean(`x')
     generate md`x' = `x' - mean`x' 
     generate red`x' = `x' - theta*mean`x'
      }
quiet reg redinvest redmvalue redkstock mdmvalue mdkstock, vce(cluster company)
test mdmvalue mdkstock
