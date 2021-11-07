


* �����й�˾�ʱ��ṹ��̬���������о���һ�ĵ�ģ�ͳ�ʼֵ���Ƴ���
* ���Ϸ����á��޸ĸ� 2006.09.12
*  �μ� dycs_NFJJ_1_temp  ��ǰ�Ľ�����������˽�һ���Ĵ���

*-note-*
*  �ó�������dycs_dealdata.do�����ϵ��޸ģ�����˾��ĿС��10�ҵ���ҵ��������˺ϲ�
*  Then [dycs060104.ado] will be used to estimate the nonlinear model            


clear
set memory 30m
set matsize 3000
cd D:\stata9\ado\personal\dycs\NFJJ
adopath +  D:\stata9\ado\personal\dycs
cap log close
log using dycs_NFJJ_dealdata,replace text
use "D:\stata9\ado\personal\dycs\NFJJ\dy_database.dta",clear


*============================ Part 1 ����������ɸѡ ===================================

* 1.1 ѡ���о��н�Ҫʹ�õ�ָ��
#delimit ;
keep code  name   year           sic_men   
     pyear byear  bothab         st_b  st_o     
     merge_basic  merge_mkv      merge_share
     stock        depreciate     
     debt_total   flowd_total    longd_total
     flowa_total  asset_total    fixa_total
     right_total  main_income    netprof
     fullshr      trdshr         ntrdshr   
     stateshr     stateownshr    statelpshr
     avyopr       avybpr         avypr_all
     avy_fmkv     avy_tmkv  
     main_income salecost busicost mangcost;
order code name year flowa fixa flowd asset debt 
      right main  net stock dep 
      *shr avy*      
      sic pyear both st* merge*      ;
#delimit cr
tsset code year


* 1.2 ����������A�ɵĹ�˾��ST-PT �๫˾�������๫˾
drop if bothab==1
drop if st_b != .
drop if sic_men == 9   /* ��Ӧ��ҵ�������Ϊ J */


** calculate HHI Index  ������ҵ�����̶�
* method 1
preserve
keep if year > 1997
forvalues t = 1998(1)2003{
    egen sic_ssum_`t' = sum(main_income) , by(sic_men) 
    replace sic_ssum_`t' = 0 if year != `t'
    egen hhi_`t' = sum((main_income/sic_ssum_`t')^2) , by(sic_men)
    replace hhi_`t' = 0 if year != `t'
}
keep code year sic_men sic_ss* hhi*
gen hhiyr = hhi_1998 + hhi_1999 + hhi_2000 + hhi_2001 + hhi_2002 + hhi_2003
keep sic_men year hhiyr
duplicates drop 
egen hhi = mean(hhiyr) , by(sic_men)
keep sic_men hhi 
duplicates drop 
rename hhi hhi_yr
sort sic_men
save hhi_yr_temp.dta, replace
//mkmat sic_men hhi , matrix(HHI_yr)
//mat list HHI_yr
restore


preserve
*method 2
keep if year > 1997
egen sic_ssum = sum(main_income), by(sic_men)
egen hhi = sum((main_income/sic_ssum)^2), by(sic_men)
keep sic_men hhi 
duplicates drop 
rename hhi hhi_all
sort sic_men
save hhi_all_temp, replace
//mkmat sic_men hhi , matrix(HHI_all)
//mat list HHI_all
restore


* 1.3 ������1998��1��1����ǰ���еĹ�˾
keep if pyear<1998        /* pyear ��ʾ����ʱ�� */
drop if year<1998


*============================ Part 2 ��ָ�궨��ͽ�һ��ɸѡ ===================================
* 2.1 ����������
tsset code year 
gen tl     = debt_total/asset_total      /*total leverage*/
gen tl_lag = L.tl
gen sl     = flowd_total/asset_total      /*short-run leverage*/
gen ll     = longd_total/asset_total      /*long-run leverage*/
gen fr     = flowa_total/flowd_total     /*current ratio*/
gen size   = ln(asset_total)        
gen ndts   = depreciate/asset_total
gen tang   = (fixa+stock)/asset_total
gen npr    = netprof/main_income       /*��������*/ 
gen tshr   = trdshr/fullshr
gen sshr   = stateownshr/fullshr
gen tagr   = D.asset_total / L.asset_total

