@isTest
public class CM_AuthenticationHandlerTest{

 public static id idf ;

 //@testSetup 
    static void setup() 
    {
 //   test.startTest();
     Account c = new Account();
     c.name = 'acc';
     insert c;
     CM_AuthenticationHandlerTest.idf=c.id;
      System.debug('++++OP'+CM_AuthenticationHandlerTest.idf);
     for(integer i =0 ; i<=19 ; i++)
     {
       Account acc = [Select id from Account limit 1];
     }
    //  test.stopTest();
     
     
    }
    
  private static testmethod void tesRestOfTheMedthods()
    {
   // test.startTest();
   setup();
    System.debug('++++'+CM_AuthenticationHandlerTest.idf);
     for(integer i =0 ; i<=19 ; i++)
     {
       Account acc = [Select id from Account where  id =: CM_AuthenticationHandlerTest.idf limit 1];
     }
  //  test.stopTest();
    test.startTest();
     for(integer i =0 ; i<=99 ; i++)
     {
       Account acc = [Select id from Account limit 1];
     }
     test.stopTest();
    
      
    }  

}