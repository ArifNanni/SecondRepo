public class AccountBeforeHandler
{
/**********************************************************
Class Name: AccountBeforeHandler
Created By: Shashi Ranjan
Created Date: 30/May/2017
Description: Handler class for the AccountBefore
             trigger on the Account object.
             Created as a part of TKT-000088.
Related Test Class: AccountBeforeTest

Modification Log:
* Developer            Date                Description
* ----------------------------------------------------------

***********************************************************

public class AccountBeforeHandler extends TriggerAction{

    public list<Account> lst_OldAccount = (List<Account>)trigger.old;
    public list<Account> lst_Account = new list<Account>();    
    
    // All TriggerAction triggers will use exactly this constructor. It never needs modification.
    public AccountBeforeHandler(){
         super();
    }
    
    /*All filtering logic should be done in the shouldRun method, and the return should always
    be some version of !COLLECTIONNAME.isEmpty().
    public override boolean shouldRun(){
        lst_Account = lst_OldAccount;
      
        return !lst_Account.isEmpty();
    }
    
    /* All the actual work of the class needs to happen here, including the query.
    If there's a decision about what to update that can't be made until after you query something,
    put it in here, after the query. ShouldRun should never itself contain a query.
    public override void doAction(){
        AccountBeforeHelper helperObject = new AccountBeforeHelper();
        //calling the method to delete the related Opportunity Information
        helperObject.OpportunityInformation_Delete(lst_Account);         
    }   
}
/*********************************************************************************
Class Name: AccountBeforeHelper
Created By: Shashi Ranjan
Created Date: 30/May/2017
Description: Helper class for the AccountBefore
             trigger on the Account object.
             Created as a part of TKT-000088.
Related Test Class: AccountBeforeTest

Modification Log:
* Developer                      Date                         Description
* -------------------------------------------------------------------------------

*********************************************************************************
public class AccountBeforeHelper{

    //for Deletion of Opporunity Information
    public void opportunityInformation_Delete(List<Account>  lst_Account){
    
        List<Opportunity_Information__c> lst_OppInfotoDelete = new List<Opportunity_Information__c>();
        Set<Id> setAccountId = new Set<Id>();
        
        //getting all the accounts to be deleted in a set
        for(Account accObject : lst_Account){
            setAccountId.add(accObject.Id);    
        }
        
        //creating list of Opportunity Information records to be deleted
        if(!setAccountId.isEmpty()){
            lst_OppInfotoDelete = [SELECT Id, Account__c FROM Opportunity_Information__c WHERE Account__c IN : setAccountId];
        }
        
        //deleting the list of Opportunity Information records
        if(!lst_OppInfotoDelete.isEmpty()){
            delete lst_OppInfotoDelete;
        }
    }  
}

@isTest()
public class AccountBeforeTest{
    
    public static Account accountObject;
    public static Opportunity_Information__c oppInfoObject;
    
    //setting up the test data
    @isTest()
    public static void setUPData(){
        
        //account
        accountObject = new Account();
        accountObject.Name = 'TestAcc';
        accountObject.BillingCity = 'TestCity';
        accountObject.BillingState = 'Andhra Pradesh';
        accountObject.BillingCountry = 'India';
        accountObject.ShippingCity = 'TestCity';
        accountObject.ShippingState = 'Andhra Pradesh';
        accountObject.ShippingCountry = 'India';        
        insert accountObject;
        
        //opportunity information
        oppInfoObject = new Opportunity_Information__c();
        oppInfoObject.Account__c = accountObject.Id;
        insert oppInfoObject;
    }
    
    //checking for deletion of Opportunity Information on Account deletion 
    @isTest()
    public static void accountDeletion(){
        //creating all the test data
        setUPData();
        
        Test.startTest();
            //deleting the Account record
            delete accountObject;
            //checking if the Opportunity Information also got deleted or not
            Opportunity_Information__c deletedOppInfo = [SELECT Id, IsDeleted FROM Opportunity_Information__c WHERE Id = : oppInfoObject.Id ALL ROWS];
            System.assertEquals(deletedOppInfo.IsDeleted, TRUE);
        Test.stopTest();
    }     
}*/

}