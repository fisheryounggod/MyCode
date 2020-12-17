*案例1.4

reshape long number,i(region)j(year)
//将数据进行长短变换
reshape wide number,i(region)j(year)
//变回来，长变短
encode region,gen(regi)
//把字符串转为数值型，新的变量呈蓝色，文字点开是数字
	
	//设置随机变量
clear //清空数据
set obs 15 //设置15个观测样本
gen suiji=uniform() //生成一个从0——1的随机变量

//拓展
uniform()默认是0——1，如何随机生成9——18的数？
gen suiji=9+9*uniform()
//如何将上一步随机取整？
gen suiji=9+trunc(9*uniform()) //用trunc函数

**1.6定义数据子集
*案例1.5
list in 3 //列出第三条数据
list in 1/3 //列出前三条数据
sort shangjiao
list in 1/2 //列出shangjiao最小两条数据
list if year>2005 //列出year>2005年的数据
list if year>2005&shangjiao>865
	drop in 3
	drop if year==2005
	drop if year>2005&shangjiao>865

**1.7本章习题
	*1.创建stata格式数据并保存
	*2.
gen avsale=sale/people
replace sale=sale/people
replace avsale=avsale/10
gen lpeople=ln(people)
	*3.
tabulate type,gen(type)
gen number1=autocode(number,3,1,25)

sort number
gen number2=group(4)
	*4.
reshape long goal,i(name)j(year)
encode name,gen(na)
	*5.略


	
	
	
	
	
***第二章，stata制图
*案例2.1直方图
histogram number,frequency
histogram number,frequency title("案例2.1结果")

histogram number,frequency title("案例2.1结果") ///
 xlabel(0(25)300) ylabel(0(1)10)
 
histogram number,frequency title("案例2.1结果") ///
 xlabel(0(25)300) ylabel(0(1)10) ytick(0(0.5)10)

histogram number,frequency title("案例2.1结果") xlabel(0(25)300) ///
 ylabel(0(1)10) ytick(0(0.5)10)start(10) width(25)
 
*案例2.2散点图
graph twoway scatter SG TZ

graph twoway scatter SG TZ,title("案例2.2结果") ///
 xlabel(56(2)80) ylabel(150(10)190) ytick(150(5)190)

graph twoway scatter SG TZ,title("案例2.2结果") xlabel(56(2)80) ///
 ylabel(150(10)190) ytick(150(5)190) msymbol(D) //散点圆点变方框
 
graph twoway scatter SG TZ,title("案例2.2结果") xlabel(56(2)80) ///
 ylabel(150(10)190) ytick(150(5)190) msymbol(D)mcolor(yellow) //散点变黄色

*案例2.3曲线绘制图
graph twoway line total first year

graph twoway line total first year,title("案例2.3结果")  ///
 xlabel(1997(2)2012) ylabel(0(10)80) xtick(1997(1)2012)
 
graph twoway line total first year,title("案例2.3结果")  ///
xlabel(1997(2)2012) ylabel(0(10)80) xtick(1997(1)2012)  ///
legend(label(1 "总进球数")label(2 "第一射手进球数")) //修改标签

graph twoway line total first year,title("案例2.3结果") xlabel(1997(2)2012) ///
 ylabel(0(10)80) xtick(1997(1)2012) legend(label(1 "总进球数") ///
 label(2 "第一射手进球数")) clpattern(solid dash) //一条实线一条虚线
 
*案例2.4连线绘制图
graph twoway connected  number month

graph twoway connected  number month,title("案例2.4结果") xlabel(1(1)12) ///
 ylabel(1000(1000)7000) ytick(1000(500)7000) //修改刻度
 
graph twoway connected  number month,title("案例2.4结果") xlabel(1(1)12) ///
 ylabel(1000(1000)7000) ytick(1000(500)7000) clpattern(dash) //虚线
 
graph twoway connected  number month,title("案例2.4结果") xlabel(1(1)12) ///
 ylabel(1000(1000)7000) ytick(1000(500)7000) clpattern(dash) msymbol(D) //方框
 
*案例2.5箱图
 graph box SCFE
 
 graph box SCFE,over(Center)
 
*案例2.6饼图
graph pie CANYIN FANGCHAN ZHIZAO
graph pie CANYIN FANGCHAN ZHIZAO,pie(1,explode)pie(2,color(yellow))  ///
plabel(1 percent,gap(20)) plabel(2 percent, gap(20)) //突出显示，数据标签

*案例2.7条形图
graph bar sum,over(team)

graph bar sum,over(team)title("案例2.7结果")  ///
ylabel(1000(1000)7000) ytick(1000(500)7000) //刻度和标题

graph bar sum number ,over(team)title("案例2.7结果")  ///
ylabel(1000(1000)7000) ytick(1000(500)7000) //加入Number,观察和人数有关否

*案例2.8点图
graph dot man wowan,over( name)
graph dot man wowan,over( name)title("案例2.8结果")  ///
marker(1,msymbol(D)) marker(2,msymbol(t)) //标题 散点改方框和三角形


**2.9本章习题
histogram DLXF ,frequency

graph twoway scatter YW SX //语文和数学成绩散点图

graph twoway line total new year //总人数和新出生人数情况

graph twoway connected  number year //随着时间，上司公司数量增长情况







***第三章stata描述统计实例

