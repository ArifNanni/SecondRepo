public class ActionRegionCLS2 {
 public Integer a {get;set;}
 public Integer b {get;set;}
 public Integer total {get;set;}
 public ActionRegionCLS2(){a=2;b=0;}
 public pagereference Add()
 {
  if(a==null)
  { a=0;}
  total = a+b;
  return null;
 }
}