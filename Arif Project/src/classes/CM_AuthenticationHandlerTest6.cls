@isTest
public class CM_AuthenticationHandlerTest6{
@testSetup 
    static void setup() 
    {
     user us = [Select id from User limit 1];
     Account accc= new Account();
     accc.name = 'Arif';
     insert accc;
      test.starttest();
      
       for(integer i = 0 ;i<90;i++)
       {
       List<Account> a = [Select id from Account limit 1];
       }
      test.stoptest();
       for(integer i = 0 ;i<90;i++)
       {
      List<Account> a = [Select id from Account limit 1];
       }
      
    
    }
    
    private static testmethod void tesRestOfTheMedthods()
    {
       test.starttest();
       
       for(integer i = 0 ;i<90;i++)
       {
      List<Account> a = [Select id from Account limit 1];
       }
      test.stoptest();
      
    }
  }