* ����Tobin's Q
gen napshr = right_total/fullshr     /*ÿ�ɾ��ʲ�*/
gen shrmkv = avyopr*trdshr + napshr*ntrdshr
gen mkv    = shrmkv + debt_total
gen mkv2   = avy_tmkv+ debt_total
gen tobin  = mkv/asset_total
gen tobin2 = mkv2/asset_total
gen mtl    = debt_total/mkv                /*�г���ծ��*/
gen mtl_lag= L.mtl

gen slr = sl/tl               
gen llr = ll/tl

* 2.2 �޳�����ֵ
drop if tagr > 1 & tagr != .
drop if (tl>1 | tl<=0) | (napshr<0) | (abs(npr)>1)
local varlist tl sl ll  fr size ndts tang npr tshr tobin
foreach var of varlist `varlist'{
   drop if `var' == .
}


* 2.3 ����Ϊƽ���������
xtbalance , range(1998 2003)   /* Written by Arlion */

* 2.4 ���� age����𻯱���
_pctile byear , n(3)
gen age = byear > r(r2)
replace age = 3 if byear <= r(r1)
replace age = 2 if age == 0

* 2.5 ���±����ӱ�ǩ
label var  tl      "�����ܸ�ծ��"
label var  sl      "���ڸ�ծ��"
label var  tl      "���ڸ�ծ��"
label var  mtl     "�г��ܸ�ծ��"
label var  fr      "��������"
label var  size    "��˾��ģ" 
label var  ndts    "�Ǹ�ծ��˰��"
label var  tang    "�ʲ��ṹ"
label var  npr     "��������"
label var  tshr    "��ͨ�ɱ���"
label var  sshr    "���ҿعɱ���"
label var  age     "��˾�����, 1 young 2 med 3 old"
label var  napshr  "ÿ�ɾ��ʲ�"
label var  shrmkv  "��Ʊ�г���ֵ"
label var  mkv     "��˾�г���ֵ"
label var  tobin   "Tobin's Q ��ʾ��˾�ɳ���"
label var  slr     ���ڸ�ծռ�ܸ�ծ�ı���
label var  llr     ���ڸ�ծռ�ܸ�ծ�ı���

* 2.6 ��������������
 forvalues i = 1999(1)2003{
       gen y`i' = 0
       replace y`i' = 1 if year == `i'
 }


* 2.7 ������ҵ�������������ҵ���࣬���ۺ���Ϊ��׼
tab sic_men if year == 2003       /*�� 2 �еĲ�������*/

* 2.7.1 ����1���ϲ���˾��Ŀ���� 10 �ҵ���ҵ����
* step1���ϲ���˾��ĿС��10�ҵ���ҵ����Ӧ����ҵ�У�A B L E
* C+B;  J+E;  M+A; D+L; ���಻�䣺G; F;  H;  D;  ����ʣ��8����ҵ����
gen sicmen = sic_men
replace sic_men = 3  if (sic_men==3 | sic_men==2)    /*C+B*/
replace sic_men = 10 if (sic_men==5 | sic_men==10)   /*E+J*/
replace sic_men = 11 if (sic_men==11| sic_men==12)   /*K+L*/
replace sic_men = 13 if (sic_men==13| sic_men==1)    /*A+M*/

qui tab sic_men , gen(sic)
drop sic8

label define sic_mm_lab                  ///
  3  "�Ʋ�" 4  "��Դ" 6  "����" 7  "��Ϣ" ///
  8  "����" 10 "����" 11 "���" 13 "ũ��"   
label value  sic_men sic_mm_lab


/*
* 2.7.2 ����2�������� C D F G H J M �߸���ҵ����
* �������ַ�����Ҫ���� dycs_NFJJ_7sic.ado
keep if sic_men == 3 | sic_men== 4 | sic_men== 6  | ///
        sic_men == 7 | sic_men== 8 | sic_men== 10 | sic_men==13
qui tab sic_men , gen(sic)
drop sic7
*/

 
* 2.8 �������б�����˳��
#delimit ;
order code name year tl sl ll tl_lag mtl mtl_lag fr size ndts tang npr 
      tshr sshr age tobin y1* y2* sic* 
      main_income salecost mangcost  
      flowa fixa flowd asset debt right main  net stock dep 
      *shr avy* sic_men pyear both st* merge*      ;
