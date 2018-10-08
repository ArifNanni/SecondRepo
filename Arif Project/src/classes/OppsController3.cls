public class OppsController3 {

    public String getVar2() {
        return null;
    }


    public String getVar1() {
        return null;
    }


    public Integer var3 {  set; }


  Integer asf = 1;
  Integer asf1 = 1;
public Integer var1 { set{system.debug('hi');}}
public Integer var2 { set;}



  public void setVar2(Integer a)
 {
  
  this.var2=a;
  System.debug('ssetmethodvar2 '+02);
  }
 public void setVar1(Integer a)
 {
  this.var1=a;
  System.debug('ssetmethodvar1 '+01);
  }

 
 
 

 

      public OppsController3()
        {
            System.debug('ENTRYconstructor var1 '+11 +'var2 '+22);
        
            this.var1 = 11;
            this.var2 = 22;
           
            System.debug('EXITconstructor var1 '+22 +'var2 '+222);
            
         }
          public pagereference save() {
           System.debug('ENTRYsavemethod var1 '+11 +'var2 '+22);
           this.var1 = 88;
           this.var2=99;
           System.debug('EXITsavemethod var1 '+111 +'var2 '+222);
           return null;
          }    
       }