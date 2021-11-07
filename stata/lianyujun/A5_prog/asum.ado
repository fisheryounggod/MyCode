*! Author:  Roger Federer
*! Date:    2010.10.10
*! Version: 1.0.0
  
   cap program drop asum
   program define asum, rclass
   version 8.0
   syntax varname     // ������ 

     local n = wordcount("`varlist'")
     tempname aa            // ������ʱ�Ծ��� 
     mat `aa' = J(`n',4,0)
     local i = 1
     foreach v of varlist `varlist'{
       qui sum `v'
       local range = r(max)-r(min)
       mat `aa'[`i++',1] = (r(mean), r(min), r(max), `range')
     }
     mat colnames `aa' = ƽ��ֵ ��Сֵ ���ֵ ȡֵ��Χ
     mat rownames `aa' = `varlist'
     
   * ��ʾ���
     dis _n in g _dup(20) "=" in y "�ҵ�ͳ�ƽ��" in g _dup(20) "=" 
     mat list `aa', noheader
     
   * ����ֵ
     *return clear    // ��� -sum- ����ķ���ֵ
     return scalar range = `range'
     return matrix r     = `aa'
     
   end

