
program define asum2
  version 8.0
  args var     

  local n = wordcount("`var'")
  tempname aa  /*������ʱ�Ծ���*/
  mat `aa' = J(`n',4,0)
  local i = 1
  foreach v of varlist `var'{
    qui sum `v'
    mat `aa'[`i++',1] = (r(mean),r(min),r(max),`=r(max)-r(min)')
  }
  mat colnames `aa' = ƽ��ֵ ��Сֵ ���ֵ ȡֵ��Χ
  mat rownames `aa' = `var'
  * ��ʾ���
  dis _n in g _dup(20) "=" in y "�ҵ�ͳ�ƽ��" in g _dup(20) "=" 
  mat list `aa'

end


