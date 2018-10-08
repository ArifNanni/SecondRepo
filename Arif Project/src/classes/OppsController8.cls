public class OppsController8 {

public Integer var1;
//public Integer var1{get;set;}
public Integer var2{get{var2=8;if(var2==null){var2=0;var2=var2+1;}System.debug('getmethodvar2 '+var2);return var2;} set{var2 = 9;System.debug('aas'+var2);}}

public Integer getvar1()
{
  // var1 = 98765;
   return var1;
}

public void setvar1(integer var)
{
 //var = null;
  var1 = var;
}

 public OppsController8()
        {
      System.debug('ENTRYconstructor var1 '+var1 +'var2 '+var2);
           this.var1 = 11;
           this.var2 = 22;
           
            System.debug('EXITconstructor var1 '+var1 +'var2 '+var2);
            
        }
         public pagereference save() {
         var1 = var1 + 1;
       var1 = 88;
       var2=99;
        return null;
    }    
        }