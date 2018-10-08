@isTest
private class AccountRoleAssignments_Test{
  static testMethod void test_accountPrimaryCheck_UseCase1(){
    AccountRoleAssignments obj01 = new AccountRoleAssignments();
    AccountRoleAssignments.accountPrimaryCheck(new List<Siemens_Account_Role_Assignment__c>());
  }
  static testMethod void test_accountRoleCheck_UseCase1(){
    AccountRoleAssignments obj01 = new AccountRoleAssignments();
    AccountRoleAssignments.accountRoleCheck(new List<Siemens_Account_Role_Assignment__c>());
  }
}