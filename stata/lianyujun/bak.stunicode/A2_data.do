



          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         =====================
          *            �ڶ���  ���ݴ���
          *         =====================

  * cd D:\stata10\ado\personal\Net_course_A\A2_data
  
    cd `c(sysdir_personal)'Net_course_A\A2_data
  

*----------------
*    ����Ŀ¼
*----------------

*  2.1  ����ת���ĸ��༼�� 
*  2.2  ��λ�� 
*  2.3  �ظ�����ֵ�Ĵ��� 
*  2.4  ȱ©ֵ�Ĵ���  
*  2.5  ��Ⱥֵ�Ĵ��� 
*  2.6  ���ϵĺϲ���׷�� 
*  2.7  �����������
*  2.8  ���ֱ����Ĵ���
*  2.9  �������ķ���	
*  2.10 ʱ���������ϵĴ��� 
*  2.11 ������ϵĴ���
*  2.12 ���ݵĲ���ͱȽ�	




          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         =====================
          *            �ڶ���  ���ݴ���
          *         =====================
          *        2.1 ���������ĸ��༼�� 
		  
		  
*------------------------
*-2.1 ���������ĸ��༼�� 
*------------------------

  *     ==����Ŀ¼==
		  
  *     2.1.1 _n �� _N
  *         2.1.1.1  _n �� _N
  *         2.1.1.2  _n �� _N ��Ӧ��
  *     2.1.2 ��������Ĳ���  
  *         2.1.2.1 ������ʽ
  *         2.1.2.2 ���������������������: -tab-���� 
  *         2.1.2.3 ���������������������: -xi-����	 
  *         2.1.2.4 ���ӱ��� (stata11 ��һ������)
  *         2.1.2.5 ����������ת��Ϊ������
  *         2.1.2.6 �����������������������
  *     2.1.3  ������Ĳ���  
  *     2.1.4  -egen- ����  
  *         2.1.4.1 egen �� gen ������
  *         2.1.4.2  �����Ȳ�����: seq() ����
  *         2.1.4.3  ������ݣ�fill() ����
  *         2.1.4.4  �������ھ�ֵ����λ��
  *         2.1.4.5  ������ıȽϺ�ͳ��
  *         2.1.4.6  �����ı�׼��
  *         2.1.4.7  ������ƽ������Moving Average��
  *         2.1.4.8  ����� egen() ���� 
  
		  
		  
*                  =��������=  
* =====================================================
*    _n, _N, tsset, egen, display, list, tabulate
*    xi, fvset fvvarlist, recode, recode(), irecode()
*    cond(), inlist(), inrenge(), egenmore, 
* =====================================================


*___________________
*-2.1.1  _n �� _N

  *-2.1.1.1  _n �� _N �ĺ���
     
    *-���壺 
      * _n "������ű���"����һ������������Ϊ 1,2,3,...,n
      * _N "������ָ��",   ��һ����ֵ������Ϊ ������

    *-˵����
      * _n ��һ����Զ���ڣ���ȴ���� list �������������
      * _n ��ȡֵ������������ı仯���仯
      
      sysuse nlsw88.dta, clear
      list age wage in 1/10      // ����ߵ�1,2,...���� _n �е�����
      list _n                    // ����

      sort hours
      gen nid_1 = _n             // ��һ�� _n ������ 
      list nid_1 hours race in  1/10 
      sort wage
      gen nid_2 = _n             // �ڶ��� _n ������         
      list nid_1 nid_2 hours race in 1/10

      dis _N                     // _N ��һ����ֵ
      scalar obs = _N
      quietly  sum wage
      dis r(mean)*_N
      dis r(mean)*obs

	  
  *-2.1.1.2  _n �� _N ��Ӧ��
  
      sysuse sp500.dta, clear
      sort open
      sum open
      dis r(max)
      gen o_max   = open[_N]             // ���ֵ
      gen o_diff  = open[_n] - open[_N]  // �����ֵ�Ĳ�
      gen b_diff = open[_N] - open[1]    // range
      list open o_max o_diff b_diff in 1/20
      
      *-���
        sort date
        gen d_open = open[_n] - open[_n-1]
        
      *-�������
        gen dln_open = ln(open[_n]) - ln(open[_n-1])
        
      *-�ƶ�ƽ��
        gen mv3_open = (open[_n-1] + open[_n] + open[_n+1]) / 3
        list open o_max o_diff dln_open mv3_open in 1/10

      *-�ͺ��ǰ������
        tsset date  /*��������Ϊʱ������*/
        gen open_lag  = L.open
        gen open_lag2 = L2.open
        gen open_forward  = F.open
        gen open_diff  = D.open
        gen open_diff2 = D2.open
        list open* in 1/10
        reg close L(1/3).(close open)
        
      *-������
        qui tsset date
        gen r1 = D.close/L.close
        gen lnclose = ln(close)
        gen r2 = D.lnclose        // �ڶ��ּ��㷽��
        list date r1 r2 in 1/10
        
      *-�������
        sysuse nlsw88.dta, clear
        bysort industry: gen gid = _n
        list gid industry in 1/50, sepby(industry)
  

  
*_______________________
*-2.1.2  ��������Ĳ���

  *-2.1.2.1 ������ʽ
    
    *-ʹ��-generate-��-replace-�����������
      sysuse nlsw88.dta, clear
	  
      gen dum_race2=0
        replace dum_race2=1 if race==2
      gen dum_race3 = 0
        replace dum_race3=1 if race==3
		
      list race dum_race* in 1/100, sepby(race)


  *-2.1.2.2 ���������������������: -tab-����
  
      sysuse nlsw88.dta, clear
      tab race, gen(dum_r)
      list race dum_r1-dum_r3 in 1/100, sepby(race)
	  

  *-2.1.2.3 ���������������������: -xi-����	  
	
      xi i.race   //�Զ�����������������ƣ������ӱ�ǩ
	  
      list race _Irace_2 _Irace_3 in 1/100, sepby(race)
    
      *-�ر�ע�⣺�ٴ�ʹ��-xi-����ʱ����ǰ���ɵ���������ᱻ����
        xi i.occupation   //*_Irace_2��_Irace_3������������
        
      *-�������-1-��ʹ�� prefix(str) ѡ��,
        sysuse nlsw88, clear
        xi i.race, prefix(dr_) // ǰ׺���ܳ����ĸ��ַ�
        xi i.occu, prefix(do_) // ��ͬ�����������ò�ͬ��ǰ׺
		     
      *-�������-2-�������޸ı������ƣ� -renvars- (SJ 5-4)
        help renvars
        sysuse nlsw88.dta, clear
        xi i.race
        renvars _Irace* \ dum_race_2 dum_race_3 // �ⲿ��������޸ı�����
        xi i.occupation 
        renvars _Ioccu*, prefix(dum)            // �����޸ı������Ƶ�ǰ׺
		  
        *-�ŵ�: �������������ǰ׺�������� "dum_"
        
      *-noomit- ѡ��
        sysuse nlsw88, clear
        tab race           
        xi i.race   // ֻ�����������������,��������������������
        des _I*
		  
        xi i.race, prefix(dum_) noomit
        des dum*     

		  
   *-2.1.2.4 ���ӱ��� (stata11 ��һ������)
   
     help fvvarlist    // �����﷨����
	 help fvset        // ��������趨
	 
	 *-���
	   sysuse nlsw88, clear
	   
	   list race i.race in 500/525, sep(0)
	   list race#married in 1/50 , sep(0)  // 4 ��
	   list race#married in 1/100, sep(0)  // 6 ��, why?
	 
	   list i.union i.married union#married in 1/50, sep(0)
	   list union##married in 1/50, sep(0) // �����������ȼ�
	 
	 *-Ӧ��
	   reg wage  i.race
	   reg wage  i.race i.married race#married
	   reg wage  race##married   // �����������ȼ�
	   
	   
	 *-�������ѡ��
	   view help fvvarlist##bases 
	   
	   *-ѡ�� race=other ��Ϊ������
	     label list racelbl   // race=1(Min) ��stataĬ�ϵĶ�����
		 reg wage ib3.race
		 
	   *-ѡ�� race=other, married=1 ��Ϊ������	
	     label list marlbl 
		 reg wage  ib3.race ib1.married 
		 reg wage  ib3.race##ib1.married  // ���뽻����
		 
	   *-�����趨������
	     help fvset
		 fvset base 3 race  // �ں���ʹ�� i.race �����У�race=3���Ƕ�����
		 reg wage i.race
	    
		
     *-�����������趨
	   help fvvarlist 
	   reg wage  i.married hours i.married#c.hours
	   reg wage  i.married##c.hours      // �ȼ�����������
	   
	   reg wage  i.married##c.hours  /// // ���
	             i.union##c.hours    /// // �Ƿ񹤻��Ա 
				 i.collgrad##c.hours     // �Ƿ��ѧ��ҵ
		 
	   reg wage  hours c.hours#c.hours	 // ����ƽ���� 
	   reg wage  c.hours##c.hours	     // �ȼ�����������
	   
	   reg wage  c.hours##c.hours##c.hours	// �������η�

	   
            
  *-2.1.2.5 ����������ת��Ϊ������

    *- �ȷ�����              -group()-
       sysuse nlsw88.dta, clear
       sort wage                  // ��һ������Ҫ
       gen  g_wage = group(5)     // �ȷ�Ϊ����
       tab g_wage
       tabstat wage, stat(N mean med min max) by(g_wage) f(%4.2f)

    *- ָ���ֽ���ת����ʽ  -recode-
       sum age
       recode age (min/39 = 1) (39/42 = 2) (42/max = 3), gen(g_age) 
       * 1  if  age<=39         �ҷ������
       * 2  if  39<age<=42
       * 3  if  age>42
       list  age g_age  in 1/50, sepby(g_age)

       *-Q�����ϣ���� 39 ��ŮԱ������� 2 �࣬������´����
            recode age (39/42 = 2) (min/39 = 1) (42/max = 3), gen(g1_age) 

    *- ����irecode() �� recode() ��������ת��
    
       * -irecode()- ����
          gen g2_age = irecode(age, 39, 42)
          ttest g_age = g2_age
          
       * -recode()- ����
          gen g3_age = recode(age, 39, 42)
          list age g_age g2_age g3_age in 1/10, sepby(g_age)
           

  *-2.1.2.6 �����������������������
  
    *- cond() ����
      
      * �����﷨��cond(s,a,b)  |   cond(s,a,b,c)
      * ȡֵ��
        * a    if ���ʽ s Ϊ�棻
        * b    if ���ʽ s Ϊ�٣�
        * c    if ���ʽ s Ϊȱ©ֵ
      * ʾ����
	    sysuse nlsw88, clear
        gen dum1 = cond(hours>40, 1, 0, .)
          list hours dum1 in 1/20
		gen dum2 = cond(hours>40&hours!=., 1, 0, .)
          list hours dum1 dum2 in 1/20  // ע��˴�������
		  
        gen dum_ratio = cond(wage/hours>0.5, 1, 0)
          list wage hours dum_ratio in 1/20
     
	 
    *- inlist() ����
      
      * �����﷨��inlist(x, a,b,c,...) 
      * ȡֵ��
        * 1    if x = a,b,c,...�е��κ�һ��
        * 0    otherwise
      * ����
        * ��xΪʵ���������ȡֵ�������2-255
        * ��xΪ�ַ������������ĸ����������2-10
      *
      * ʾ�� 1��
        label list occlbl
        gen dum_occu = inlist(occu, 1,2,7,12)  
        list occu dum_occu in 1/20
        * �ȼ���
          gen dum_occu1 = (occ==1|occ==2|occ==7|occ==12)
      *   
      * ʾ�� 2��
        use gdp_China.dta, clear
        sort Y
        list in 1/10     // ��β����������������
        *egen pvname = msub(prov), f(" ") //ȥ��ʡ���еĿո�
        gen east = inlist(prov,"����","����","�㶫","����", ///
                         "����","ɽ��","�Ϻ�","���","�㽭") 
        sort east prov
        browse if year ==2003
     
	 
   *- inrange() ����
   
     * �����﷨�� inrange(x, a,b)
     * ȡֵ��
       * 1    if  a<= x <= b��
       * 0    otherwise
	   
     * ʾ����
	   sysuse nlsw88, clear
       gen dum_h2  = inrange(hours, 30,40)
	   
       * �ȼ���
         gen dum_h3 = (hours>=30 & hours<=40) 
         list hours dum_h2 dum_h3 in 1/20
     
	 
   *- clip() ���� 
 
     * �����﷨�� clip(x, a,b)
     * ȡֵ��
       * a    if x<=a;   // ��β
       * x    if a<x<b;  // ԭʼֵ
       * b    if x>=b    // ��β
	   
         gen g_h4 = clip(hours, 30, 40)
         list hours g_h4 in 1/100
		 
       *-�Դ�Ϊ�������ɽ�һ�������������


	   
	   
	   
	   

	   
	   


          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *       ===========================
          *            �ڶ���  ���ݴ���
          *       ===========================
          *        2.1 ���������ĸ��༼��(��) 

		  
*______________________
*-2.1.3  ������Ĳ���   

  *-stata11�û����μ���-2.1.2.4- ���ӱ����� С��

  *-��������   -generate- ����
  
    sysuse nlsw88, clear
	
    gen ttlexp_x_marry = ttl_exp*married
	
    reg wage married ttl_exp ttlexp_x_marry
   
   
  *-���������������   -xi- ���� 
  
    *-��εõ������塱 �롰�Ƿ��ѻ顱�Ľ�����
    * �������������� i.v1*i.v2
      xi:reg wage married ttl_exp  i.race*i.married
       
    *-��εõ������塱 �� ���������顱�Ľ����� ? 
    * һ������һ�������������� i.v1*v2
      xi:reg wage married  i.race*ttl_exp // ttl_exp�ᱻ�Զ�����
   

 
*______________________
*-2.1.4  -egen- ����

  * extended generate ����д
    help egen

  *-2.1.4.1 egen �� gen ������
  
    *-��������
	  sysuse sp500, clear
      gen  sum_close0 = sum(close)  // �ۼ�
      egen sum_close1 = sum(close)  // �������
      list close sum_close0 sum_close1 in 1/10
	  
    *-����ȱ©ֵ�Ĵ���Ҳ�в���
      clear
      input v1  v2
            1   5
            2   .
            .   3
            2   4
            4   . 
            .   6
      end
      gen mean       = (v1+v2)/2
      egen mean_egen = rmean(v1 v2)
      list


  *-2.1.4.2  �����Ȳ�����: seq() ����
    clear
	set obs 100
    egen x1 = seq(), from(-1)
      list x1 in 1/10
    egen year = seq(), from(2000) to(2004)
      list year in 1/20
    egen code = seq(), from(1) block(5)
      list code in 1/20
      list code year in 1/20


  *-2.1.4.3  ������ݣ�fill() ����
  
    egen r2 = fill(2 4)      // ��� 2  �ĵ�������
    egen r3 = fill(6 3)      // ��� -3 �ĵݼ�����
    egen r4 = fill(1990 1991 1992 1990 1991 1992) // �ֿ��ظ�����
     list r2-r4 in 1/20


  *-2.1.4.4  �������ھ�ֵ����λ��
    
    sysuse nlsw88.dta, clear
    egen avg_w_r = mean(wage), by(race)
    egen med_w   = median(wage), by(race)
    list wage race avg_w_r med_w in 1/20 
    
    use xtcs.dta, clear              // �й����й�˾�ʱ��ṹ����
    egen msize = mean(size),by(code) // �������Ա�֤ÿ�ҹ�˾�����һ��
    sort msize
    gen gsize  = group(3)                   // ���ݹ�˾��ģ����
    bysort gsize year: egen mtl = mean(tl)  // ע�� -bysort- ��ʹ�÷���
    sort gsize year
    list code year gsize tl mtl in 1/40, sep(0)
    list code year gsize tl mtl in 2500/2540, sep(0)
	
	*-Ӧ�þ���
	  xtreg tl size fr ndts tobin tang, fe
	    est store full
	  xtreg tl size fr ndts tobin tang if gsize==1, fe
	    est store small
	  xtreg tl size fr ndts tobin tang if gsize==2, fe
	    est store mid
	  xtreg tl size fr ndts tobin tang if gsize==3, fe
	    est store large
	  local m "full small mid large"
	  esttab `m', mtitle(`m') s(N r2) b(%6.3f) ///
	            nogap compress
    
    *-˵�������� egen �ṩ�ĺ������пɼ�������s.d., Max, Min ��ָ��
   
 
  *-2.1.4.5  ������ıȽϺ�ͳ��
    
    sysuse sp500.dta, clear
	
    egen avg_price = rmean(open close)
      list open avg_price close in 1/10
      
	  replace open = int(open)
      replace close= int(close)
	egen diff = diff(open close)
      sort diff
      list open diff close in 1/10
     

  *-2.1.4.6  �����ı�׼��
  
    *-���壺x_s = (x - x_m) / x_sd
      *-x_s �ľ�ֵ��Ϊ 0�� ��׼�Ϊ 1
      *-����ת���������ı���������Դ�С
	  
	sysuse sp500.dta, clear  
    egen s_change1 = std(change)
    egen s_change2 = std(change), mean(20) std(3)
    sum change s_change*

    do A2_egen_std.do


  *-2.1.4.7  ������ƽ������Moving Average��     
      
    sysuse sp500, clear
    tsset date
      egen mv3_open        = ma(open)
      egen mv5_open        = ma(open), t(5)
      egen mv5_open_nomiss = ma(open), t(5) nomiss
    list *open* in 1/10
    dis (1320.28+1283.27+1347.56)/3  // ��һ���۲�ֵ
    dis (1320.28+1283.27+1347.56+1333.34)/4  // �ڶ����۲�ֵ
    
   
   *-2.1.4.8  ����� egen() ���� 
   
     help egenmore     // �ⲿ���� 
	 
	 *-ntos() ����
	   sysuse auto, clear
	   tab rep78
	   egen grade = ntos(rep78), from(1/5) to("����" �� �Ϻ� �ϲ� ��)
	   browse rep78 grade
       *-ston() �������÷��������
	 
	 
	 *-nvals() ����
	 
	   *-��������
	     use bank_number.dta, clear   // �����ϵ��Ŀ
	     browse
	     tab objbank, sort  // ����ͳ�Ƴ��������ÿ�ҹ�˾�������ϵ��Ŀ
	     drop if strmatch(objbank, "*��˾*")
	     drop if strmatch(objbank, "����")
	     tab objbank, sort
		 
	   *-ͳ�Ʒ���
	     egen banknum = nvals(objbank), by(id year)
		 
	   *-���
	     list, sepby(id year)
	   
	   
	   *-��һ�ֽ������(stata�ڲ�����)
	     use bank_number.dta, clear 
	     egen tag = tag(id year objb) //��һ�����ظ�ֵ���Ϊ1
		   list, sepby(id year)
		 bysort id year: egen banknum = total(tag)  ///
		               if strmatch(objbank,"*����*") 		   
           list, sepby(id year)
		 drop if banknum == .
		   list, sepby(id year)

		 
     *-incss() ����
	   use bank_number.dta, clear //ɾ�������н��ڽṹ
	   egen isbank = incss(objbank), substr("����")
	   list, sep(0)
	   drop if isbank==0  
	 
	 
	 *-gmean() ����  [geometric mean] ����ƽ����
	 
	   *-����: G = [x1*x2*...*xn]^{1/n}
	   
	   sysuse auto, clear
	   egen g_mpg = gmean(mpg), by(rep78) // ����ƽ����
	   egen m_mpg = mean(mpg), by(rep78)  // ����ƽ����
	     sort rep78
	     list rep78 *mpg, sepby(rep78)
		 
	
	 *-hmean() ����  [] ����ƽ���� 
	 
	                            n
	   *-����: H = --------------------------
	                1/x1 + 1/x2 + ... + 1/xn  
					
	
	 *-semean(), var(), sumoth(), xtile() ����
	 
	
	 *-�������� 
       * -egenms-   create a moving sum.
       * -egenmsd-  create a moving standard deviation.
       * -egenmmed- create a moving median.



	   
	   
	   
	   
	   
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         =====================
          *            �ڶ���  ���ݴ���
          *         =====================
          *               2.2 ��λ�� 
  
 