*3.1定距变量的描述性统计
summarize cunsumption //显示平均值、标准差、最小值、最大值
summarize cunsumption,detail // Skewness,偏度>0右偏，<0左偏,=0对称分布
	* Kurtosis，峰度，>3则比正态分布值有个更长的尾巴，反之，短
tabstat cunsumption,stats(mean range sum var) //均值 极差 总和 方差

tabstat cunsumption,stats(mean range sum var) by( region) 
//根据省份显示，不会显示极差和方差

ci cunsumption,level(98) //98%的置信区间,数据均值98%可能会落在该区间

	**统计量与对应的代码：
	//均值mean，总和sum,极差range,变异系数cv,峰度Kurtosis,四分位距iqi
	//非缺失值总数count,最大值max,标准误semean,中位数median,四分位数q
	//计数n,最小值min,方差var,偏度Skewness,第一个百分位数p1
	
*3.2正态性检验和数据转换 //本例主要讲非线性转换
sktest sum //sktest原假设是数据呈正态分布
//本例中(Skewness)= 0.0065 <0.05拒绝，峰度Kurtosis=0.0804>0.05接受
//综合来看P值，prob=0.0123,P值越小越拒绝原假设，该处拒绝

gen srsum=sqrt( sum)
sktest srsum //Pr(Skewness)= 0.4418接受,Pr(Kurtosis)= 0.9062接受
//Prob>chi2= 0.7293接受原假设，数据符合正态分布

gen lsum=ln(sum)
sktest lsum // Pr(Skewness)=0.0462<0.05,拒绝  Pr(Kurtosis)= 0.2609,接受
//Prob>chi2= 0.0774>0.05，接受正太分布原假设.
	**拓展
ladder sum
*结果显示如下：
//Transformation         formula               chi2(2)       P(chi2)
------------------------------------------------------------------
cubic                  sum^3                  37.26        0.000显著拒绝
square                 sum^2                  26.32        0.000显著拒绝
identity               sum                     8.80        0.012
square root            sqrt(sum)               0.63        0.729显著接受
log                    log(sum)                5.12        0.077显著接受
1/(square root)        1/sqrt(sum)            20.13        0.000
inverse                1/sum                  33.29        0.000
1/square               1/(sum^2)              45.24        0.000
1/cubic                1/(sum^3)              47.92        0.000

gladder sum //想看图
	**数据变换与其对应的stata命令以及达到的效果
	//y=x^3   立方        减少严重负偏态
    //y=x^2   平方        减少轻度负偏态
	//y=sqrt(x)  平方根  减少轻度正偏态
	//y=ln(x)   自然对数  减少轻度正偏态
	//y=log10(old)   以10为底的对数  减少正偏态
	//y=-(sqrt(x))  平方根负对数  减少严重正偏态
	//y=-(x-1)   负倒数  减少非严重正偏态
	//y=-(x-2)   负倒数  减少非严重正偏态
	//y=-(x-3)   负倒数  减少非严重正偏态
	
*3.3单个分类变量的汇总

tabulate marry
tabulate marry,plot

*3.4两个分类变量的列联表分析
clear
tabulate smoke drink
tabulate smoke drink,column row

*3.5多表和多列联表分析
tab1 account audit economy  //单维变量分析
tab2 account audit economy //二维变量分析

by account,sort:tabulate audit economy //三维变量分析

table account audit economy,contents(freq) //拓展


	*contents括号内支持的内容与命令符号对应的关系
	//freq   频数；sdx 标准差；comfx x非缺失观察值的计数
    //ux x非缺失观察值的计数;max x x的最大值；sum x x的总和
	//min x x的最小值；median x 的中位数；mean x x的平均数
	//rawsum x 忽略任意和规定权数的总和；iqr x x的四分位距；p1 x x的一个百分位数

**3.6本章习题
summarize cunsumption,detail

sktest sum
gen srsum=sqrt( sum)
sktest srsum 
gen lsum=ln(sum)
sktest lsum

tabulate pass

tabulate downsalary downrank

tab1 music sport art
tab2 music sport art
by music,sort:tabulate sport art








***第四章stata参数检验实例

*4.1单一样本T检验
ttest weight=67.4 //依次是有效样本观测量 均值 标准误 标准差 95%的置信区间
 ttest weight=67.4

//One-sample t test
//------------------------------------------------------------------------------
//Variable |     Obs        Mean    Std. Err.   Std. Dev.   [95% Conf. Interval]
//---------+--------------------------------------------------------------------
// weight |      53    58.61887    .7094891    5.165159    57.19517    60.04256
//------------------------------------------------------------------------------
//    mean = mean(weight)                                           t = -12.3767
//Ho: mean = 67.4                                  degrees of freedom =       52

//   Ha: mean < 67.4             Ha: mean != 67.4               Ha: mean > 67.4
//Pr(T < t) = 0.0000         Pr(|T| > |t|) = 0.0000          Pr(T > t) = 1.0000


	*判断：Pr(|T| > |t|) = 0.0000 <0.05显著拒绝原假设，认为体重有较大变化

ttest weight=67.4,level(99) //改变置信区间

*4.2独立样本T检验
ttest englishA= englishB,unpaired //拒绝原假设
ttest englishA= englishB,unpaired level(99)
ttest englishA= englishB,unpaired level(99)unequal 
	//默认两样本方差相同，上面改为异方差，看结果是否相同

*4.3配对样本T检验
ttest qian=hou //拒绝原假设，减肥药有效果
ttest qian=hou,level(99)

*4.4单一样本方差的假设检验
sdtest return=1 //检验方差是否等于1
sdtest return=1,level(99)

