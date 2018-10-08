@isTest
private class AccountRoleAssignments_Test1{
  @testSetup
  static void setupTestData(){
    test.startTest();
    tgen.TestData.selectededFields.put('Account',new Set<string>{'Name'});
    //TestData.CreateData(ObjectName,Cascade,useAlreadyCreatedObj)
    Account account_Obj = (Account)tgen.TestData.CreateData('Account', false,false);
    Insert account_Obj; 
    tgen.TestData.createdObjMap.put('Account',account_Obj.id);
    test.stopTest();
  }
  static testMethod void test_accountPrimaryCheck_UseCase1(){
    List<Account> account_Obj  =  [SELECT Name from Account];
    System.assertEquals(true,account_Obj.size()>0);
    AccountRoleAssignments obj01 = new AccountRoleAssignments();
    AccountRoleAssignments.accountPrimaryCheck(new List<Siemens_Account_Role_Assignment__c>());
  }
  static testMethod void test_accountRoleCheck_UseCase1(){
    List<Account> account_Obj  =  [SELECT Name from Account];
    System.assertEquals(true,account_Obj.size()>0);
    AccountRoleAssignments obj01 = new AccountRoleAssignments();
    AccountRoleAssignments.accountRoleCheck(new List<Siemens_Account_Role_Assignment__c>());
  }
}