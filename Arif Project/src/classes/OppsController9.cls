public class OppsController9 {

public Integer var1{get;set;}
public Integer var2{get;set;}
public integer var3{get;set;}
public integer var4;

public OppsController9()
    {
       System.debug('++ENTRYHELLYconstructor var1 '+var1 +'var2 '+var2);
       System.debug('++var3'+var3);
       System.debug('++var4'+var4);
       this.var1 = 1111;
       this.var2 = 22;
       this.var3 = 55;
             System.debug('++EXITconstructor var1 '+var1 +'var2 '+var2);
        
    } 


     public pagereference save() {
     System.debug('++ENTRYconstructor var1 '+var1 +'var2 '+var2);
       System.debug('++var3'+var3);
     var1 = 88;
     var2=99;
    
    return null;
      }    
    }