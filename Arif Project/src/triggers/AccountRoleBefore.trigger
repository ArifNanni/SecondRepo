trigger AccountRoleBefore on Siemens_Account_Role_Assignment__c (before insert,before update) 
{
           If( Trigger.isInsert ||  Trigger.isUpdate)
          {
             AccountRoleAssignments.accountPrimaryCheck(Trigger.New);

             AccountRoleAssignments.accountRoleCheck(Trigger.New);
             
          }

}