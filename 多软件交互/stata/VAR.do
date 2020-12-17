***************************************************************
********************** 张华节计量 VAR 模型 **********************
***************************************************************

*------* VAR 模型 *--------*
// AR模型的多元扩展，用以反映一个系统中多个变量之间的动态影响。格兰杰因果检验、脉冲响应、方差分解都是VAR模型中重要的分析工具。


cd ~/documents/stata
use VAR,clear
// tostring/destring dateid,replace
// gen year=_n+1914
// order year
tsset year
tsline y1 || tsline y2 |||| tsline y21 || tsline y22 || tsline y23
tsline y1

*------* 单位根检验 *--------*

dfuller y1, trend regress //ADF
dfuller y1, noconstant regress //ADF
// pperron y1, lags(5) trend regress // PP
// dfgls y1, maxlag(8)        // DF_GLS 



// （1）估计VAR模型
var y1 y2 y21 y22 y23,level(99)
est store VAR1
// (2)根据信息准则确定VAR模型的最优滞后阶数，并根据结果重新估计。
varsoc cagdp fagdp open zbsd mytj, maxlag(4)
var y1 y2 y21 y22 y23,lags(1/2)
estimate store VAR2
// （3）考察VAR模型的平稳性
varstable, estimates(VAR2) graph dlabel
// （4）检验VAR模型残差的正态分布特征和自相关特征
varnorm, jbera estimates(VAR2)
// （5）对收入、投资、消费进行Granger因果检验
vargranger,estimates(VAR2)
// （6）绘制消费对收入的正脉冲响应图，以及收入的预测误差方差分解
irf create results1, set(myirf1) replace
irf graph oirf, impulse(y2) response(y21)
irf graph fevd, impulse(y2) response(y21 y1) lstep(2) 
// （7）比较两种不同的排序下Cholesky 分解的正交脉冲响应图
var y1 y2 y21 y22 y23 , lags(1/2) dfk
irf create order1, step(10) set(myirf1,replace)
irf create order2, step(10) order(y2 y1 y21 y22 y23)
irf ograph (order1 y2 y1  oirf) (order2 y2 y1 oirf)
// （8）比较收入变量的方差分解和正交分解表
irf table sfevd fevd, impulse(y1) noci std

// （9）根据VAR 模型的估计结果进行预测
fcast compute f_,step(8)
fcast compute f_, estimates(var1) step(8) synamic(tq(1978q1))

// SVAR 结构向量自回归
matrix A=(1,0,0\.,1,0\.,.,1)
matrix B=(.,0,0\0,.,0\0,0,.)
svar dln_inv dln_inc dln_consump if qtr<=tq(1978q4), aeq(A) beq(B)

// Johansen 协整检验
cd wang
use balance2,clear
vecrank cagdp fagdp open  mytj, lags(6) ic levela

// VEC  向量误差修正模型：VAR+协整关系
use lutkepohl2,clear
vec y1 y2 y21, alpha 
**其余步骤和VAR相同