*4.5双样本方差的假设检验
sdtest returnA= returnB 
	//2*Pr(F < f) = 0.9614，拒绝原假设，认为两只股票收益波动率相同
sdtest returnA= returnB,level(99)

**4.6本章习题
ttest high=175 //Pr(|T| > |t|) = 0.0000  拒绝原假设

ttest yuwenx= yuweny,unpaired // Pr(|T| > |t|) = 0.0000 ，拒绝，两校语文成绩不同

ttest qian= hou //Pr(|T| > |t|) = 0.0751,接受，前后差别不大，认为杀虫剂没有效果

sdtest return=1 //拒绝

sdtest returnA= returnB  //两只股票收益波动率相同








***第五章stata非参数检验
*5.1单样本正态分布检验
swilk speed // Prob>z=0.00000<0.05,拒绝原假设，认为不符合正态分布
sktest speed //使用偏度峰度正态分布检验

swilk speed if speed>12.5 //对数据的子集进行正态分布检验

*5.2两独立样本检验
ranksum sum,by( group) //Prob > |z| = 0.3556>0.05,接受原假设，认为存在显著差异
ranksum sum if year>1990,by( group)

*5.3两相关样本检验
signtest qian= hou //原假设是两组不存在差别，正负数应该相等，如果不等就存在差异
signtest qian= hou if qian>12

*5.4多独立样本检验
kwallis goal,by( school) //probability =0.0001<0.05拒绝原假设，有差异
kwallis goal if goal>75,by( school)

*5.5游程检验//判断样本序列是否为随机序列
runtest number 
// Prob>|z| = .84>0.05,接受原假设，认为数据是随机的，不存在自相关现象，生产正常
runtest number,mean //默认中位数作为参考数值，这里改为均值作为参考数值

**5.6本章习题
swilk math  // Prob>z=0.06546>0.05,接受原假设，认为符合正态分布
sktest math // Prob>chi2= 0.0675>0.05,偏度峰度检查也认为服从正态分布

ranksum sum,by(group) // Prob > |z| = 0.3556，接受，认为没有显著差异

signtest qian= hou

kwallis goal,by( country ) //probability = 0.0001<0.05拒绝原假设，有差异

runtest distance // Prob>|z| = .06>0.05，接受原假设，认为每加仑行驶英里数随机








***第六章stata方差分析实例
*6.1单因素方差分析
oneway weight group,tabulat // Prob>chi2 = 0.000<0.05拒绝，认为四种药物影响显著不同
oneway weight group if weight>72,tabulat

*6.2多因素方差分析
anova renew method time method#time 
//   Number of obs =         40    R-squared     =  0.9941
                         Root MSE      =    .516774    Adj R-squared =  0.9936

                  Source | Partial SS         df         MS        F    Prob>F
             ------------+----------------------------------------------------
                   Model |   1617.925          3   539.30832   2019.46  0.0000
                         |
                  method |     1322.5          1      1322.5   4952.15  0.0000
                    time |  294.84899          1   294.84899   1104.07  0.0000
             method#time |  .57599959          1   .57599959      2.16  0.1506
                         |
                Residual |  9.6140004         36   .26705557  
             ------------+----------------------------------------------------
                   Total |   1627.539         39   41.731768  
//解读：R-squared=0.9941拟合度接近1,说明解释可靠。method显著, time显著,method#time不显著

anova renew method time method#time if renew>11

*6.3协方差分析
anova nowsalary identity policy c.beforesalary

//  Number of obs =         30    R-squared     =  0.8705
                         Root MSE      =    .547489    Adj R-squared =  0.8498

                  Source | Partial SS         df         MS        F    Prob>F
             ------------+----------------------------------------------------
                   Model |  50.373071          4   12.593268     42.01  0.0000
                         |
                identity |  .90571998          2   .45285999      1.51  0.2402
                  policy |  .00221799          1   .00221799      0.01  0.9321
             beforesal~y |  34.002573          1   34.002573    113.44  0.0000
                         |
                Residual |  7.4935952         25   .29974381  
             ------------+----------------------------------------------------
                   Total |  57.866667         29   1.9954023  
//数据解读：identity、 policy均不显著， beforesal~y显著
anova nowsalary identity policy c.beforesalary c.beforesalary# identity ///
 c.beforesalary# policy identity# policy
 
anova nowsalary identity policy c.beforesalary c.beforesalary# identity
regress
//
      Source |       SS           df       MS      Number of obs   =        30
-------------+----------------------------------   F(5, 24)        =    102.19
       Model |  55.2705128         5  11.0541026   Prob > F        =    0.0000
    Residual |  2.59615385        24  .108173077   R-squared       =    0.9551
-------------+----------------------------------   Adj R-squared   =    0.9458
       Total |  57.8666667        29   1.9954023   Root MSE        =     .3289

-----------------------------------------------------------------------------------------
              nowsalary |      Coef.   Std. Err.      t    P>|t|     [95% Conf. Interval]
------------------------+----------------------------------------------------------------
               identity |
                     2  |   1.903846   .4334928     4.39   0.000     1.009161    2.798531
                     3  |  -1.423077   .2745441    -5.18   0.000    -1.989708   -.8564458
                        |
               1.policy |  -.4230769   .1982845    -2.13   0.043    -.8323161   -.0138378
           beforesalary |   1.807692   .1356133    13.33   0.000       1.5278    2.087584
                        |