*-------------------
*-> 2.2  ��λ�� 
*-------------------
 
  *     ==����Ŀ¼==
  
  *     2.2.1 ��λ���Ļ�������
  *     2.2.2  -pctile- ����
  *     2.2.3  -xtile- ����
  *     2.2.4  -_pctile- ����
  
		  
*                  =��������=  
* =====================================================
*     -pctile-  -xtile-  -_pctile-
* =====================================================


*_________________________
*-2.2.1 ��λ���Ļ�������

    * ʾ�� 1��
      clear
      set obs 100
      gen x = _n
      sum x, detail
	  
    * ʾ�� 2��
      clear
      set obs 101
      gen x = _n
      sum x, detail
	  
    * ����͹�ʽ
	
      * �� p_th �ٷ�λ��ֵ����Ϊ x_|p|���� p = N_p/100��
	  *
      * ���磬����ȡ�� 25 �ٷ�λ����ֵ���� N_p=25, p=0.25
      *
	  * ÿ���۲�ֵ��Ȩ��Ϊ w(i)=1/N (NΪ������)��
      *
	  * ǰ i ���۲�ֵ��Ȩ��֮��Ϊ W(i)=SUM_w(i) = i/N
      *
      * ��� p_th �ٷ�λ����ֵ����Ϊ����һ������ W(i)>p �Ĺ۲�ֵ����
      *
      *           {  {x[i-1]+x[i]}/2    if W(i-1)=p
      *   x_|p| = {
      *           {   x[i]              otherwise
      *
        dis 5/101    // ���� W(5)=0.495>0.05 ������
        dis 6/101    // ���ǵ�һ������ W(6)=0.0594>0.05 �Ĺ۲�ֵ�����
        dis x[6]     // �� 5 �ٷ�λ��ֵ
		
      * �򵥵Ĵ�������
        dis ceil(101*0.25)
        dis x[26]    // ����ǵ�25�ٷ�λ��ֵ�������������"otherwise"
        
    * ʾ�� 1(�ع�)��
      clear
      set obs 100          // �����У�����100���۲�ֵ
      gen x = _n
      sum x, detail
      dis 5/100            //  0.05 = w(6-1) ==> i=6
      dis (x[5]+x[6])/2    // ��5�ٷ�λ��ֵ 
           

*_________________________
*-2.2.2  -pctile- ����
  
    sysuse auto, clear
    pctile p_price = price, nq(10) 
	                // nq(#) ָ����9���ٷ�λ��,�������и�Ϊ10��
    list p_price in 1/12, sep(0)
	sum price, detail
	
    pctile p_price2 = price, nq(10) gen(percent)  
	                      // gen() ѡ���������ɶ�Ӧ�İٷ�λ��ʶ
    list percent p_price2 in 1/12, sep(0)
 

*_________________________
*-2.2.3  -xtile- ����         // ����ָ���İٷ�λ������������
  
    use bp1.dta, clear
    xtile x_bp = bp, nq(4)
    list, sepby(x_bp)
    
    *-���ͣ�nq(4) ������������
	
      * (-OO,x25], (x25,x50], (x50,x75], (x75,+OO)  // �ҷ������
	  
      * ������λ�������ɹ���
        pctile xp_bp = bp, nq(4) genp(percent)
        list bp xp_bp percent
    
    * cutpiont() ѡ��
      input class
            100
            110
            120
            130
      end
      xtile c_bp = bp, cutpoints(class)
      list bp c_bp class, sepby(c_bp)
    

*_________________________
*-2.2.4  -_pctile- ����     
  
    *-������-pctile-������ܹ��ṩ������λֵ�ķ���ֵ
  
    sysuse auto, clear
    _pctile length, nq(10)
    return list
    sum price if (length>r(r9)) 
    
    _pctile price, p(33.3 72 90 99)  
    return list            
    *-����ָ����Ϊ�㣬���Ǹ�������������
  
  

  
  
  
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         =====================
          *            �ڶ���  ���ݴ���
          *         =====================
          *         2.3 �ظ�����ֵ�Ĵ��� 
  
  
*----------------------
*-2.3 �ظ�����ֵ�Ĵ���
*----------------------

  *-���������������ظ��ǳ��ձ飬Ҳ��������ĺ���
  *-���������е��ظ�����������Ϊ������������
  
  
       *     ==����Ŀ¼==  
       
	   *     2.3.1 ����ظ���������
	   *     2.3.2 ��Ǻ�ɾ���ظ����������
  

*                  =��������=  
* ================================================
* isid, duplicates report/examples/list/tag/drop
* egen group()
* ================================================


*___________________________
*-2.3.1 ����ظ����������

    sysuse nlsw88.dta, clear
    
  *-isid- ����   ѧ�ź�����
    isid race age
    isid idcode
	
  *-duplicates list- ����
    duplicates list race married in 1/20

  *-duplicates report- ����
    duplicates report race
    duplicates report race married
    duplicates report race married occupation

  *-duplicates example- ����
    duplicates example race married
    tab race married


*_________________________________
*-2.3.2 ��Ǻ�ɾ���ظ����������

  *-����ظ����������   
    
    *-ʹ�� group() ����
	
      sysuse nlsw88.dta, clear
	  
      egen rm = group(race married)
       tab rm, gen(dum_rm)  // ���Խ�һ���ô˱��������������
	   
      egen rm_lb = group(race married), label
       label list rm_lb
       list rm rm_lb in 1/10
       browse race married rm_lb rm
       
    *-ʹ�� tag() ��������һ�����ظ�����Ϊ1������Ϊ��
	
      egen rm_tag = tag(race married) 
       list rm* in 1/20
       
    *-ʹ�� -duplicates tag- ����
	
      duplicates tag race married, gen(rm_dtag) //�ظ�ֵ�ĸ���
       list rm* in 1/20
       
       
  *-ɾ���ظ����������     
    
    duplicates drop race married, force

    *-���� Panel Data ���ԣ����ǿ���ʹ����������ɾ���ظ���������˾
    * duplicates drop id year, force        
    * ������� 2.11.1 С��           
                        
 
  
  
  
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         =====================
          *            �ڶ���  ���ݴ���
          *         =====================
          *            2.4 ȱ©ֵ�Ĵ���  
		  
		  
*------------------
*-2.4 ȱ©ֵ�Ĵ��� 
*------------------
  
  *     ==����Ŀ¼== 
  
  *     2.4.1 ȱ©ֵ��� 
  *     2.4.2 ȱ©ֵ�ı��
  *     2.4.3 ����/ɾ��ȱ©ֵ
  *         2.4.3.1 ȱ©ֵ����̬
  *         2.4.3.2 ɾ��ȱ©ֵ	
  *     2.4.4 ���ȱ(gap)
  *     2.4.5 ���ز�©����(multiple-imputation) 
  *         2.4.5.1 MI ���
  *         2.4.5.2 ʵ������
  *         2.4.5.3 MI impute regress �ļ�������
  *         2.4.5.4 ������©���� 
  *         2.4.5.5 �������    
  
   
*                  =��������=  
* ================================================
*   missing, mi(), mvencode, mvdecode, mistable
*   rmiss(), dropmiss, 
*   mi set, mi impute, miestimate, 
* ================================================

  
*__________________  
*-2.4.1 ȱ©ֵ��� 
  
  help missing
  
  *- "." �����κ���Ȼ�� 
  
  sysuse auto, clear
    sort rep78
    list rep78
  sum rep78 if rep78>4   // obs=11
  count if rep78>4       // obs=16, why?
  keep  if rep78>4
  list rep78
  
  *-˵����
    *-��Щ����� sum, regress, generate �ȣ����Զ�����ȱ©ֵ��
    *-��Щ����� count, keep �ȣ���Ὣ "." ��Ϊһ����������ֵ
    *-ʹ�ù�����Ҫ�ر�ע��
  

*_____________________  
*-2.4.2 ȱ©ֵ�ı��

  *-��ֵ��ȱ©ֵ
    shellout d_miss.txt
    insheet using d_miss.txt, clear
	sum
    mvdecode x1, mv(-97)  // ���¶���ĳ��������ȱ©ֵ
	list
	sum
	insheet using d_miss.txt, clear
	mvdecode _all, mv(-97 -999)
    sum
	
     
  *-������ȱ©ֵ
    type d201.txt
    insheet using d201.txt, clear
    replace x1 = .   if x1== "N/A"  // ����ʽ
    replace x1 ="."  if x1== "N/A"
	des
    gen x1_new = real(x1)


*________________________  
*-2.4.3 ����/ɾ��ȱ©ֵ       -misstable-  stata11��������
 
  *-2.4.3.1 ȱ©ֵ����̬
 
    *-��򵥵�����: -summarize-
      sysuse nlsw88.dta, clear
      sum
 
    *-misstable summarize-���ȱ©ֵ�Ļ���ͳ��
      sysuse nlsw88.dta, clear
	  misstable summarize       // ���б���
      misstable sum age-union   // ָ������
 
    *-mistable pattern-�����ʾȱ©ֵ��ģʽ
      misstable pattern
	  misstable pattern, bypat
  
    *-mistable tree-�����ϸ��ʾȱ©ֵ��ģʽ
	  misstable tree union tenure in 1/1000, freq
	  *-���ս���
      misstable summ union tenure in 1/1000
	
  
  *-2.4.3.2 ɾ��ȱ©ֵ	
	
    *-rmiss()���� 
	  sysuse nlsw88.dta, clear
      egen miss = rmiss(wage industry occupation)
      list wage industry occupation miss if mis!=0  
      drop if miss!=0
 
    *-missing()���� 
      sysuse nlsw88.dta, clear
      sum
      drop if missing(grade,indus,occup,union,hours,tenure)
      sum
  
  
    *-��Ϊ�������-dropmiss-  (�ⲿ����)
	
      help dropmiss
	  
      sysuse nlsw88.dta, clear
        sum
        misstable sum
      dropmiss, obs   // �Թ۲�ֵΪ��λ
        sum
        misstable sum // nothing dropped
        
      sysuse nlsw88.dta, clear
        sum
      dropmiss, any   // �Ա���Ϊ��λ
        sum           // 6 variables dropped
        misstable sum 

	  sysuse nlsw88.dta, clear
      dropmiss, any obs  // ���������������Ҫ��
        sum

	  
    *-��һ������ķ��� -regress- ����
	
      sysuse nlsw88.dta, clear
      sum
	  
      reg wage industry occup tenure hours
	  
      gen byte nomis = e(sample)    // ��ʾ�������������
      sum wage industry occup tenure hours if (nomis==1)
	  keep if nomis
  
  

*_____________________  
*-2.4.4 ���ȱ(gap)

  * ����Panel Data��һЩ��������ϣ��ɲ���ǰ�������ȱ©ֵ�
  * http://www.stata.com/support/faqs/data/missing.html
  
  * case1: ��һȱ©ֵ֮�
    use d_miss01.dta, clear
    list
    sort t
    replace x = x[_n-1] if x==. 
    list
    
    use d_miss01.dta, clear
    list
    sort t
    replace x = x[_n+1] if missing(x)  // help missing()
    list
 
  * case2: ���ȱ©ֵ֮�
    use d_miss02.dta, clear
    list
    sort t
    replace x = x[_n-1] if mi(x)  
    list
    * ���ͣ����ν����滻
    * �����滻
      use d_miss02.dta, clear
      list
      gsort -t
      list 
      replace x = x[_n-1] if mi(x) 
      sort t 
      list
      
  * case3: Panel Dataȱ©ֵ֮�
    use d_miss03.dta, clear
    list , sep(4)    
    tsset id year
    by id: replace x = L.x if mi(x)
    list, sep(4)    
    
    
*-��һ���Ķ������ϣ�
  *
  *[1] How can I drop spells of missing values at 
  *    the beginning and end of panel data? 
   view browse http://www.stata.com/support/faqs/data/dropmiss.html
  *[2] How can I replace missing values with previous or 
  *    following nonmissing values or within sequences?
   view browse http://www.stata.com/support/faqs/data/missing.html
   
   
   
*______________________  
*-2.4.5 ���ز�©����    (multiple-imputation)  -mi-

   help mi         // stata11 ���¹���
   
   *-2.4.5.1 MI ���
   
     *-ȱ©ֵ�Ĳ�������� v.s. �����
	 
	 *-ȱ©ֵ��Ӱ�죺
	 *   ��ȱ©ֵ�Ƿ�����ģ�����Ӧ��ͳ���ƶϻ��������ƫ��
	 *   ����֮����ȱ©�������ܺܺõ�����ĸ������
	 
	 *-���ز�©�Ļ���˼��
	 
	 *-���ز�©������
	   *-[1] ����ȱ©ֵ�Ĳ����������κμ���(��������Ϊ Random)
	   *-[2] ���� Bayesian �� MCMC ģ�����
	   
	 *------------------------------------------------------------  
	 *-MI �����Ĳ���
	 
	   *-step1: �������ݽṹ
	   *
	   * stata��� 
	   *   mi set
	   *   mi register
	   
	   *-step2: ��©����(imputation step)  [-imputation model-]
	   *   �ڸ��������£�ʹ��ĳ��ģ�ͽ��� M �β�ֵ (imputation)
       *
	   * stata��� 
	   *   mi impute
	   
	   *-step3: Ŀ��ģ�͹���(Pooling step)
	   *	   (completed-data analysis step) [-analysis model-]
	   *
	   *   ���õڶ����е� M �����ݽ��� M �λع����
	   *   ���� M �ι��ƽ�������������õ����յĽ��
	   *
	   * stata��� 
	   *   mi estimate	   
	 *------------------------------------------------------------	
	 
	 *-�ο�����
   
       *-stata �ֲ� [MI]
         help mi_intro_substantive  //�����������
   
       *-һ�����ٵĽ���
         view browse http://www.stat.psu.edu/~jls/mifaq.html

		 
   *-2.4.5.2 ʵ������
   *
   *------------------------ʵ����ʼ------------------------------	   
   
    *-E1- ��������
	 
     *-Case-1-�����ȱ©(missing at random, MAR)
       sysuse auto, clear
       gen price_R = price
	   set seed 13579
	   gen random = uniform()
	   sum random
       replace price_R =. if random>0.9  
	 
     *-Case-2-�������ȱ©(missing not at random, MNAR)
       gen price_U = price
	   replace price_U =. if price>11500	 
	   sum price price_* 
	   sum weight mpg length foreign if price_R ~=.
	   sum weight mpg length foreign if price_U ~=.
	 
	   save mi_auto, replace  // ���������Ա���������
	 
     
    *-E2- ���ز�©����
	
     *-2-1- mi set style �����趨
	   view help mi_set##style
	   
	   use mi_auto, clear
	   mi set wide        // �趨

	 *-2-2- mi register  ��������ȱ©ֵ�ı���
	   view help mi_set##register
	   mi register imputed price_R
	   mi describe

	 *-2-3- mi impute method  ��©
	   help mi impute
	   mi impute regress price_R wei len mpg turn forei, ///
	                 add(20) rseed(1357)

	   *-��©Ч��
	    egen pav_R_im = rowmean(_*_price_R)
	    list price pav_R_im  if price_R==., sep(0)
      
	 *-E3- mi estimate  ����ģ��
	   mi estimate: logit foreign price_R wei mpg turn
	   est store mi
	   *-�ԱȽ��
	   logit foreign price wei mpg turn,nolog noheader

	 *-E4-С�᣺��������   
	   use mi_auto, clear
	   mi set wide 
	   mi register imputed price_R
	   mi impute regress price_R wei len mpg turn forei, add(20)
	   mi estimate: logit foreign price_R wei mpg turn
	 
   *------------------------ʵ������------------------------------

   *-˵�����Խ������ϸ���ͣ��μ� [MI]�ֲ� p.46 
     
	 *-(1) average RVI: average relative variance increase
	 *     ȱ©ֵ�Ĵ��ڻᵼ��ģ�͵�var����
	 *     ��ָ�������ȱ©ֵ��Ӱ��̶ȣ�RVIԽС����Ӱ��ԽС
	    sysuse auto, clear
		replace price=. in 1/1   //ֻ��һ��ȱ©ֵ
		mi set wide
		mi register imputed price
		mi impute regress price wei len mpg turn forei, add(20)
		mi estimate: logit foreign price wei mpg turn
     
	 *-(2) ���ƹ��̵Ĺ�ʽ���μ� [MI]�ֲ�, p.56
 
 
   *-2.4.5.3 MI impute regress �ļ�������
	  
	  *-Ҫ��������̬�ֲ�����
	  
	   use mi_auto, clear
	   
	   gen ln_price_U = ln(price_U)    // ����ת��
	   sum price_U ln_price_U, d
		 
	   mi set wide 
	   mi register imputed ln_price_U
	   
	   mi impute regress ln_price_U wei len mpg turn forei, ///
	             add(20) rseed(2468)
	   
	   *-������������Ҫʹ�� price_U, ���� ln_price_U
	   *-���� price_U �� ln_price_U �ĺ�����
	   *-�� ln_price_U ��һ�� "imputed variable"��
	   *-��ˣ�price_U ��һ�� "passive variable"
	       mi register passive price_U
	   qui mi passive: replace price_U = exp(ln_price_U) //����
	   
	   *-����MIģ��
	   mi estimate: logit foreign price_U wei mpg turn
	   * �Ա���ʵ����
	   logit foreign price wei mpg turn, nolog noheader
	   * �Ա�ֱ��ɾ�����ݵ�����
	   logit foreign price_U wei mpg turn, nolog noheader
	   
	   *-˵����(1)��Ҫ�Ĳ�����ڱ��� -turn-
	   *       (2)�����У�MI�Ľ�����ӽ�ֱ��ɾ���Ľ��
	
	
   *-2.4.5.4 ������©���� 
 
      *-mi impute pmm
	    help mi impute pmm
		*-��ģ���趨�ͷֲ����費���У��Ƚ��Խϸ�
		
      *-mi impute logit
	    help mi impute logit
		*-����� {0/1} ������ȱ©ֵ
		
      *-mi impute mlogit
	    help mi impute mlogit 
        *-����� {0/1/2/3...} ��������ȱ©ֵ 
		
	  *-����
	    help mi impute
		
	  
   *-2.4.5.5 �������
	
	  help mi estimate postestimation


	  
 
  
  
  
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         =====================
          *            �ڶ���  ���ݴ���
          *         =====================
          *            2.5 ��Ⱥֵ�Ĵ���
		  
		  
*------------------
*-2.5 ��Ⱥֵ�Ĵ���  
*------------------
  
  *     ==����Ŀ¼== 
  
  *     2.5.1 ��Ⱥֵ��Ӱ��
  *     2.5.2 ������Ⱥֵ
  *     2.5.3 ��Ⱥֵ�Ĵ���
  *         2.5.3.1 ɾ��
  *         2.5.3.2 ����ת��
  *         2.5.3.3 ��β����
  *         2.5.3.4 ��β���� 
  
   
*                  =��������=  
* ================================================
*   histogram, winsor, hadimvo, egen outside()
*   qr, adjacent, fsreg, lv
* ================================================	  

 
*_____________________
*-2.5.1 ��Ⱥֵ��Ӱ��
    
    *-������Ⱥֵ�Իع�����Ӱ��
	
      sysuse auto, clear
      histogram price
      count if price>13000

      reg price weight length foreign
       est store r1
      reg price weight length foreign if price<13000
       est store r2
	   
      esttab r1 r2, mtitle("with" "without")
	  
    *-���ۣ���Ȼ��Ⱥֵֻ��4�������Իع�����Ӱ��ȴ�ܴ�


*___________________
*-2.5.2 ������Ⱥֵ
  
    *                  -------------    
    *                     ��������
    *                  -------------
	*
    * ��25��50��75�ٷ�λ�ϵ���ֵ�ֱ��Ϊ��1��2��3�ķ�λ
    * �ķ�λ���(interquartile range): iqr = p75-p25
    * �Ͻ�(upper adjacent) = p75 + 1.5*iqr
    * �½�(lower adjacent) = p25 - 1.5*iqr
    *------------------------------------------------
    
    *-adjacent- ����
      sysuse auto, clear
      adjacent price
      adjacent price, by(foreign)
	  
	*-egenmore �ṩ�� outside() ����
	  egen out  = outside(price)  
	  egen out2 = outside(price), factor(2)
	  egen outby= outside(price), by(foreign) factor(2)
	  list price out*
	  keep if outby==.  // ɾ����Ⱥֵ

    *-����ͼ
      help graph box
      graph box price
      graph box price, by(foreign)
      graph box weight, by(foreign)


	  
*_____________________
*-2.5.3 ��Ⱥֵ�Ĵ���

    *-2.5.3.1 ɾ��
	
      sysuse auto, clear
      adjacent price, by(foreign) 
      drop if (price>8814&foreign==0) | (price>9735&foreign==1)
	  
	  *-or            // ��Ҫ��ǰ��װ-egenmore-�������
	  sysuse auto, clear
	  egen outby = outside(price), by(foreign) factor(2)
	  drop if outby != .
	  
  
    *-2.5.3.2 ����ת��
	
      sysuse nlsw88, clear
      gen ln_wage = ln(wage)
	  
      twoway (histogram wage,color(green))      ///
             (histogram ln_wage,color(yellow))
			 
      sum wage ln_wage, d
	  
      graph box wage
      graph box ln_wage


    *-2.5.3.3 ��β����
	
      sysuse nlsw88.dta, clear
      histogram wage
	  
      *-˫����β
        winsor wage, gen(wage_w2) p(0.025)
		
		*-ͼʾ
        twoway (histogram wage,color(green))      ///
               (histogram wage_w2,color(yellow)), ///
               legend(label(1 "wage") label(2 "wage_winsor2")) 
			   
      *-������β
        winsor wage, gen(wage_h) p(0.025) highonly
		*-ͼʾ
        twoway (histogram wage,color(green))      ///
               (histogram wage_h,color(yellow)),  ///
               legend(label(1 "wage") label(2 "wage_winsorH"))
		
		
      *-���޷����� winsor ������Բ������´�������
	    
		_pctile wage, percentile(1 99)
		replace wage = r(r1) if wage<r(r1)
		replace wage = r(r2) if wage>r(r2)
		
		*-��ɲ��� clip() ���� (�μ���2.1.2.6С�ڣ���385��)
		 gen wage_w = clip(wage, r(r1), r(r2))
		 sum wage wage_w, detail

        
	
    *-2.5.3.4 ��β����
	
      sysuse nlsw88, clear
      _pctile wage, percentile(1 99)
      return list
      drop if wage<r(r1)  // ɾ��С�ڵ�1�ٷ�λ������
      drop if wage>r(r2)  // ɾ�����ڵ�99�ٷ�λ������
      
      *-˵����
      * (1) �����Ȼ���ֱ��ͼ���������ݷֲ����ѡ�����β��
	  *     �ҽ�β����˫�߽�β
      * (2) �����ln()�����winsor�����ô������ʧ����
      *     �����ڴ��������ԣ��÷����Ƚϡ��ɾ���





	  
 
  
  
  
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         ======================
          *            �ڶ���  ���ݴ���
          *         ======================
          *          2.6 ���ϵĺϲ���׷��  
		  
		  
*----------------------
*-2.6 ���ϵĺϲ���׷��           
*----------------------
  
  *     ==����Ŀ¼== 
  
  *     2.6.1 ����ϲ������ӱ���   
  *         2.6.1.1 һ��һ�ϲ� 
  *         2.6.1.2 ���һ�ϲ� 
  *         2.6.1.3 һ�Զ�ϲ� 
  *         2.6.1.4 һ������
  *     2.6.2 �������: -joinby-  	
  *     2.6.3 ����ϲ���׷������  	
  *     2.6.4 �������ݵĴ���
  *     2.6.5 һЩ���õ��ⲿ����
  
   
*                  =��������=  
* ================================================
*   -merge-  -jionby-  -append-
* ================================================	  

  
  cd `c(sysdir_personal)'Net_course_A\A2_data


*____________________________ 
*-2.6.1 ����ϲ������ӱ���        -merge-

    do L2_data_gr_merge.do 

  *-2.6.1.1 һ��һ�ϲ�  [ 1:1 ]
  
    view help merge##ii
  
    *-���ϲ�������
      use merge_u.dta, clear
      browse
      use merge_m.dta, clear
      browse
	  
	*-�ϲ�������
	  use merge_m.dta, clear
	  merge 1:1 date using merge_u
      
    *- _merge �����ĺ��壺
    *
    *  _merge==1  obs. from master data                            
    *  _merge==2  obs. from only one using dataset                 
    *  _merge==3  obs. from at least two datasets, master or using
    
	*-��˵������stata11��ǰ������ϲ��Ĺ���Ҫ����һЩ
	*         �ںϲ�ǰ������������ date �������������ݽ�������
	
	*-����ѡ��
	
	   help merge
	   
	   *-keepusing(varlist) ѡ�� (���ϲ���������)
	     use merge_m.dta, clear
		 merge 1:1 date using merge_u, keepusing(close)
	   
	   *-generate() ѡ�� v.s. nogenerate ѡ��
	     use merge_m.dta, clear
		 merge 1:1 date using merge_u, gen(m1)
		 
	   *-nolabel, nonotes ѡ�� (���������ϲ����ݵ�"����-���ֶ�Ӧ��")
		 
	   *-update ѡ�� (���������ݼ��е�ȱ©ֵ)
	     *-����
		 use merge_u.dta, clear
           browse
		 use merge_m.dta, clear
		   gen close = . // merge_u.dta ��Ҳ�иñ�������ȡֵ��ͬ
		   browse
		 *-�ϲ�����  
	     merge 1:1 date using merge_u, update
		   browse
		   
	   *-replace ѡ�� ()
	     use merge_m.dta, clear
		   gen close = 0 // ע�⣬������ close=0
		   browse
	     merge 1:1 date using merge_u, update  
		   browse	     // close=0 ��δ�����仯
		 
		   drop _merge
		 merge 1:1 date using merge_u, update replace // ��ȷ����
		   browse

		   
  *-2.6.1.2 ���һ�ϲ�  [ m:1 ]
  
    view help merge##mi
	
	*-������̬
	  use GTA_FS.dta,clear     // ���й�˾��������
          browse 
      use GTA_basic.dta,clear  // ���й�˾��������,ֻ�� id û�� year
          browse 
	
	*-�ϲ�����
	  use GTA_FS.dta, clear
	  merge m:1 id using GTA_basic.dta, nogen
	  
		   
  *-2.6.1.3 һ�Զ�ϲ�  [ 1:m ] 
  
    view help merge##im    // ��ʵ���� m:1 ���������
	
	*-������̬
	  use GTA_FS.dta,clear     // ���й�˾��������
          browse 
      use GTA_basic.dta,clear  // ���й�˾��������,ֻ�� id û�� year
          browse 
	
	*-�ϲ�����
	  use GTA_basic.dta, clear
	  merge 1:m id using GTA_FS.dta, nogen
	  browse
	  order id year
	  tsset id year
	  
	  
  *-2.6.1.4 һ������
  
    *-������̬��
	
      use GTA_FS.dta,clear     // ���й�˾��������
          browse 
      use GTA_GC.dta,clear     // ���й�˾����ṹ��Ϣ
          browse 
      use GTA_div.dta,clear    // ���й�˾�������䡢�������
          browse 
      use GTA_basic.dta,clear  // ���й�˾��������,ֻ�� id û�� year
          browse
      
    *-�ϲ���������
    
      *-����˼·��
      * (1) �ȸ��� id year ��ǰ��������һ���Ժϲ�������[1:1]
      * (2) �ٸ��� id      ��GTA_basic���ݺϲ�����     [m:1]
	  
      use GTA_FS.dta, clear
      merge 1:1 id year using GTA_GC.dta , nogen
	  merge 1:1 id year using GTA_div.dta, nogen
      merge m:1 id      using GTA_basic, nogen   

      tsset id year   
      save GTA_merge.dta, replace    // ����ϲ�������� 
  


*_________________ 
*-2.6.2 �������      -joinby-

  *-Ӧ�ñ���: ����ֻ��Ҫ���������������ж�Ӧ��ϵ������
    use child.dta, clear
       list, sepby(family_id)
       sort family_id
       save, replace
    use parent.dta, clear
       sort family_id           // ��һ������Ҫ��
       list, sepby(family_id)
    joinby family_id using child.dta
       sort family_id parent_id child_id
       order family_id parent_id child_id
       list, sepby(fam)
	  
    
  *-��-merge- ����ĶԱ�
     use parent, clear
       sort fam*id
     merge m:m fam using child
       sort family_id parent_id child_id
       order family_id parent_id child_id     
     list, sepby(fam)
       
    
*__________________________ 
*-2.6.3 ����ϲ���׷������      -append-

   do L2_data_gr_append.do    // ����ԭ��
   
   *-�������ݿ��е�"ͬ������"���Զ���Ӧ�۵�
   
   *-������̬
     use append_m.dta, clear
         browse
		 tsset date
     use append_u.dta, clear
         browse
		 tsset date
 
     use append_m.dta, clear
     append using append_u.dta
         browse
		 tsset date
		 
   *-generate() ѡ��
     use append_m.dta, clear
     append using append_u.dta, gen(append_id)
	     browse
		 
   *-nolabel, nonotes ѡ��
     
   *- ����ע�����
   *  (1) �������ݿ��еı�������Ҫ��ͬ
   *      PRICE �� price �ǲ�ͬ�ı���
   *  (2) �������ݿ��е�ͬ������Ҫ������ͬ�Ĵ洢����
   *      ͬΪ���ֱ�����ͬΪ��ֵ����
   
   *-����(2)ʾ�����������ݼ��еı����洢���Ͳ�ͬ
	
      sysuse auto,clear
        keep foreign
        keep if !foreign       // keep if foreign==0
      save auto_dom, replace   // ���ݼ�1������foreignΪ��ֵ����
	  
      sysuse auto, clear
        keep foreign 
        keep if foreign
        rename foreign s
        gen foreign = "foreign" if s
        drop s
      save auto_for, replace   // ���ݼ�2������foreignΪ��������
      
      use auto_dom, clear
      browse
      append using auto_for
      browse
      
    *-�����ϲ����Ⱥ�˳�������޲��� 
      use auto_for, clear
      browse
      append using auto_dom
      browse
     
	*-���� -force- ѡ��, ����ʵ���ԸĽ�
      use auto_dom, clear
      append using auto_for, force 
	  browse

	*-��ν����
	  use auto_for, clear
	  rename foreign ss
	  gen byte foreign=1 
	  drop ss
	  
	  append using auto_dom
	  browse
	
	
	
*_______________________ 
*-2.6.4 �������ݵĴ���    

  *-�������������й�˾�о����ݿ�
  
  *-��������������
    *-�������䣺1990-2008
    *-ָ�귶Χ�����й�˾�������ϡ�������Ϣ��������Ϣ���������䡢������ɵ�
    *-������Դ��CCER��GTA (ÿ�����ݿⶼ�ֳ������ɸ��ֿ�)
    
  *-���񣺰Ѳ�ͬ��Դ�ĸ������ݺϲ����������ϳ�һ����ɵ����ݼ���
  
    doedit GTA_2008.do                // ���ļ���ʱ 3 ����� 
	
	shellout �����_GTA2008˵����.pdf // ˵����

	

*__________________________
*-2.6.5 һЩ���õ��ⲿ����
  
  * -nearmrg-  performs nearest match merging of two datasets
  
  * -mmerge-   һ�������ĺϲ�����
  
  * -reclink-  module to probabilistically match records
  
  * -xmerge-,-xmerged-,-nmerge-  �����ϲ�����
  
  * -mergein-  �Զ������ϲ� // stata11 �û��Ѿ�����Ҫ��
  
  * -mergedct- ֱ�ӽ� .raw �ļ��ϲ������� .dta �ļ���
  
  * -addinby-  ��-merge-���˸Ľ�����������_merge�������ϲ���������
  
  * -kountry-  standardize country names across various datasets��SJ8-3��
  
  * -tvc_merge- merge two files which each contain time varying covariates



	  
 
  
  
  
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         ======================
          *            �ڶ���  ���ݴ���
          *         ======================
          *            2.7 ����������� 
		  
  
*------------------
*-2.7 �����������
*------------------
  
  *     ==����Ŀ¼== 
  
  *     2.7.1 ������ת��  
  *     2.7.2 ���ݵĺ��ݱ任  
  *     2.7.3 �����Ľ������  
  *         2.7.3.1  -fillin- ����
  *         2.7.3.2  -cross-����
  *     2.7.4 �����Ķ���
  
   
*                  =��������=  
* ==================================================
*   -xpose-  -reshape-  -fillin-  -stack-  -cross-
* ==================================================	  
  

*____________________
*-2.7.1 ������ת��           -xpose-

   use d205.dta, clear
   list v1-v7
   
   xpose, clear             // clear ѡ������
   
   rename v1 date
   rename v2 open
   rename v3 close
   save d204.dta, replace   // ���һ�����ݣ���Ϊԭʼ�����ѱ��޸�
   
   
*_______________________
*-2.7.2 ���ݵĺ��ݱ任      -reshape-

  *- ��������
     shellout reshape0.txt  // -xpose- �����Ч
     
  *- wide --> long
     use reshape1.dta, clear
     list
     reshape long inc ue, i(id) j(year) // sex �������仯������ת��
                                        // j() ѡ������д�µı�������
     list, sepby(id)
     replace year = real("19" + string(year))
     list, sepby(id)
     
  *- long --> wide
     reshape wide inc ue, i(id) j(year)
        
*-ʾ����
*-World Development Indicator ת��
 view browse ///
    http://dss.princeton.edu/online_help/analysis/reshape_wdi.htm
 
*-��һ���Ĳο�����
 view browse ///
    http://www.stata.com/support/faqs/data/reshape3.html#
  
  
  
*_______________________   
*-2.7.3 �����Ľ������           -fillin-  -cross-   
 
  *-2.7.3.1  -fillin- ����
  
    *-��1��Nlogitģ���е�ѡ����Ϊ 
    *-see SJ 5-1, p.135, Filling in the gaps 
     clear            
     input id choice
             1   -1
             2    1
             3    0
             4   -1
     end
     list
     fillin id choice
     list, sepby(id)
     *-�ɼ���-fillin-���������ڶ�ԭʼ�۲�ֵ���С���ϡ�
     
    *-��2������һ��Panel Data �� id, year  
    * i = 1,2,20;  t = 2000-2008  
      clear
      set obs 20
      gen id = _n
      gen tt = _n + 2000
      list
	  
      fillin id tt
	  
      list, sepby(id)
      drop if (tt>2008)
      drop _fillin
      list, sepby(id)
 
 
  *-2.7.3.2  -cross-����
    
    clear
    input str6 sex
               male
               female
    end
    save sex, replace
    
    clear
    input age
           20
           40
           50
    end
    
    cross using sex.dta
    
    list, sep(0)
  
    *-����� -fillin- ������Խ��
      clear
      input str6 sex     age
                 male     20
                 female   40
                   .      60
      end  
      fillin sex age
      list, sep(0)
      drop if sex == "."
      list, sep(0)
    
  *-˵����-cross-�������ʹ�ã�SJ 6-1, p.147 �ṩ��һ������
  
*-����Ķ����� 16 ¥
  view browse ///
     http://www.pinggu.org/bbs/thread-436189-1-1.html
  

  
*__________________   
*-2.7.4 �����Ķ���

  *-���
  * ����˼�룺������
    
    use stackxmpl.dta, clear
    list
    stack a b c d, into(x) clear       // ������һ��
    list, sepby(_stack)
     
    use stackxmpl.dta, clear 
    list
    stack a b c d, into(x1 x2) clear   // ����������
    list, sepby(_stack)
      
      
  *-����    
    
    *-ԭʼ����
      use stack_lnexp.dta,clear
      browse
   
    *-�������� 
      stack china-unitedstates, into(lnexp) clear
	  browse
   
    *-��һ������ I: ������ȱ���  
      rename _stack id
      egen year = seq(), from(1998) to(2007)
      order id year
      tsset id year
      save lnexp_temp, replace  // ������Ҫ����һ������   
   
    *-��һ������ II: ���ӹ��� 
	
      *-ȡ������
        use stack_lnexp.dta,clear
        drop lnexp
		browse
		
        mkmat _all, mat(a)      // ���������(����)����������Ҫ��
		mat list a
		
        global vn: colnames a   // �������洢����Ԫ vn ��
        dis "$vn" 
		
      *-������� 
        use lnexp_temp, clear
        rename id id123
        gen id = "" 
        local i = 1
        foreach nn of global vn{ // 1 --> "china" 
           qui replace id="`nn'" if id123==`i++'
        }
        
		sencode id, replace // id ��һ�����ֱ�������ת��Ϊ��ֵ����
		labelbook
		
        order id year id123
        tsset id year 
		
		browse
     
        save lnexp.dta, replace
     
     

 
  
  
  
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         ======================
          *            �ڶ���  ���ݴ���
          *         ======================
          *           2.8 ���ֱ����Ĵ���
		  
  
*--------------------
*-2.8 ���ֱ����Ĵ���
*--------------------
  
  *     ==����Ŀ¼== 
  
  *     2.8.1 ������ת��Ϊ����
  *         2.8.1.1 ���������ʹ洢������֮ת�� 
  *         2.8.1.2 ������������֮ת�� 
  *     2.8.2 ������ת��������
  *     2.8.3 ��������ֵ�ķֽ�
  *     2.8.4 �������ֵĺ���
  *         2.8.4.1 ���ֺ������
  *         2.8.4.2 ��-1-�����й�˾���ڡ���ҵ��������ڵصĴ���
  *         2.8.4.3 ��-2-�������ϵ�������������Ƶ���ȡ
  *         2.8.4.4 ��-3-���������������
  
   
*                  =��������=  
* ==================================================
*   -destring-  -encode-  -sdecode-  -real()-
*   -tostring-  -decode-  -rdecode-  -redecodeall-
*   -substr()-  -strmatch()-  -split-
*   -regexm()-  -regexs()-  -regexr()-
* ==================================================	


*__________________________
*-2.8.1  ������ת��Ϊ����

  *-2.8.1.1 ���������ʹ洢������֮ת��      -destring-

    *- ˵����
    *-   �� .txt �ĵ��ж�����ֵ����֮���Ի�������ֵ��ʽ�洢��
    *-   ��Ҫԭ���Ǳ����п��ܰ���������������ţ�
    *-   ���`$'������`,'��б��`/'���ٷֱ�`%'�����ۺ�`-'
  
    shellout d202.txt
    insheet  using d202.txt, clear names
    save d202.dta, replace
    des
    sum

    *-˵������Ȼ code ������������ɣ���������Ϊ str7,��Ϊ�����ͱ���
    *       leverage, size, date ���������Ƶ�����
	
    use d202.dta, clear
    destring code,     gen(code1) ignore(" ")  
    destring leverage, gen(lev) percent
    destring year date size lev, replace ignore("-/,%")
    

  *-2.8.1.2 ������������֮ת��       -encode-, -rdecode-
  
    use d202.dta, clear
    encode gov, gen(gov1)
    labelbook
	
    *-˵����
	*
    *- encode ������Զ�������������ţ�
	*         ���趨��Ӧ��[����-���ֶ�Ӧ��]
	*
    *  [����-���ֶ�Ӧ��] ������ĸ˳�����С� 
                 sysuse auto, clear
                 encode make, gen(make_num)
                 order make make_num
                 labelbook
				 
    *_Q: ��θ��ݳ��ֵ��Ⱥ�˳���趨[����-���ֶ�Ӧ��]? [-sdecode-]  
	
    *- ȱ�ݣ�
	*  (1) û�� -replace- ѡ��                        [-rdecode-]
    *  (2) ÿ��ֻ��ת��һ���������޷�ʵ������ת��     [-rdecodeall-]
                

    *-rdecode- ������� replace ѡ��
	
      use d202.dta, clear
      rencode gov, replace
      labelbook
	  
      *-˵����
      *  (1) �����������ƵĻ��� -sencode- ����
      *  (2) ʹ�� -rdecodeall- �������ͬʱת���������
    
	
    *-encode ������ -destring- ������
    *
    *-(1) �����֡���桱Ϊ�����ͱ�����ʹ��-destring-����� real() ����
	*
    *-(2) ���۲�ֵ��Ϊ������ֵ��������ʹ��-encode-��-rencode-���
    *     ��Щ������Զ�����������-���ֶ�Ӧ��
 
 
*_________________________
*-2.8.2 ������ת��������

  *-ĳЩ����£��Ȱ�����ת�������֣�
  *-Ȼ�����ô������ֵĺ������д���ȽϷ���
        
  *-eg01�������յ����
  
    use tostring.dta, clear
    tostring year day, replace
    gen date = year + "-" + month + "-" + day
    gen edate = date(date, "YMD")
    format edate %td
    browse
   
   
  *-eg02�������յķ���
  
    use tostring2.dta, clear
    browse
    tostring date_pub, gen(date1)
    gen year  = substr(date1, 1, 4)
    gen month = substr(date1, 5, 2)
    gen day   = substr(date1, 7, 2)
    browse
    destring year month day, replace
    browse 
    
  *-˵����
  *   -decode-�����ȱ��ͬ������û�� -replace- ѡ�
  *   ���Բ����ⲿ���� -rdecode- �� -sdecode- ����֮��    
  
 
*_________________________
*-2.8.3  ��������ֵ�ķֽ�

    use d202.dta,clear
    list
    
  *-�� year ��������ȡ���   -split-
    split year, parse(-)
    order year year1 year2
    list
    browse
    gen year3 = real(year1)   // year1��ȫΪ��ֵ�����������ʹ洢
	
    * destring year1, replace // ��һ�ַ�ʽ

  *-�� date ��������ȡ��ݡ��¶Ⱥ�����,��ת��Ϊ��ֵ
    split date,parse(/) destring ignore("/") 
    order date date*
    edit
    
*-Also see  һ���Ƚϸ��ӵ�����
  view browse http://www.stata.com/support/faqs/data/splitstr.html


*_________________________
*-2.8.4  �������ֵĺ���

    help string functions

  *-2.8.4.1 ���ֺ������
  
    dis lower("AbCDef")
    dis length("price  weight length   mpg") 
    dis wordcount("price  weight length   mpg") //ͳ�Ʊ����ĸ���
    dis proper("mR. joHn a. sMitH")   // ��������
    dis strmatch("C51", "C")
    dis strmatch("C51", "C*")         // Ѱ������ҵ��˾
    dis  trim(" I love    STATA  ")   // ȥ�����˵Ŀո�
    dis ltrim(" I love    STATA  ")   // ȥ����ߵĿո� 
    dis rtrim(" I love    STATA  ")   // ȥ���ұߵĿո�       
    dis itrim(" I love    STATA  ")   // ȥ���м�Ŀո�             
    dis itrim("�� �� �� ������")   // ȥ���м�Ŀո񣬲���Ч��
    dis subinstr("�� �� �� ������", " ", "", .)
   *-���壺
   *  subinstr(s, s1, s2, n)
   *  s   ԭʼ�ַ���
   *  s1 �������滻�����ַ���
   *  s2 ���滻�ɡ����ַ���
   *  n   ǰn�����ֵ�Ŀ���ַ�����Ϊ��.�����ʾȫ���滻
    dis subinstr("�� �� �� ������", " ", "", 1)
	dis subinstr("�� �� �� ������", " ", "", 3)
   
   *-˵���������������������� -generate- �����������µı���
       
 
  *-2.8.4.2 ��-1-�����й�˾���ڡ���ҵ��������ڵصĴ���
  
    *-a �����������
      shellout d203.txt
      insheet date sic location using d203.txt, clear
      save d203.dta, replace
      browse

    *-b ��date�з�����ꡢ�¡���
      gen year  = int(date/10000)
      tostring date, gen(date1)
      gen year1 = substr(date1,1,4)
      gen year2 = real(year1)
      gen month = substr(date1,5,2)
      gen month1= real(month)
      gen day   = substr(date1,7,2)
      gen day1  = real(day)
      browse
   
      *-��Ϊ��������
        use d203.dta, clear
        gen sdate = string(date,"%10.0g")  // help string()
        gen year  = real(substr(string(date,"%10.0g"), 1, 4))
        gen month = real(substr(sdate, 5, 2))
        gen day   = real(substr(sdate, 7, 2))
        browse
        drop sdate

    *-c ����ҵ����sic�з������ҵ����
      gen sic_men0 = substr(sic,1,1)
      encode sic_men0, gen(sic_men)
      tab sic_men
      label list sic_men

    *-d �ӵص��з����ʡ�ݺͳ���
      use d203.dta,clear
      list
      gen province1 = substr(location, 1,2)
      gen city1     = substr(location, 4,4)
      list location province1 city1
      gen province2 = word(location, 1)
      gen city2     = word(location, 2)
      list location province1 city1 province2 city2
      
      *-ע�⣺ÿ��Ӣ����ĸռһλ����ÿ�������ַ�ռ��λ  
      
	  
	  
  *-2.8.4.3 ��-2-�������ϵ�������������Ƶ���ȡ
  
    *-��������
	  use bankname.dta, clear
	  tab objnm
	  list in 1/15   
	  
	*-������ȡ�����������ܲ�������
	  keep in 1/15
	  gen bank = objnm
	  replace bank="�й�ũҵ����" if strmatch(bank,"*ũҵ����*")
	  replace bank="��������"     if strmatch(bank,"*����*")
	  replace bank="�й�����"     if strmatch(bank,"*�й�����*")
	  replace bank="�й���������" if strmatch(bank,"*����*")
	  replace bank="��ҵ����"     if strmatch(bank,"*��ҵ*")
	  replace bank="�������"     if strmatch(bank,"*���*")
	  replace bank="��ͨ����"     if strmatch(bank,"*��ͨ*")
	  replace bank="��������"     if strmatch(bank,"*����*")
	  compress
	  browse

  
  *-2.8.4.4 ��-3-���������������
  
    *- regexm(), regexs(), regexr() ����  
  
    help regexm()
  
    *-�����﷨����
      view browse http://www.stata.com/support/faqs/data/regex.html
  
    *-ʾ�����������������
      clear
      input str18 date
          20jan2007 
          16June06
          06sept1985
          21june04
          4july90
          9jan1999
          6aug99
          19august2003
      end
	  
    *-��ι���֮��
      gen day   = regexs(0) if regexm(date, "^[0-9]+")
      gen month = regexs(0) if regexm(date, "[a-zA-Z]+")
      gen year  = regexs(0) if regexm(date, "[0-9]*$")
      browse
      replace year = "20"+regexs(0) if regexm(year, "^[0][0-9]$")
      replace year = "19"+regexs(0) if regexm(year, "^[1-9][0-9]$")
      gen date2 = day+month+year
      browse
	  
    *-���壺
    * (1) "^[0-9]+"  
    *      ^ ��ʾ�ַ����Ŀ�ͷ����
    *      [0-9] ��ʾ������Ȼ��0-9���κ�һ��
    *      + ��ʾ������һ���������ƥ������(*�κ�һ����?ֻ��һ��)
    * (2) "[a-zA-Z]+"
    *     [a-zA-Z] ��ʾ��������ĸ�е�a-z��A-Z
    * (3) "[0-9]*$"
    *     $ ��ʾ�ַ����Ľ�β����
  
 *-����ʾ����(1) ��δӵ�ַ����ȡ���ʱࡱ��
 *           (2) ��ι���������
   view browse http://www.ats.ucla.edu/stat/stata/faq/regex.htm  
   view browse http://www.stata.com/support/faqs/data/regex.html
  
  
 *-Also see:
  
  * Cox, N., 2002, Speaking Stata: On getting functions to do the work, 
       STATA JOURNAL, 2 (4): 411-427. (p.414)
	   
  * �ⲿ���� -egenmore- �ṩ�˴��������ִ��������ɹ��ο�
  
    help egenmore
  

  
  
  
	   
	   
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         ======================
          *            �ڶ���  ���ݴ���
          *         ======================
          *           2.9 �������ķ���
		  
  
*---------------------
*-2.9 �������ķ���
*---------------------
  
  *     ==����Ŀ¼== 
  
  *     2.9.1 �������ͳ��
  *     2.9.2 ���������������� 
  *     2.9.3 ����ͳ����
  *         2.9.3.1 �������ͳ���� 
  *         2.9.3.2 ����κ�����η���ͳ����
  *         2.9.3.3 ���η���ͳ����
  *     2.9.4 �������ͳ��������������
  *         2.9.4.1 -egen-����
  *         2.9.4.2 ת��ԭ����Ϊ����ͳ������-collapse-����
  *     2.9.5 ͼʾ����ͳ����
  *         2.9.5.1 ��״ͼ
  *         2.9.5.2 ����ͼ
  
   
*                  =��������=  
* ==================================================
*   -tab-  -distinct-  -xgroup-  -bysort-  
*   -tabstat-  -collapse-  -graph bar-  -graph box-
* ==================================================


*______________________
*-2.9.1  �������ͳ��
  
  *-�򵥷�����-tab- ����
  
    sysuse nlsw88, clear
    tab race
    tab occupation  // ���ޣ��޷�ֱ�ӿ��������Ŀ
    
	
  *-ͳ�Ʒ��ظ�ֵ�ĸ���
  
    distinct occupation
    ret list
    distinct married race
    distinct married race, joint  // ��ϸ���
    distinct married race occupation, joint
  
  
*____________________________
*-2.9.2  ���������������� 
  
  sysuse nlsw88, clear
  tab race
  tab married
  
  *-Q���������һ���µ���������ȡֵΪ1-6����race��married�����
  
    xgroup race married, gen(race_marr) 
      browse race married race_marr in 1/20
    xgroup race married, gen(race_marr2) label lname(race_marr_lab)
      browse race married race_marr in 1/20
      label list race_marr_lab
  
  *-˵����
  *  (1) ��ͬʱ���ڶ���������������ǵ�������ͣ�
  *  (2) ���������ɵ������������Խ�һ�������������
  *  (3) �μ� -xi-, -fvvarlist- �����ļ� (2.1.2С��)
  
  
  
*__________________
*-2.9.3 ����ͳ����
  
  *-2.9.3.1  �������ͳ���� 
    
    *-bysort,sum
      sysuse nlsw88.dta,clear
      bysort race: sum wage

    *-tabstat ����
      tabstat wage, by(race) stat(mean sd med min max) 
      tabstat wage hours ttl_exp, by(race)      ///
              stat(n mean sd med min max)       ///
              format(%6.2f) columns(statistics) 
            
    *-tabulate ����
      tabulate industry
      tab industry, sort    // �ɼ�дΪ -tab-
      tab industry, summarize(wage) 


  *-2.9.3.2  ����κ�����η���ͳ����
    
    bysort race married: sum wage
    bysort race married: tabstat wage,   ///
           by(union) s(n mean sd p50 min max)
    tabstat wage, by(race married union)  ///
           s(n mean sd p50 min max) // ����ʽ
    bysort race married: tab union, sum(wage)


  *-2.9.3.3  ���η���ͳ����
    
    *-�����ܹ���table var1 var2 var3, by(var4) contents(...)
    
    table race married union,       ///
          by(collgrad) c(mean wage) format(%4.2f)
    table race married union,       ///
          by(collgrad) c(mean wage freq) format(%4.2f)


*_________________________________
*-2.9.4  �������ͳ��������������

  *-2.9.4.1 egen ����
  
    bysort industry: egen wage_ind = mean(wage)
    bysort industry: egen wage_p50 = pctile(wage), p(50)
    list wage indust wage_ind wage_p50 in 1/30

	
  *-2.9.4.2 ת��ԭ����Ϊ����ͳ������collapse ����
  
    help collapse
    
    *-�﷨��collapse (ͳ����1) �±�����=ԭ������ (ͳ����2) ...
    
    sysuse nlsw88.dta,clear
    collapse (mean)  wage hours          ///
	         (count) n_w=wage n_h=hours, ///
	          by(industry)
    browse
    
    sysuse nlsw88.dta,clear
    collapse (mean)  wage hours          ///
	         (count) n_w=wage n_h=hours, ///
	          by(industry race) 
    browse
    
    * ����˵����
    *   (1) ��������do�ĵ�������Ҫ����ѡ�񱣴������ļ�
    *   (2) by() ѡ���Ǳ���ѡ�����ʡ��
    
    * collapse ��ԭʼ�����ı�ǩ�ᶪʧ�����������£�
      view browse ///
	  "http://www.stata.com/support/faqs/data/variables.html#"


	  
*________________________
*-2.9.5  ͼʾ����ͳ����

  *-2.9.5.1 ��״ͼ
  
    *-������״ͼ
      sysuse nlsw88.dta, clear
      graph bar (mean) wage, over(smsa) over(married) over(collgrad)
      do     L2_data_gr_bar1.do  // ��������ͼʾ
      doedit L2_data_gr_bar1.do
	  *- ˵����over() ѡ��ĳ���˳���Ǵ��ڵ���

    *-������״ͼ
      graph hbar (mean) hours, over(union) over(industry)
      *-note��over() ѡ���˳������˷���Ĳ�ι�ϵ��
      graph hbar (mean) hours, over(union) over(industry) asyvars 
	                 //asyvars-�ѵ�һ��over()ѡ���еı�����Ϊ����
      graph hbar (mean) hours, over(union) over(married)  ///
                               over(race) percent asyvars
						   
    *-�������״ͼ
      graph bar wage hours, over(race) over(married)
      graph bar wage hours, over(race) over(married) stack
	  
      *-over() ѡ�����ѡ��
        graph bar wage hours, stack                       ///
          over(race, relabel(1 "����" 2 "����" 3 "����")) ///
          over(married, relabel(1 "����" 2 "�ѻ�"))       ///
          legend(label(1 "����ˮƽ") label(2 "����ʱ��")) 


  *-2.9.5.2  ����ͼ

    *-����ͼ�ܽ������ĳ��ָ�������ֵ�ķֲ����              
    
	  sysuse nlsw88, clear
      
	  graph box wage,  over(race)
      graph box hours, over(race) over(married)
      graph box hours, over(race) over(married) nooutsides


  *-Also see:
  * 
  *  Cox,N., 2003,Speaking Stata: Problems with tables, Part I, 
  *          SJ,3(3):309-324.
  *  Cox,N., 2003,Speaking Stata: Problems with tables, Part II,
  *          SJ,3(4):420-439.
  *  Cox,N., D.City,2007,Stata tip 52: 
  *          Generating composite categorical variables, 
  *          SJ,7(4):582-583. (�����������Ĳ���)


  
	   
	   
	   
	   
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *               ::��һ����::
          *                Stata ����
          *         =========================
          *             �ڶ���  ���ݴ���
          *         =========================
          *         2.10  ʱ���������ϵĴ���
		  
  
*--------------------------
*-2.10  ʱ���������ϵĴ��� 
*--------------------------
  
  *     ==����Ŀ¼== 
  
  *     2.10.1  ���
  *         2.10.1.1 ����ʱ�����У�tsset ����
  *         2.10.1.2 ����Ƿ��жϵ�
  *         2.10.1.3 ���ȱ©������
  *         2.10.1.4 ׷������
  *     2.10.2 ʱ�����������
  *         2.10.2.1 �ͺ����ǰ��Ͳ����
  *         2.10.2.2 ���������ʱ���: �������
  *         2.10.2.3 ���ڱ����Ĵ���
  
   
*                  =��������=  
* ==================================================
*   -tsset-  -tsreport-  -tsappend-  -tsvarlist- 
*   -
* ==================================================



*______________
*-2.10.1  ���

  *-2.10.1.1 ����ʱ�����У�tsset ����
  
    use gnp96.dta, clear
    list in 1/20
    gen Lgnp = L.gnp   // ����
	
    tsset date
    list in 1/20
    gen Lgnp = L.gnp
    *-˵������ϣ�����ʱ���ʾ���ɲ���
      tsset, clear

	  
  *-2.10.1.2 ����Ƿ��жϵ�
  
    use gnp96.dta, clear
    tsset date
    tsreport, report
    drop in 10/10
    list in 1/12
    tsreport, report
    tsreport, report list  // �г����ڶϵ��������Ϣ

	
  *-2.10.1.3 ���ȱ©������
  
    list in 1/12           // ȱ�� 1969q2
    tsfill                 // ���֮
    tsreport, report list  
    list in 1/12           // �μ� 2.4 С��

	
  *-2.10.1.4 ׷������
  
    use gnp96.dta, clear
    tsset date
    list in -10/-1
    sum
    tsappend , add(5)      // ׷��5���۲�ֵ
    list in -10/-1
    sum

    *-Ӧ�ã�������Ԥ��
      reg gnp96 L.gnp96
      predict gnp_hat
      list in -10/-1
	  

*_________________________
*-2.10.2 ʱ�����������

  *-2.10.2.1 �ͺ����ǰ��Ͳ����  
    
    help tsvarlist
    
    use gnp96.dta, clear
    tsset date
	
    gen Lgnp  = L.gnp96   // һ���ͺ�
    gen L2gnp = L2.gnp96  // �����ͺ�
    gen Fgnp  = F.gnp96
    gen F2gnp = F2.gnp96
    gen Dgnp  = D.gnp96
    gen D2gnp = D2.gnp96
    list in 1/10
    list in -10/-1


  *-2.10.2.2 ���������ʱ���: �������
  
    gen lngnp = ln(gnp96)
    tsset date
    gen growth = D.lngnp 
    gen growth2 = (gnp96-L.gnp96)/L.gnp96
    gen diff = growth - growth2
    list date gnp96 lngnp growth* diff in 1/10
    
    
  *-2.10.2.3 ���ڱ����Ĵ���
  
    help dates_and_times
    
    *- �μ� stata�߼���Ƶ B6_TimeS
    *- Also see
    *   Cox, N., D. City, 2006, 
    *     Speaking Stata: Time of day, SJ, 6(1): 124-137.

 
 
 
 
 
	   
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         ======================
          *            �ڶ���  ���ݴ���
          *         ======================
          *         2.11 ������ϵĴ���(I)  
		  
  
*-------------------------
*-2.11  ������ϵĴ���(I)  
*-------------------------
  
  *     ==����Ŀ¼== 
  
  *     2.11.1  ����������ϣ�xtset ����
  *     2.11.2  ��˾��Ŀ����ȵ�ͳ��  
  *         2.11.2.1 ������ϵĻ���������xtdes ����
  *         2.11.2.2 ��¼����������̬��xtpattern ����
  *         2.11.2.3 ͳ�ƹ�˾��Ŀ��panels ����
  *     2.11.3  ���������Ĺ�˾����     
  *     2.11.4  ����Ϊƽ�����  
  *     2.11.5  �޳�IPO���������
  *     2.11.6  ��ҵ��������Ĺ�˾

   
   
*                  =��������=  
* ==================================================
*   -xtset-  -xtpattern-  -panels-  -xtbalance-
*   -panelthin-  -enlarge-  -paverage-  -center-
* ================================================== 



*__________________________________
*-2.11.1 ����������ϣ�xtset ���� 
  
  use xtcs.dta, clear
  browse              // code+year ���ܹ�Ψһ��ʾÿ���۲�ֵ
  xtset code year
  xtdes
  gen tl_lag = L.tl   
  
  *-˵����
  *  (1) xtset �� tsset �ȼۣ���ֻ������stata9���ϰ汾
  *  (2) ��δ��������Ϣ��repeated time values within panel����
     use xtcs.dta, clear
     replace year=2003 if year==2004   // α��һ������ظ�������
       list code year in 1/30, sepby(code)
     tsset code year                   // ����
     duplicates report code year       // ���� code-year �Ƿ���Ψһʶ������
     duplicates drop code year, force  // ɾ���ظ�����
     tsset code year                   // ��ȷ
	 xtdes
     

*______________________________
*-2.11.2  ��˾��Ŀ����ȵ�ͳ��    -xtdes-  -panels-  -xtpattern-

  *-2.11.2.1  ������ϵĻ���������xtdes ����
    use gta_sample.dta, clear
    tsset id year
    xtdes                   // Ĭ�ϣ�������9��Ƶ����ߵ���̬
    xtdes, patterns(20) 
    xtdes, p(30)
    xtdes if sicmen_str == "C", p(25)  // ����ҵ
    
  *-2.11.2.2 ��¼����������̬��xtpattern ����
    use gta_sample.dta, clear
    tsset id year 
    xtpattern , gen(pp)
    tab pp, sort
    browse id year pp
    *-Ӧ��
      drop if year<1999
      xtpattern, gen(pat)
      tab pat, sort
      keep if pat == "1111111111"  // ƽ�����ļ򵥴���ʽ
	  xtdes
    
  *-2.11.2.3  ͳ�ƹ�˾��Ŀ��panels ����
    use gta_sample.dta, clear
    tsset id year
    panels id 
	
    label list province_lab
    panels id if province==5  // �㶫���й�˾
    
	tab province              // �Թ۲�ֵΪ��λ����ͳ�� 
    panels id: tab province   // �Թ�˾Ϊ��λ����ͳ��
    
	tabstat size tl roa tobin,   ///
         format(%6.3f) c(s) stat(N mean sd p50 min max)
    panels id: tabstat size tl roa tobin, c(s) stat(N)
	     // ��һ��ͳ��ÿ��������Ӧ�Ĺ�˾��Ŀ
    
    
*____________________________
*-2.11.3  ���������Ĺ�˾����    -egen- group()
  
  use xtcs.dta, clear
  xtset code year
  tab code in 1/100            // ��˾���벻����
  egen code_123 = group(code)  // ����������ŵĹ�˾����
  list code code_123 year in 1/50, sepby(code)
  
  *-��;�������ʹ��forvalues��ѭ���������ÿ�ҹ�˾���з���
    xtdes
	gen b = .
	forvalues i=1/438{
	  qui reg tl size tang tobin if code_123==`i'
	  replace b = _b[tobin] in `i'
	}
	gen i = _n
    browse i b in 1/20
	
	
*_________________________
*-2.11.4  ����Ϊƽ�����      -xtbalance-

  use gta_sample.dta, clear
  xtdes 
  
  help xtbalance      // Given by Yu-Jun Lian
  
  xtbalance, range(2000 2008)
  xtdes

  *-ȱ©ֵ�Ĵ���miss() ѡ��
    sum id year cflow cash invt tl size
    drop if invt==.
    xtdes
  
    xtbalance, r(2000 2008) miss(cflow cash invt tl size)
    xtdes
    
    *-һ���Դ���	
    use gta_sample.dta, clear
    keep id year cflow cash invt tl size roa tobin
    xtbalance, r(2000 2008) miss(_all)  
    xtdes
    
     
*___________________________
*-2.11.5  �޳�IPO���������

  *-����ȱ�ٹ�˾IPO����ݣ������м��蹫˾�״��м�¼����ݼ�ΪIPO���
  
  *-����1������ xtdes ����ķ���ֵ �� egen ����� min() ���� 
     use GTA_sample.dta, clear
       tsset id year
       xtdes
     bysort id: egen Tmin = min(year)
       list id year Tmin in 1/50, sepby(id)
     drop if (year-Tmin==0)
       list id year Tmin in 1/50, sepby(id)
       xtdes
       
  *-����2������ʹ�ò������� _n     
     use GTA_sample.dta, clear
       tsset id year  
     gen Dyear = D.year
	   list id year Dyear in 700/900, sepby(id)  
     bysort id (year): drop if (Dyear==. & _n==1)
       list id year Dyear in 700/900, sepby(id)        


*_____________________________
*-2.11.6  ��ҵ��������Ĺ�˾

    use GTA_sample.dta, clear
    label list sicmen_lab
    
    *-��Ϊ������ҵ�������(��Ϊ������������о���)
      replace sicmen=4 if (sicmen==5 & year>2006)
      
    *-������ҵ��������Ĺ�˾
      qui tsset
      gen sic_dif = D.sicmen   // �������������˱�����Ϊ��
      bysort id: egen sic_change = sum(sic_dif) 
                               // ͳ�Ʊ���Ĵ���,�Թ�˾Ϊ��λ���б��
        order id year sicmen sic_dif sic_change
        list id year sicmen sic_dif sic_change if sic_change!=0, sepby(id)

    *-ɾ����ҵ��������Ĺ�˾
      drop if sic_change != 0  // ����������ҵ��������ֵ������0   
      
	   

	   
	   




	   
          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         ======================
          *            �ڶ���  ���ݴ���
          *         ======================
          *         2.11 ������ϵĴ���(II)  
  
*-------------------------
*-2.11  ������ϵĴ���(II)  
*-------------------------
  
  *     ==����Ŀ¼== 
            
  *     2.11.7  ���ɾ�����������β��ȱ©ֵ?
  *     2.11.8  ���������� T �����Ͽɻ�����ϵĹ�˾
  *     2.11.9  ����������� I�� ÿ�� T �걣��һ������   
  *     2.11.10 ����������� II������ P ��ƽ��ֵ���й���   
  *     2.11.11 ���ȱ©ֵ������
  *     2.11.12 �����ġ�ȥ��ֵ���ͱ�׼������ 
  *     2.11.13 ������ϴ������������  
  
  
*________________________________________
*-2.11.7  ���ɾ�����������β��ȱ©ֵ?

    *-����
      use xtmiss, clear
      list, sepby(id)
    
    *-���⣺ֻɾ����β��ȱ©ֵ���м�Ĳ�ɾ(���Բ�ȡ����������ֵ)
    
    *-S1: ɾ�����ײ���ȱ©ֵ
      bysort id (year): drop if sum(mi(x))==_n
      list, sepby(id)
      
      *-����
        use xtmiss, clear
        bysort id (year): gen n123 = _n
        gen miss = mi(x)
        bysort id: gen summis = sum(miss)  // ע�⣺�� gen�������� egen
        list, sepby(id)
        drop if n123==summis
        list
  
    *-S2: ɾ����β����ȱ©ֵ
      use xtmiss, clear
      gen nyear = -year
      list, sepby(id)
      bysort id (nyear): drop if sum(mi(x))==_n
      list, sepby(id)
      tsset id year
      list, sepby(id)
      
    *-���ܣ�
      use xtmiss, clear
      bysort id (year): drop if sum(mi(x))==_n
      gsort id -year    // ע����к���һ�еı仯
      bysort id: drop if sum(mi(x))==_n 
      qui tsset id year
      list, sepby(id)
    
    *-egen �����ṩ�˸�Ϊֱ�ӵĽ���취
      use xtmiss, clear
      by id, sort: egen firstnonmis = min(cond(!missing(x), year, .))
      by id:       egen lastnonmis  = max(cond(!missing(x), year, .))
      drop if (year<firstnonmis) | (year>lastnonmis)
      list, sepby(id)
      
      *-����
        help cond()
        * cond(x, a, b)
        *   �� x=true,  ���� a��
        *   �� x=false, ���� b��
            dis cond(1, 5, -5)
            dis cond(0, 5, -5)
        * !missing(x)
        *   �� x != ., ���� 1
        *   �� x == ., ���� 0
            dis !missing(.)
            dis !missing(9)
      
	  *-�ع�
        use xtmiss, clear
        by id, sort: gen condyear = cond(!missing(x), year, .)
		list, sepby(id)
		by id, sort: egen firstnonmis = min(condyear)
		by id, sort: egen lastnonmis  = max(condyear)
		list, sepby(id)
        drop if (year<firstnonmis) | (year>lastnonmis)
        list, sepby(id)			
 
 
 
*_____________________________________________
*-2.11.8  ���������� T �����Ͽɻ�����ϵĹ�˾

  *-���⣺����Щ�����У���Ҫ��ִ�������Ҫ���칫˾��Ϊ��������
  *       ��ʱ����Ҫɸѡ�����������й۲�ֵ�Ĺ�˾
  
  *-ʾ�����������������������Ĺ�˾
  
    use gta_sample.dta, clear
    keep id year tl cash tobin size
    drop if tl>1
    tsset id year
    xtdes 
    xtpattern, gen(pp)          // ��¼ÿ�ҹ�˾��������̬
    tab pp
    *browse
    
    gen p6 = strpos(pp, "111111")
    sort p6
    *browse
    drop if p6==0               // �������������������ϵĹ�˾
    tab pp
    save xtcontinue_temp, replace
    
    *-���ִ���������ִ���ʽ��
    * Q1�����ɾ������"����"�򲿷��������ȱʧ�Ĺ�˾��
    *     �� "....1111111........" �� "....11111111..11111"
    * Q2�����ɾ��ĳ���������Ժ���������ݣ�
    *     �� "....11111111..11111" --> "....11111111......."
    *     �� "...1111111111111.1." --> "...1111111111111..."
    * ע����һ�ַ�ʽ�����ڱ��������ܶ������
    
    *-S1��ȥ��"����"�򲿷��������ȱʧ�Ĺ�˾
      use xtcontinue_temp, clear
      xtdes      // 140 ��
      tab pp
      gen pbreak1 = strpos(pp,"1.")
      order id year pp p6 pbreak1
      browse
      drop if pbreak>0
      tab pp, sort
      xtdes       // 123 ��
      *-˵������ɲ��� strmatch()��indexnot() ��������������� 
          
    *-S2: ���ɾ��ĳ���������Ժ����������
      use xtcontinue_temp, clear
      tab pp
      *-������(���ڽ��Ͷ���)
      keep if   pp=="........11111111..1"  ///
              | pp=="...1111111111111.1."  ///
              | pp=="......1111111111.11"  ///
              | pp==".111111111111111111"
      keep id year pp
      qui tsset id year
      gen Dyear = D.year
      order id year Dyear
      list, sepby(id)     // ��һ���ȱ©ֵ���������ġ���ϡ�
      bysort id (year): replace Dyear=1 if _n==1
      list, sepby(id) 
      bysort id: egen firstyear_mis = min(cond(missing(Dyear), year, .))
      bysort id: drop if year>=firstyear_mis
      xtdes
      
      *--------------------------------------------------------------
      *-��ϰ1������԰� keep ��ͷ�����������ɾ���������������д���   

      *--------------------------------------------------------------            
      *-��ϰ2��ʹ�� gta_sample.dta ������Ҫ���������ݷ�������������
      *  (1) ������������
      *  (2) ɾ����ծ�ʴ���1�Ĺ۲�ֵ
      *  (3) �����Ƿ�ƽ����壬��ʱ���������� 2003-2008 �� 
      
      *-��𷽰� -I-
        use gta_sample.dta, clear
        tsset id year
        drop if tl>1        // ����ڶ�������
        drop if year<1997   // �����������������
        xtpattern , gen(pp)
           tab pp
        gen Dyear = D.year
        bysort id: replace Dyear=1 if _n==1
        bysort id: egen miss = max(cond(Dyear==.), 1, 0)  
                   // ��ĳ�ҹ�˾���ڶϵ㣬��miss������������ȶ���ʾΪ1
        drop if miss==1
           tab pp
        bysort id: egen Tmin = min(year)   // ÿ�ҹ�˾����С���
        bysort id: egen Tmax = max(year)   // ÿ�ҹ�˾��������
        drop if Tmin>2003   // ������ĸ�����
        drop if Tmax<2008   // ����������ĸ�����
		xtdes
     
     *-��𷽰� -II-   
     *-˼·��ͳ��ÿ����˾�������Ⱥ���С���֮�
     *       Ȼ�����ù�˾���ж�����Ĺ۲�ֵ��
     *       �����߲�һ�£����޳��ù�˾
       use gta_sample.dta, clear
       tsset id year
       drop if tl>1
       drop if year<1997
       xtpattern , gen(pp)
       cap dropvars Tmin Tmax Tsum Tdif Tmis
       bysort id: egen Tmin = min(year)
       gen Tmax = 2008
       bysort id: egen Tsum = count(year)  
	                           // ͳ��ÿ�ҹ�˾ʵ���ж�����Ĺ۲�ֵ
       gen Tdif = Tmax-Tmin+1  // ������������Ӧ������ô����Ĺ۲�ֵ  
       gen Tmis = Tsum-Tdif
       drop if Tmis != 0       // ɾ�������������Ĺ�˾
       drop if Tmin>2003       // ɾ��2003���Ժ����еĹ�˾
       order id year pp Tmin Tmax Tsum Tdif Tmis
       tab pp
      *--------------------------------------------------------------    
    


*_______________________________________________
*-2.11.9 ����������� I��ÿ�� T �걣��һ������      -panelthin-

  *-Ŀ�ģ��������뿼��ĳЩ�����ĳ��ڱ仯��
  *       ��Ҫ����ʱ����������
                
  *-�����÷�
    use GTA_sample.dta, clear
    tsset id year
    xtdes
    list id year in 1/50, sepby(id) 
    panelthin, min(3) gen(OK)     // ÿ�� 3 �걣��һ������ 
    xtdes if OK, p(30)
    list id year OK in 1/50, sepby(id)
    list id year if OK in 1/50, sepby(id)
   
  *-ʾ�����ֽ����Ȩ�����۵ļ���
    use GTA_sample.dta, clear
    tsset id year  
    xtabond cash size tang roa tobin  // ��̬���
    est store m_0
    panelthin, min(2) gen(OK)          // ÿ����������һ��
    xtabond cash size tang roa tobin if OK
    est store m_thin
    esttab m_0 m_thin, mtitle(m_0 m_thin) stat(N) // ����Ա�
    *-���ͺ�������
    * (1) �� L.cash ��ϵ��Ϊ b���� (1-b) ��ʾ�������ٶȡ���
    * (2) �����������������һ�����Ϊ���쵥λ��������ٶ�Ϊ 0.453
    *     �����������Ϊ���쵥λ��������ٶ�Ϊ 0.809
    *     ����ζ�ţ���ʱ���Ƚϳ�ʱ����˾��������Ŀ��ֵ����
    *     �ӱ�����������˾�����Ͽ�������������������ɵ�����
    * (3) ���ִ������������Ϻ��¶������и�Ϊ���ã�
    *     ���������ϣ�min(5) ���ܱȽϳ���
    *     ���������ϣ�min(3) �� min(5) ��Ƚϳ���
          


*__________________________________________________
*-2.11.10 ����������� II������ P ��ƽ��ֵ���й���   -paverage-

  *-Ŀ�ģ��˷��������ںͺ���ƫ���Ӱ�� 
  *-������ƽ���������
  
  *-�����÷���
    use xtcs, clear
    drop if year==1998
    xtdes    // ƽ�����
    paverage tl-tobin, p(2) ind(code) yr(year)
    xtdes
    
    
  *-ʾ�������ִ���ʽ����ĶԱ�  
     use GTA_sample.dta, clear
     tsset id year 
    
    *-�������������ı���
      keep id year tl tang roa tobin
       
    *-ɾ��ȱ©ֵ������Ϊƽ�����
      xtbalance, range(1999 2008) miss(tl tang roa tobin)
      xtreg tl tang roa tobin, fe
      est store m_0
      
    *-���� 2 ��ƽ��ֵ��������
      preserve
        paverage tl tang roa tobin, p(2) ind(id) yr(year)
        xtreg tl tang roa tobin, fe
        est store m_av2
      restore
      
    *-���� 5 ��ƽ��ֵ��������
      preserve
        paverage tl tang roa tobin, p(5) ind(id) yr(year)
        xtreg tl tang roa tobin, fe
        est store m_av5
      restore      
      
    *-����Ա�
      esttab m_0 m_av2 m_av5,    ///
	         mtitle(m_0 m_av2 m_av5) stat(N r2_w r2_o)
  
  

*___________________________
*-2.11.11  ���ȱ©ֵ������

  *-���� I ��
    *-�������һ���±�����ֻҪ��ҹ�˾�������Ź�����һ�ι����ͱ��Ϊ 1
      use GTA_sample.dta, clear
      tsset id year 
      list id year div_yes in 100/130, sepby(id)
  
    *-˼·����ĳ�ҹ�˾�������Ź���������ù�˾�� div_yes ��ֵ��Ϊ��
      bysort id: egen div_mean = mean(div_yes)
      gen div_s = 0
      replace div_s = 1 if div_mean != 0
      list id year div_yes div_s in 100/130, sepby(id)
      
      
  *-���� II ��
    *-��������ֻ��2005�����ҵ�������ݣ�
    *     ��������Ա������ȶ�������һ��Ϣ��
    *-�������й�˾����ҵ���������������ڲ��������
    
    *-S1��α��һ������
      use GTA_sample.dta, clear
      tsset id year
      drop if year<2000
      keep id year sicda
      replace sicda = . if year!=2005
      list in 1/100, sepby(id)
      clonevar sicda_s1 = sicda  // ��¡���ݣ��Ա�����
      clonevar sicda_s2 = sicda
      
    *-S2��˼·�����ǿ��Զ����Ψһ������������
      sort id sicda_s1
         list in 1/70, sepby(id)
      bysort id: replace sicda_s1 = sicda_s1[1] if _n>1
         list in 1/70, sepby(id)
      
    *-S3��������� -enlarge-
      enlarge sicda_s2, by(id)
         list in 1/70, sepby(id)
      

*______________________________________
*-2.11.12  �����ġ�ȥ��ֵ���ͱ�׼������ 

   help center  // �ⲿ����
   use xtcs.dta, clear
   bysort code: center tl fr size ndts tang tobin, prefix(c_)
   
   *-Ӧ�ã�����FEģ��
     reg c_tl c_fr-c_tobin
       est store ols_fe
     xtreg tl fr size ndts tang tobin, fe
       est store fe
       esttab ols_fe fe, nogap compress

   *-˵�����������пɽ��б�׼����quasi-demeaning��������İ����ļ�
	  
	  
*_________________________________
*-2.11.13  ������ϴ������������

  *-[s1] How can I identify first and last occurrences 
  *      systematically in panel data? 
  *  http://www.stata.com/support/faqs/data/firstoccur.html
  *-[s2] How can I generate a variable relating panel data 
  *      to a reference panel? 
  *  http://www.stata.com/support/faqs/stat/panelref.html


 
	   
	   
	   
	   
	   
	   

          *     =====================================
          *              ����������STATAӦ�� 
          *     =====================================
                    
          *        �����ˣ������ ��ʿ

          *        ��  λ����ɽ��ѧ����ѧԺ����ϵ
          *        ��  ��: arlionn@163.com
          *        ��  ҳ: http://blog.cnfol.com/arlion 

          *             ::��һ����::
          *              Stata ����
          *         ======================
          *            �ڶ���  ���ݴ���
          *         ======================
          *         2.12 ���ݵĲ���ͱȽ�
		  
   cd `c(sysdir_personal)'Net_course_A\A2_data 
   
*----------------------
*-2.12 ���ݵĲ���ͱȽ�
*----------------------
  
  *     ==����Ŀ¼== 
  
  *     2.12.1 �������
  *         2.12.1.1 ����  
  *         2.12.1.2 ����ȷ��   
  *         2.12.1.3 �Ƚϱ����Ĵ�С
  *     2.12.2 ������������  
  *         2.12.2.1 �����������ݵĹ۲�ֵ�Ƿ�һ�� 
  *         2.12.2.2 �����������ݵı����Ƿ�һ��   

  
*                  =��������=  
* ==================================================
*   -assert-  -count-  -compare-  -cf-  -cfvar-
* ================================================== 


*___________________
*-2.12.1 �������        -assert-  -count-  -compare-


  *-2.12.1.1 ����               -count-
  
    sysuse nlsw88, clear
    count if (hours<10 | hours>70)
    count if race >=2
    count if hours == .
      list wage race if hours == .
	  

  *-2.12.1.2 ����ȷ��          -assert-

    sysuse nlsw88, clear
	sum wage age
    assert  wage>0
    assert  wage<0
    assert  wage<20
	  count if wage<20
    assert  age<40
	  count if age<40
    assert  (hours<10 | hours>70)
	  count (hours<10 | hours>70)
      list hours if (hours<10 | hours>70)


  *-2.12.1.3 �Ƚϱ����Ĵ�С      -compare-

    sysuse sp500.dta, clear
    compare open close


	
*______________________
*-2.12.2 ������������  
	

  *-2.12.2.1 �����������ݵĹ۲�ֵ�Ƿ�һ��  -cf- 

  clear
  input id str8 name  age ht  wt income
        11      john  23  68 145 23000
        12   charlie  25  72 178 45000
        13     sally  21  64 135 12000
        4       mike  34  70 156  5600
        43      paul  30  73 189 15600
  end
  sort id
  save person1, replace

  clear
  input id str8 name  age ht  wt income
        11      john  28  68 145 23000
        12   charles  25  52 178 45000
        13     sally  21  64  .  12000
        4     michael 34  70 156  5600
        43       Paul 30  73 189  5600
  end
  sort id
  save person2, replace
  
  use person1, clear
  cf _all using person2
  cf _all using person2, verbose      // ��ϸ����
  cf _all using person2, verbose all  // �г����в�һ�µ�cases
  

  *-2.12.2.2 �����������ݵı����Ƿ�һ��     -cfvars-  
  
    sysuse xtcs, clear
    drop tl
    cfvars xtcs.dta
    ret list


	
	
	
	