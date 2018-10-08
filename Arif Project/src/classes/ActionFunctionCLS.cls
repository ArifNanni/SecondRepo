public class ActionFunctionCLS {
    public String abcd { get; set; }
   public String abc { get; set; }
    public Integer abc1 { get; set; }
  public Account actObj{get;set;}
  
   PageReference prf= null;
    public ActionFunctionCLS(){
      actObj = new Account();
      abcd=abcd+'a';
     
      abc1=0;
      system.debug('-----A');
    }
 
   
    public void Saverec(){
    abcd = abcd + 'a';
    
    system.debug('-----'+abcd);
   if(actobj.Name !=''){
   system.debug('+++++'+actobj.Name);
    upsert actobj;
   
   } 
   //return null;
    }
    public Pagereference Saverec1(){
    system.debug('*****');
    abc1=abc1+1;
    
    return null;
    }

}