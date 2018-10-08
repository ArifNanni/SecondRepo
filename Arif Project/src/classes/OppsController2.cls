public class OppsController2 {

public Integer ab{get{System.debug('ggggggetMethod of AB');ab=ab+1;return ab;} set;}
public Integer abc{get{System.debug('ggggggetMethod of ABC');abc=abc+1;return abc;}set;}
 
  public OppsController2()
        {
           system.debug('----constuctor');
           ab = 3;
           abc = 6;
            
        }  
             
    
  public void setAbc(integer a)
    
    {
      abc=abc+76;
      System.debug('ssssssetMethod of ABC'+abc);
      
     
      }
      public Integer getabc()
    
    {  
        
      System.debug('ggggggetMethod of ABC'+abc);
       return abc;
      }
         
      
      public pagereference save() {
       ab=ab + 99;
       abc =abc+ 88;
               return null;
    }  
}