keep code name year tl sl ll tl_lag mtl mtl_lag fr size ndts tang npr 
      tshr sshr age tobin y1* y2* sic* 
      main_income salecost mangcost  
      flowa fixa flowd asset debt right main  net stock dep 
      *shr avy* sic_men pyear both st* merge*      ;
#delimit cr


* 2.9 ����ͳ���� (�� 1)
 tabstat  tl fr-tobin,stat(mean sd min max) columns(s) format(%4.2f)
* ����ҵͳ����Ҫָ��
 tabstat tl sl size tang fr npr, sta(mean) by(sic_men) 
 //tabstat tl sl size tang fr npr, sta(mean) by(sic_mm)



*============================ Part 3 �����ƾ�̬ģ�Ͳ���ó�ʼֵ ===================================

* 3.1 ���ƾ�̬ģ����Ϊ�Ա�
qui xtreg tl fr-tshr age tobin y1999-y2003 sic1-sic7, re
est store m_static


//xtreg tl tl_lag fr-tshr age tobin y1999-y2003 sic3-sic11,re
//xtabond tl tl_lag fr-tshr age tobin y1999-y2003 sic3-sic11,lags(2) 

* 3.2 ������ʼֵ
local tl "tl"
qui reg `tl' fr-tshr age tobin y2000-y2003 sic1-sic7        /*step1:regress static model */
est store m0_static
    predict tl_hat                        /*to generate optimal leverage level*/
    gen diff_star=tl_hat-tl_lag
    gen diff_lag=`tl'-tl_lag
    generate distance=abs(tl_hat-tl_lag)  /*to generate the distance variable*/
    gen alpha=diff_lag/diff_star          /*to get the coeficients of eq1,i.e. the value of alphas*/
qui reg alpha tobin distance size  y2000-y2003 sic1-sic7
est store alpha
est table m0_static alpha, stats(r2 r2_a N dr_m) b(%6.4f) star(0.01 0.05 0.1)
est table m0_static alpha

*  �ò���ɺ����� dycs_060103.ado, ���Ʒ�����ģ�͡�
** �˲��õ��ĳ�ʼֵӦ��Ϊ����д��dycs_060103.ado�����Թ��Ƴ����У���Ҫ�ֶ�����


*============================ Part 4 ������׼��̬ģ�� (Ф��ƽ,2004) ==============================
cap drop tl_star_xiao
gen tl_star_xiao = 0 
cap program drop _all
cd D:\stata9\ado\personal\dycs
drop if tl_lag==.
run dycs_xiao04.ado
nl dycs_xiao04 tl
est store m_xiao04
global rss_xiao = e(rss)



*============================ Part 5 �����ƶ�̬ģ�� (����) ==============================
* 5.1 ������������������ڷ����Թ���
cap drop alpha  
gen tl_star = 0
gen alpha = 0

* 5.2 ���Ʒ�����ģ��
drop if tl_lag==.
cap program drop _all
//run dycs_060103.ado
//nl  dycs_060103 tl

run dycs_NFJJ_final.ado
nl dycs_NFJJ_final tl
est store m_dynamic
global rss_dycs = e(rss)
      
predict res, res


*============================ Part 6 �������� ==============================
 
* 6.2 �������

* 6.2.1 ��̬�ֲ�������� 
//sum res, d
//sktest res                  /* Skewness and kurtosis test for normality */
* �ý�����������л㱨�Ľ��
tabstat res if year == 2003, stat(mean sd min p25 med p75 max sk k) format(%6.4f)
sktest  res if year == 2003
*swilk  res                 /* Shapiro-Wilk and Shapiro-Francia tests for normality */

* 6.2.2 һ��������ؼ���
qui tsset code year
xtserial res                /*Woodridge test for first-order serial correlation of Panel data*/