identity#c.beforesalary |
                     2  |  -.9038462   .1343289    -6.73   0.000    -1.181087   -.6266049
                     3  |          0  (omitted)
                        |
                  _cons |  -5.95e-14   .3797773    -0.00   1.000    -.7838217    .7838217
-----------------------------------------------------------------------------------------
//
anova nowsalary identity policy c.beforesalary c.beforesalary# identity ///
if age>26


*6.4重复测量方差分析
anova sale number plan,repeated(plan)
//
                         Number of obs =         40    R-squared     =  0.7726
                         Root MSE      =    13.1535    Adj R-squared =  0.5331

                  Source | Partial SS         df         MS        F    Prob>F
              -----------+----------------------------------------------------
                   Model |    11165.5         20     558.275      3.23  0.0067
                         |
                  number |   3241.275         19   170.59342      0.99  0.5121
                    plan |   7924.225          1    7924.225     45.80  0.0000
                         |
                Residual |   3287.275         19   173.01447  
              -----------+----------------------------------------------------
                   Total |  14452.775         39   370.58397  


//解释：销售量与网点没有太大关系，与实施计划 plan有关
anova sale number plan if sale>40,repeated(plan)

**6.5本章习题
oneway sale pack // Prob>chi2 = 0.178>0.05，接受，认为包装与销售情况无显著相关

anova renew pack taste pack# taste
 //Number of obs =         20    R-squared     =  0.0362
                         Root MSE      =     18.218    Adj R-squared = -0.0173

                  Source | Partial SS         df         MS        F    Prob>F
              -----------+----------------------------------------------------
                   Model |     224.45          1      224.45      0.68  0.4216
                         |
                    pack |     224.45          1      224.45      0.68  0.4216
                   taste |          0          0
              pack#taste |          0          0
                         |
                Residual |     5974.1         18   331.89444  
              -----------+----------------------------------------------------
                   Total |    6198.55         19   326.23947  

//模型解释效果很差

anova nowsalary identity policy c.beforesalary
anova nowsalary identity  c.beforesalary c.beforesalary#identity  ///
c.beforesalary#policy identit#policy
anova nowsalary identity  c.beforesalary#identity identit#policy

anova sale number plan,repeated(plan)


***第七章stata相关分析
*7.1简单相关分析
correlate month tem hour
correlate month tem hour,covariance //变量的方差协方差矩阵
pwcorr month tem hour,sig //样本的协方差检验
pwcorr month tem hour,sidak sig //更为精确的sidak方法，相关显著性会提高
pwcorr month tem hour,sidak sig star(0.01) //相关的显著性检验

*7.2偏相关分析
pcorr YW SX IQ
//(obs=12)

Partial and semipartial correlations of YW with

               Partial   Semipartial      Partial   Semipartial   Significance
   Variable |    Corr.         Corr.      Corr.^2       Corr.^2          Value
------------+-----------------------------------------------------------------
         SX |   0.8933        0.2651       0.7980        0.0703         0.0002
         IQ |  -0.1196       -0.0161       0.0143        0.0003         0.7261
//解读，yw和sx成绩的偏相关系数是0.8933，显著性水平是 0.0002 
//解读，控制住yw成绩的情况下，sx和iq之间的偏相关关系 是-0.1196 

pcorr YW SX IQ if IQ>100


**7.3本章习题
use "D:\Stata14\ado\data\chap07\习题\习题7.1.dta", clear //调入数据
correlate TL CY HLD
pwcorr TL CY HLD ,sidak sig star(0.01) //相关系数的显著性检验

pcorr nianling gongzi xingbie //控制性别研究年龄与工资偏相关关系
pcorr  nianling gongzi gongling//控制工龄研究年龄与工资偏相关关系
pcorr gongzi gongling nianling //控制年龄研究工资与工龄偏相关关系








***第八章stata主成分分析与因子分析实例

*8.1主成分分析
correlate V2-V19 //先看一下变量之间的相关性，判断是否适合主成分分析
pca V2-V19 //对这些变量提取主成分
//
Principal components/correlation                 Number of obs    =          8
                                                 Number of comp.  =          7
                                                 Trace            =         18
    Rotation: (unrotated = principal)            Rho              =     1.0000

    --------------------------------------------------------------------------
       Component |   Eigenvalue   Difference         Proportion   Cumulative
    -------------+------------------------------------------------------------
           Comp1 |       14.442      13.0228             0.8023       0.8023
           Comp2 |      1.41918      .429462             0.0788       0.8812
           Comp3 |      .989717      .118447             0.0550       0.9362
           Comp4 |       .87127      .629391             0.0484       0.9846
           Comp5 |      .241878      .214668             0.0134       0.9980
           Comp6 |     .0272104     .0184781             0.0015       0.9995
           Comp7 |    .00873232    .00873232             0.0005       1.0000
           Comp8 |            0            0             0.0000       1.0000
           Comp9 |            0            0             0.0000       1.0000
          Comp10 |            0            0             0.0000       1.0000
          Comp11 |            0            0             0.0000       1.0000
          Comp12 |            0            0             0.0000       1.0000
          Comp13 |            0            0             0.0000       1.0000
          Comp14 |            0            0             0.0000       1.0000
          Comp15 |            0            0             0.0000       1.0000
          Comp16 |            0            0             0.0000       1.0000
          Comp17 |            0            0             0.0000       1.0000
          Comp18 |            0            .             0.0000       1.0000
    --------------------------------------------------------------------------

