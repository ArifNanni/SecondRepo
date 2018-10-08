public class OppsController4 {

public Integer var1{get{var1=111 ; System.debug('getmethodvar1 '+var1); return var1;} set;}
public Integer var2{get{System.debug('getmethodvar2 '+var2);return var2;} set;}

 public OppsController4()
        {
      System.debug('ENTRYconstructor var1 '+var1 +'var2 '+var2);
           this.var1 = 11;
           this.var2 = 22;
           
            System.debug('EXITconstructor var1 '+var1 +'var2 '+var2);
            
        }
         public pagereference save() {
       var1 = 88;
       var2=99;
        return null;
    }    
        }