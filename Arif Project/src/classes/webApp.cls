Public class webApp
{
 public webApp()
 {
  innerClass a =new innerClass();
  a.i = 9;
  String str = ''+a;
  Object b = (Object)str;
  //webApp.innerClass g = (webApp.innerClass)b;
  
  System.debug('++++'+b);
 
 } 
 Public class innerClass
  {
   Public integer i{get; set;}
  }
}