//Eigenvalue特征值越大，主成分的解释能力越强
//Proportion共线率，第一个变量共线率 0.8023，表示它解释了主成分80%左右的信息
//=Cumulative累计方差贡献率，1-7是有效主成分

pca V2-V19,mineigen(1)
pca V2-V19,components(1) //只对一个主成分进行分析

*8.2因子分析
	*主成分因子法
	factor V2- V7,pcf
	rotate //在上一步基础上对因子结构进行旋转
	loadingplot,factors(2) yline(0) xline(0) //因子旋转后的因子在和图
	predict f1 f2 //因子得分系数矩阵
	list V1 f1 f2 //展示一个每个变量的因子得分情况
	correlate f1 f2 //发现主因子之间的相关程度非常低
	scoreplot,mlabel( V1) yline(0) xline(0) //展示每个样本的因子得分示意图
	estat kmo //kmo检验，用于看数据是否适合因子分析，取值范围0-1
	//解释：0.9——1极好，0.8——0.9可奖励的，0.7——0.8还好，0.6——0.7中等，0.5-0.6糟糕，0.005不可接受
	screeplot //因子分析所提取的各个因子的特征值趋势图
	
	*主因子法
	factor V2- V7,pf
	
	*迭代公因子方差的主因子法
	factor V2- V7,ipf
	
	*最大似然因子法
	factor V2- V7,ml
**8.3本章习题
correlate V2-V7
pca V2-V7 //主成分分析

factor V2- V7,pcf
	rotate 
	

	
	
	
	
	

***第九章stata聚类分析实例
*9.1 划分聚类分析法
egen zv2=std(V2) //进行标准化处理
egen zv3=std(V3)
egen zv4=std(V4)

sum zv2 zv3 zv4 //对这些样本进行描述性分析
cluster kmeans zv2 zv3 zv4,k(2) //按均值分类
cluster kmeans zv2 zv3 zv4,k(3) 

cluster kmedians zv2 zv3 zv4,k(3) //按中位数分类
cluster kmeans zv2 zv3 zv4,k(2)measure(L2squared) //欧氏距离平方法
cluster kmeans zv2 zv3 zv4,k(2)measure(L2squared) name(abc) start(firstk)
//设置初始距离中心
cluster kmeans zv2 zv3 zv4,k(2)measure(L2squared) name(abcg) start(firstk,exclude)
//把设置为初始距离中心的变量排除掉

*9.2 层次聚类分析法
egen zv2=std(V2) //进行标准化处理
egen zv3=std(V3)
egen zv4=std(V4)
egen zv5=std(V5)
sum zv2-zv5
	cluster singlelinkage zv2- zv5 //最短连接法
cluster dendrogram //画图
	cluster completelinkage zv2- zv5 //最长连接法
cluster dendrogram //画图	
	cluster averagelinkage zv2- zv5 //平均连接法
cluster dendrogram //画图	
	cluster waveragelinkage zv2- zv5 //加权平均连接法
cluster dendrogram //画图	
	cluster medianlinkage zv2- zv5 //中位数连接法
cluster dendrogram //画图	
	cluster centroidlinkage zv2- zv5  //重心连接法
cluster dendrogram  //这种方法没法画图，会报错
	cluster wardslinkage zv2- zv5 //ward连接法
cluster dendrogram //画图	

cluster gen type1=group(4)

**9.3本章习题
egen zv2=std(V2) //进行标准化处理
egen zv3=std(V3)
egen zv4=std(V4)
egen zv5=std(V5)
egen zv6=std(V6)
sum zv2-zv6 //对这些样本进行描述性分析
	cluster kmeans zv2- zv6,k(3)
	cluster kmedians zv2- zv6,k(3)
	
	
egen zv2=std(V2) //进行标准化处理
egen zv3=std(V3)
egen zv4=std(V4)
	cluster singlelinkage zv2- zv4
cluster dendrogram
	//其它方法不再列举

	
	
	
	
	
	
	

***第十章stata最小二乘回归分析实例

*10.1简单线性回归分析
summarize year inflation unwork,detail //先做一个描述性分析
correlate year inflation unwork
	reg unwork inflation 
vce //得到各自变量系数的方差、协方差矩阵
test inflation
predict yhat //对因变量的拟合值进行预测 回归预测
predict e,resid //模型回归的残差序列
	reg unwork inflation,nocon //不要常数项
	reg unwork inflation if year>2000

*10.2多重线性回归分析

sum TC Q PL PF PK
correlate TC Q PL PF PK
	reg TC Q PL PF PK
vce
test Q PL PF PK //测算结果是拒绝原假设，模型总体上是显著的
predict yhat //对因变量的拟合值进行预测 回归预测
predict e,resid //模型回归的残差序列
	reg TC Q PL PF,nocon //不要常数项
	reg TC Q PL PF if Q>100
sw regress TC Q PL PF PK,pr(0.05) //自动剔除在0.05水平上不显著的自变量

**10.3本章习题
regress TC Q
regress TC Q,nocon

regress lw80 s80 expr80 tenure80 iq









***第十一章stata回归诊断与应对实例
*11.1异方差检验与应对
sum  V1 V2 V3 V4 V5,detail
correlate  V1 V2 V3 V4 V5
reg V1 V2 V3 V4 V5
vce
test V2 V3 V4 V5
predict yhat
predict e,resid
	rvfplot //绘图，看看是否存在异方差
	rvpplot V2
	estat imtest,white //怀特检验