* 6.2.3 �������ϵ���Ƿ�Ϊ����  �μ�Greene(2000,pp.439, Eq(10-29))
local n   = _N
local n_K = `n' - 35
local F   = (($rss_xiao - $rss_dycs)/14) / ($rss_dycs/`n_K')
dis "F(14,`n_K') = " in y `F'



* 6.3  ͳ�ƻع���
* ��̬ģ��
est tab m_static, stats(r2_o r2_w r2_b chi2) b(%6.4f) star(0.01 0.05 0.1)
est tab m_static, b(%6.4f) se(%6.4f)
* ׼��̬ģ�ͣ�Ф��ƽ��2004��
//est tab m_xiao04, stats(r2 r2_a F) b(%6.4f) star(0.01 0.05 0.1)
//est tab m_xiao04, b(%6.4f) se(%6.4f)
* ��̬ģ�ͣ����ģ�
//est tab m_dynamic, stats(r2 r2_a F) b(%6.4f) star(0.01 0.05 0.1)
//est tab m_dynamic, b(%6.4f) se(%6.4f)
* �ϲ�xiao04�Ͷ�̬��������
est tab m_xiao04 m_dynamic, stats(r2 r2_a F) b(%6.4f) star(0.01 0.05 0.1)
est tab m_xiao04 m_dynamic, b(%6.4f) se(%6.4f)

* 6.4 ͳ�Ƶ����ٶȺ����ű���
count if tl_star<0
count if tl_star>1
replace tl_star = 0.01 if tl_star<0
replace tl_star = 0.99 if tl_star>1
count if alpha<0
count if alpha>1

gen opratio =  tl_star/tl

* ����˾����ģ�ֳ�5�࣬�������� size_id ���Ա�ʾ
centile size, centile(20(20)100)
gen size_id = 0
replace size_id = 1 if size<=r(c_1)
replace size_id = 2 if size>r(c_1)&size<=r(c_2)
replace size_id = 3 if size>r(c_2)&size<=r(c_3)
replace size_id = 4 if size>r(c_3)&size<=r(c_4)
replace size_id = 5 if size>r(c_4)&size<=r(c_5)

tabstat alpha opratio, stat(mean med) format(%6.3f) by(year)
tabstat alpha opratio, stat(mean med) format(%6.3f) by(sic_men)
tabstat alpha opratio, stat(mean med) format(%6.3f) by(size_id)


* 6.5 ��ծ�����޽ṹ�;���ǿ�ȽǶȽ��͵����ٶȵ���ҵ����
* ������������ҵ����ǿ��
preserve
*method 3
egen sic_ssum = sum(main_income), by(sic_men)
egen hhi = sum((main_income/sic_ssum)^2), by(sic_men)
keep sic_men hhi 
duplicates drop 
rename hhi hhi_samp
sort sic_men
save hhi_samp_temp, replace
//mkmat sic_men hhi , matrix(HHI_samp)
//mat list HHI_samp
restore

//mat list HHI_all 
//mat list HHI_yr
//mat list HHI_samp

cd D:\stata9\ado\personal\dycs\NFJJ
sort sic_men
merge sic_men using hhi_yr_temp.dta
drop _merge*
sort sic_men
merge sic_men using hhi_all_temp.dta
drop _merge*
sort sic_men
merge sic_men using hhi_samp_temp.dta
drop _merge*
drop if tl == .

* ͳ�Ʒ���

tabstat tl  sl ll npr hhi_all hhi_yr, stat(mean) by(sic_men) format(%6.3f)
tabstat alpha opratio tl llr tang npr hhi_all hhi_yr hhi_samp, stat(mean) by(sic_men) format(%6.3f)


* 6.6 ��ҵ����ģ����Ȳ������

*  K-W test by   sic_men and size  [see help kwallis]
local rvars  alpha opratio
local gvars sic_men size_id 
foreach Rvar of local rvars{
  foreach Gvar of local gvars{
        mat kw_men = J(4,5,0)
      forvalues i=1999(1)2003{
        qui kwallis `Rvar' if year == `i',by(`Gvar')
        local df = r(df)
        local chi2 = r(chi2)
        local pvalue = chi2tail(`df',`chi2')
             mat kw_men[1,`i'-1998] = `i'
             mat kw_men[2,`i'-1998] = r(chi2)
             mat kw_men[3,`i'-1998] = r(df)      
             mat kw_men[4,`i'-1998] = `pvalue'
      }
  dis _n in g "The K-W test for " in y "`Rvar'" in g " by " in w "`Gvar':" 
  mat list kw_men
  }
}

* K-W test by year
kwallis alpha , by(year)

*============================= Over ==================================

