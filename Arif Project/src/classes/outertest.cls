public virtual  class outertest
{

 Integer a =0;
 protected integer b=1;
 public integer c=2;


 class innertest
{
 integer a1=0;
 protected integer b1=1;
  public innertest()
  {
   outertest b = new outertest();
   SYstem.debug('+++'+b.a);
  }

}
}