//White's test for Ho: homoskedasticity
         against Ha: unrestricted heteroskedasticity

         chi2(14)     =     73.48
         Prob > chi2  =    0.0000

Cameron & Trivedi's decomposition of IM-test

---------------------------------------------------
              Source |       chi2     df      p
---------------------+-----------------------------
  Heteroskedasticity |      73.48     14    0.0000
            Skewness |      22.34      4    0.0002
            Kurtosis |       2.62      1    0.1052
---------------------+-----------------------------
               Total |      98.45     19    0.0000
---------------------------------------------------
//原假设：数据是同方差，Prob > chi2  = 0.0000显著拒绝原假设，认为存在异方差

estat hettest,iid
estat hettest,rhs iid
estat hettest V2,rhs iid //BP的解释与上述一致，认为存在异方差

reg V1 V2 V3 V4 V5,robust //V3,V5变量的显著性都得到了一定程度的提高


//拓展：使用加权最小二乘法回归分析方法来解决数据的异方差性
reg V1-V5
drop e
predict e,resid //估计残差
gen ee=e^2 //对残差进行平方变换
gen lnee= ln(ee)
	reg lnee V2,nocon  //以残差平方得到的对数值，以V2为自变量进行回归，不包括常数项
predict yhat	
gen yhathat=exp(yhat) //对因变量的拟合值进行指数变换
reg V1 V2 V3 V4 V5 [aw=1/yhathat] //加权最小二乘回归分析


*11.2自相关检验与应对
sum month profit asset,detail
correlate month profit asset
reg profit asset
vce
test asset
predict yhat //看看因变量的拟合值
predict e,resid //回归模型的估计残差
	*进行自相关研究的时候，多数是针对时间序列数据

tsset month //定义以month为周期的时间序列数据
scatter e l.e // 绘制残差和残差滞后一期的散点图，显示存在自相关
ac e //自相关图，探索滞后阶数
pac e //偏自相关图，显示主要是一节自相关
estat bgodfrey //BJ检验，原假设是数据没有自相关,这里P值为0，拒绝原假设
wntestq e //bpq检验，原假设是数据没有自相关,这里P值为0，拒绝原假设
estat dwatson  //dw检验，原假设是数据没有自相关的值为2,这里值为0.355.
//小于2为正的自相关，拒绝原假设。


	*#怎么改进自相关现象？
采用异方差自相关稳健的标准差进行回归分析
di 49^0.25 //先计算阶数，样本个数的1/4次方，结果是2.6457513，所以我们认为阶数为3
newey profit asset,lag(3)

采用广义最小二乘回归法来解决数据的异方差性
prais profit asset,corc

//Durbin-Watson statistic (original)    0.354538
//Durbin-Watson statistic (transformed) 1.927109
	//	可以看出接近于2，消除了自相关，但同时牺牲掉了模型的解释力

prais profit asset,nolog  //用PW估计法

*11.3多重共线性检验与应对
	*方法一：逐步剔除多重共线性的变量
sum  V1 V2 V3 V4 V5 V6,detail
correlate  V1 V2 V3 V4 V5 V6
reg V2 V3 V4 V5 V6 //部分变量不显著，说明可能存在多重共线性
estat vif //对多重共线性进行检验，vif指方差膨胀因子，其合理值是10
reg V2 V3 V4 V6 
reg V2 V3 V4 //V4的显著性不好，删掉再回归
reg V2 V3 //完美，得出结论是 V3 能解释 V2
	
	*方法二：因子分析法
factor V3 V4 V5 V6,pcf
predict f1
reg V2 f1
vif

*11.4本章习题
sum  V1 V2 V3 V4 V5,detail
correlate  V1 V2 V3 V4 V5
reg V1 V2 V3 V4 V5
vce
test V2 V3 V4 V5 //各个变量的联合显著性
predict yhat //看看因变量的拟合值
predict e,resid //回归模型的估计残差
rvfplot //绘制残差和因变量拟合值的散点图，判断数据是否存在异方差
rvfplot V2
	//下面详细判断是否存在异方差
estat bgodfrey //BJ检验，原假设是数据没有自相关,这里P值为0，拒绝原假设
estat hettest V2,iid //BP的解释与上述一致，认为存在异方差
estat hettest V2,rhs iid //BP的解释与上述一致，认为存在异方差

//使用稳健标准差对数据进行回归分析
reg V1 V2 V3 V4 V5,robust

//使用最小二乘法
drop yhat
drop e
reg V1 V2 V3 V4 V5
predict e,resid 
predict yhat
gen ee=e^2 //对残差进行平方变换
gen lnee= ln(ee)
	reg lnee V2,nocon  
gen yhathat=exp(yhat) //对因变量的拟合值进行指数变换
reg V1 V2 V3 V4 V5 [aw=1/yhathat] //加权最小二乘回归分析


*#游客与资金投入
sum month number money,detail
cor month number money
reg number money
vce
test money
predict yhat
predict e,resid 
tsset month
scatter e l.e //存在自相关
ac e
pac e //偏度相关图

	estat bgodfrey //BJ检验，原假设是数据没有自相关,这里P值为0，拒绝原假设
	wntestq e //bpq检验，原假设是数据没有自相关,这里P值为0，拒绝原假设
	estat dwatson  //dw检验，原假设是数据没有自相关的值为2,这里值为0.359.

采用异方差自相关稳健的标准差进行回归分析
di 49^0.25 //先计算阶数，样本个数的1/4次方，结果是2.6457513，所以我们认为阶数为3
newey number money,lag(3)

