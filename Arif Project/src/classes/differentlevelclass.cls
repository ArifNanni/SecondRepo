public class differentlevelclass {

    public String a1 { get; set; }

  public integer a{private get{System.debug('*STANDARDGETTER*');return a;}   private set{System.debug('*STANDARDSETTER*');a=value;} }
  public differentlevelclass ()
  {
    System.debug('*FROMCONSTRUCTOR*');
    a=8;
    a1='9';
  }

  Public integer getA()
  {
    System.debug('*CUSTOMGETTER*');
    return a;
  }
   Public void setA(Integer f)
  {
    System.debug('*CUSTOMSETTER*');
   a=f;
  } 

  Public PageReference save()
  {
    a = a+10;
    return null;
  }
}