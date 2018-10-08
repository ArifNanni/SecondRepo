global with sharing class AccountRemoter1 {

    public String accountName { get; set; }
    public static List<Account> account { get; set; }
    public String enteredText1 {get; set;}
    public String enteredText2 {get; set;}
    public AccountRemoter1() {} // empty constructor
    
    @RemoteAction
    global static list<Account> getAccount(String accountName) {
         
        account = [SELECT Id, Name, AccountNumber,Phone, Type, NumberOfEmployees 
                   FROM Account WHERE Name = :accountName limit 10];
       //NAARNINFI         
        return account;
    }
    
    public void echoVal()
    {
    //val = 'You have entered : 1 - '+enteredText1+' 2 -'+enteredText2;
  
    Map<String,Object> mapObj = (Map<String, Object>)
      JSON.deserializeUntyped(enteredText1);
     System.debug('*****'+enteredText1+'*******'+mapObj.get('Id'));    
      Account acc = new Account();
      acc.id = (ID)mapObj.get('Id');
      if(enteredText2 != null && enteredText2 != '')
      {
      acc.NumberOfEmployees = Integer.valueof(enteredText2) ;
      }
      else
      {
       acc.NumberOfEmployees = null;
      }
      acc.PTO__c = 'PTO';
      
      acc.SLASerialNumber__c = '1234';
      update acc;

    }
}