采用广义最小二乘回归法来解决数据的异方差性
prais number money,corc

	*3
sum V1-V7
correlate V1-V7
reg V2-V7
estat vif
reg  V2 V4 V5 V7
reg  V2 V5 V7
estat vif

factor  V3 V4 V5 V6 V7
predict f1 f2 f3
reg  V2 f1 f2 f3
reg  V2 f1 f2 //完美
estat vif










***第十二章stata非线性回归分析实例
cd D:\Stata14\ado\data\chap12
use 案例12.1.dta
*12.1非参数回归分析
sum year coefficient,detail
graph twoway mband coefficient year || scatter coefficient year
//对数据进行非参回归并绘制年份和绩效考核系数之间的散点图
graph twoway mband coefficient year || scatter coefficient year ||,by( region )
//以事业部分类对数据进行非参回归并绘制年份和绩效考核系数之间的散点图
lowess coefficient year if region==1 //对数据进行修匀
graph twoway lowess coefficient year if region==1 ||scatter coefficient year
//将修匀命令融合到非参数回归中

	*案例延伸
	*1设定散点图分成10段等宽波段的数量
graph twoway mband coefficient year,bands(10)  || scatter coefficient year
	*2设定修匀的波段宽度
lowess coefficient year if region==1,bwidth(0.4) 


use 案例12.2.dta
*12.2转换变量回归分析
sum age ratio,detail
twoway line ratio age

graph twoway scatter ratio age || lfit ratio age //绘制年龄和阴性率的散点图

reg ratio age
gen lnage=log(age)
reg ratio lnage
gen age2=age^2
reg ratio age age2
gen age3=age^3
reg ratio age age2 age3

	*案例延伸
gen age4=age^4
gen age5=age^5
sw reg ratio age age2 age3 age4 age5,pr(0.05) //分步骤回归


clear
use 案例12.3.dta
*12.3非线性回归分析
sum y x,detail
twoway line y x
graph twoway scatter y x || lfit y x
reg y x
nl(y=exp({a}+{b}*x))
vce
predict yhat
predict e,resid

	*案例延伸
	*1设定非线性回归模型被估参数的初始值，减少估算步长
nl(y=exp({a}+{b}*x)),initial(a 4 b -0.04)
	*稳健标准差进行非线性回归分析
nl(y=exp({a}+{b}*x)),robust
	*系统默认快捷函数进行非线性回归分析
nl exp2 y x

clear
use 习题12.1.dta
sum year goal,detail
graph twoway mband goal year || scatter goal year
graph twoway mband goal year || scatter goal year ||,by( club )
lowess goal year if club ==1
graph twoway lowess goal year if club ==1 ||scatter goal year

clear
use 习题12.2.dta
sum y x,detail
twoway line y x
graph twoway scatter y x || lfit y x
reg y x
gen lnx=log(x)
reg y lnx
gen x2=x^2
reg y x x2
gen x3=x^3
reg y x x2 x3

clear
use 习题12.3.dta
sum ratio age,detail
twoway line ratio age
graph twoway scatter ratio age|| lfit ratio age
reg ratio age
nl(ratio=exp({a}+{b}*age))
vce
predict yhat
predict e,resid



*第十三章stata logic回归分析
cd D:\Stata14\ado\data\chap13

*13.1二元logistic回归分析
use 案例13.1.dta

list V1- V6
reg V1- V6
logistic V1- V6
logit V1- V6
estat clas
lstat
predict yhat
estat gof

	*案例延伸1
estat clas,cutoff(0.8)
	*案例延伸2
probit  V1- V6
mfx
estat clas
predict yhat

*13.2多元logistic回归分析
use 案例13.2.dta
list V1- V3
reg V1- V3
mlogit V1- V3,base(1)
mlogit V1- V3,base(1)rrr
	*案例延伸1
predict eye1 eye2 eye3

*13.3有序logistic回归分析
clear
use 案例13.3.dta
list V1- V3
reg V1- V3
ologit V1- V3
predict satisfy1 satisfy2 satisfy3
	*案例延伸1
oprobit V1- V3
predict satisfy1 satisfy2 satisfy3


	*本章习题
clear
use 习题13.1.dta
logistic V2 V3 V4 V5 V6 V7
logit V2 V3 V4 V5 V6 V7
estat clas
predict yhat
estat gof

clear
use 习题13.2.dta
mlogit V2- V4,base(1)
mlogit V2- V4,base(1)rrr

clear
use 习题13.3.dta
ologit V1- V3







*第十四章stata的因变量受限回归分析
cd D:\Stata14\ado\data\chap14

*14.1断尾回归分析
use 案例14.1.dta
list salary hour year grade
reg salary hour year grade
truncreg salary hour year grade,ll(3000)
test hour year grade
predict yhat
predict e,resid

	*拓展
	truncreg salary hour year grade,ll(3000) robust
*14.2截取回归分析
use 案例14.2.dta,clear
list salary hour year grade
reg salary hour year grade
tobit salary hour year grade,ul(11000)
test hour year grade
predict yhat	
	*拓展
	tobit salary hour year grade,ul(11000) robust
	tobit salary hour year grade,ll(3000)
	tobit salary hour year grade,ll(3000) ul(11000)

use 习题14.1.dta,clear
truncreg satisfy number year grade ,ll(30)	
test number year grade	
	
use 习题14.2.dta,clear	
tobit number touzi year grade,ul(11000)	
	
	
	
	
	
	
	
	
	
	
	
*第十五章stata时间序列分析
cd D:\Stata14\ado\data\chap15
use 案例15.dta,clear
*15.1时间序列分析的基本操作
regress m s g t
tsset year
twoway(line m year)
twoway(line s year)
twoway(line g year)
twoway(line t year)

twoway(line d.m year)
twoway(line d.s year)
twoway(line d.g year)
twoway(line d.t year)

tsset clear
*15.2单位根检验
	*ADF检验
use 案例15.dta,clear
dfuller m,notrend
dfuller s,trend
dfuller g,trend

dfuller d.m,notrend
dfuller d.s,notrend
dfuller d.g,notrend
dfuller d2.s,notrend

	*ADF检验
pperron m,notrend
pperron  s,trend
pperron  g,trend

pperron  d.m,notrend
pperron  d.s,notrend
pperron  d.g,notrend
pperron  d2.s,notrend

d.m=a*d.g+b*d2.s+c*t+u
regress d.m d2.s d.g t

*15.3协整检验
	*EG-ADF检验
regress m d.s g
predict e,resid
twoway(line e year)
dfuller e,nocon lags(1) regress  //对残差进行协整检验，不包括趋势、常数项
//z= -2.273 介于1%~5%的区间，拒绝原假设，存在协整关系

	*迹检验
varsoc m d.s g //判断滞后阶数，选带星号多的，本例题为了更有解释性选4
vecrank m d.s g,lags(4) //确定协整秩,选带星号的1
vec m d.s g,lags(4) rank(1) 

*协整方程的具体形式为： m-55.4957d1.s+(-2005.838)g+2708.056=0
*把m作为因变量
m=55.4957d1.s+2005.838g-2708.056

*15.4格兰杰因果关系检验
regress m l.m dl.s
test dl.s=0
regress d.s dl.s l.m
test l.m=0

regress m l.m l.g
test l.g=0
regress g l.g  l.m
test l.m=0

regress g l.g dl.s
test dl.s=0
regress d.s dl.s l.g
test l.g=0


	*案例延申
regress d.s dl.s l.g l2.g l3.g l4.g l5.g
test l.g=0
test l2.g=0
test l3.g=0
test l4.g=0
test l5.g=0


*本章习题
use 习题15.dta,clear
tsset year
twoway(line income cost salary year)
twoway (line d.income d.cost d.salary year) //一阶差分后围绕0没有时间趋势
	*ADF检验
dfuller income //有单位根
dfuller d.income
dfuller cost
dfuller d.cost //类似上一个
dfuller salary
dfuller d.salary

	*PP检验
pperron income //有单位根
pperron d.income
pperron cost
pperron d.cost //类似上一个
pperron salary
pperron d.salary

varsoc income cost salary
vecrank income cost salary,lags(1) //协整秩为0，不存在长期协整关系
*不存在协整关系可以考虑增加样本、变量，考虑面板数据

regress income l.income l.cost
test l.cost=0
regress cost l.cost l.income
test l.income=0





*第十六章stata面板数据分析
cd D:\Stata14\ado\data\chap16
use 案例16.1.dta,clear
*16.1短面板数据分析

list year sale cost profit
encode diqu,gen(region)
xtset region year
xtdes
xtsum
xttab sale
xttab cost
xttab profit

xtline sale
xtline cost
xtline profit

reg profit sale cost
reg profit sale cost,vce(cluster region)
xtreg profit sale cost,fe
estimate store fe
xi.xtreg profit sale cost i.region,vce(cluster region)

tab year,gen(year)
xtreg profit sale cost year2-year5,fe vce(cluster region)
test year2 year3 year4 year5
xtreg profit sale cost,re vce(cluster region)
xttest0
xtreg profit sale cost,mle
xtreg profit sale cost,be

*16.2长面板数据分析
use 案例16.2.dta,clear
list year sale cost profit
encode shengshi,gen(region)
xtset region year
xtdes
xtsum
xttab income
xttab cost
xttab profit

xtline income
xtline cost
xtline profit

tab region,gen(region)
reg profit cost income region2-region8 year,vce(cluster region )
estimates store ols
xtpcse profit cost income region2-region8 year,corr(ar1)
estimates store ar1
xtpcse profit cost income region2-region8 year,corr(psar1)
estimates store psar1
xtpcse profit cost income region2-region8 year,hetonly
estimates store hetonly
estimates table ols ar1 psar1 hetonly,b se

xtgls profit cost income region2-region8 year,panels(cor) cor(ar1)
xtgls profit cost income region2-region8 year,panels(cor) cor(psar1)

*本章习题
use 习题16.1.dta,clear
encode diqu,gen(region)
xtset region year

xtreg profit sale cost,fe
estimate store fe

xtreg profit sale cost,re
estimate store re

xtreg profit sale cost,be
estimate store be

hausman fe re,constant sigmamore //使用固定效应模型好


use 习题16.2.dta,clear

encode shengshi,gen(region)
xtset region year
tab region,gen(region)

reg profit cost income region2-region8 year,vce(cluster region )
estimates store ols

xtpcse profit cost income region2-region8 year,corr(ar1)
estimates store ar1

xtpcse profit cost income region2-region8 year,corr(psar1)
estimates store psar1

xtpcse profit cost income region2-region8 year,hetonly
estimates store hetonly

***//更新完毕//17章后不再更新





  



