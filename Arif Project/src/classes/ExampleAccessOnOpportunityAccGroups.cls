Public Class ExampleAccessOnOpportunityAccGroups
{
/*
    AccessOnOpportunityAccGroupsHandler:
    /**********************************************************
Class Name: AccessOnOpportunityAccGroupsHandler
Created By: Shashi Ranjan
Created Date: 24/May/2017
Description: Handler class for the AccessOnOpportunityAccGroups
             trigger on the Industry Team object.
Related Test Class: AccessOnOpportunityAccGroupsTest

Modification Log:
* Developer            Date                Description
* ----------------------------------------------------------

***********************************************************

public class AccessOnOpportunityAccGroupsHandler extends TriggerAction{

    public list<Industry_Team__c> lst_NewIndTeam = (List<Industry_Team__c>)trigger.new;
    public list<Industry_Team__c> lst_OldIndTeam = (List<Industry_Team__c>)trigger.old;
    public list<Industry_Team__c> lst_IndTeam = new list<Industry_Team__c>();
    public list<Industry_Team__c> lst_IndTeam_Update = new list<Industry_Team__c>();    
    
    // All TriggerAction triggers will use exactly this constructor. It never needs modification.
    public AccessOnOpportunityAccGroupsHandler(){
         super();
    }
    
    /*All filtering logic should be done in the shouldRun method, and the return should always
    be some version of !COLLECTIONNAME.isEmpty().*
    public override boolean shouldRun(){
        if(this.isInsert()){
            lst_IndTeam = lst_NewIndTeam;    
        }
        if(this.isDelete()){
            lst_IndTeam = lst_OldIndTeam;
        }
        if(this.isUpdate()){
            lst_IndTeam = lst_NewIndTeam;
            lst_IndTeam_Update = lst_OldIndTeam;
        }
        return !lst_IndTeam.isEmpty();
    }
    
    /* All the actual work of the class needs to happen here, including the query.
    If there's a decision about what to update that can't be made until after you query something,
    put it in here, after the query. ShouldRun should never itself contain a query.*
    public override void doAction(){
        AccessOnOpportunityAccGroupsHelper helperObject = new AccessOnOpportunityAccGroupsHelper();
        //checing for dupicate users in Industry Team while Insertion
        if(this.isInsert() && this.isBefore()){
            helperObject.AccessOnOpportunityAccGroupsHelper_Duplicate(lst_IndTeam);    
        }
        if(this.isInsert() && this.isAfter()){
            helperObject.AccessOnOpportunityAccGroupsHelper_Insert(lst_IndTeam);
        }
        //checing for dupicate users in Industry Team while Updation
        if(this.isUpdate() && this.isBefore()){
            helperObject.AccessOnOpportunityAccGroupsHelper_Duplicate(lst_IndTeam);
        }
        //sending both old and new values for deleting and updating at the same time
        if(this.isUpdate() && this.isAfter()){
            helperObject.AccessOnOpportunityAccGroupsHelper_Update(lst_IndTeam_Update, lst_IndTeam);
        }
        if(this.isDelete()){
            helperObject.AccessOnOpportunityAccGroupsHelper_Delete(lst_IndTeam);
        }
         
    }   
}


AccessOnOpportunityAccGroupsHelper:
/*********************************************************************************
Class Name: AccessOnOpportunityAccGroupsHelper
Created By: Shashi Ranjan
Created Date: 24/May/2017
Description: Helper class for the AccessOnOpportunityAccGroups
             trigger on the Industry Team object.
Related Test Class: AccessOnOpportunityAccGroupsTest

Modification Log:
* Developer                      Date                         Description
* -------------------------------------------------------------------------------

*********************************************************************************
public class AccessOnOpportunityAccGroupsHelper{
    
    ApexSharingUtilityClass sharingutilObject = new ApexSharingUtilityClass();
    
    public Set<Id> set_Industry = new Set<Id>();
    public Set<Id> set_Usrs  = new Set<Id>();
    public List<Industry_Team__c> industryTmExisting = new List<Industry_Team__c>();
    public List<Account_Group__c> listaccgrp = new List<Account_Group__c>();
    public Map<Id, Set<Id>> map_IndustryWithactgrpSet = new Map<Id, Set<Id>>();
    public Set<Id> set_accountgroup = new Set<Id>();
    public Map<Id, Set<Id>> map_acctgrpWithSetOpp = new Map<Id,Set<Id>>();
    public Map<Id, Set<Id>> mapIndustryWithUserSet = new Map<Id, Set<Id>>();
    public Map<Id, Set<Id>> map_acctgrpidWithuseridSet = new Map<Id, Set<Id>>();
    public Map<Id, Set<Id>> map_userIdWithOpportuntySet = new Map<Id, Set<Id>>(); 
    
    //resetting the values after deleting the existing shares and before inserting new shares(in update case)
    public void reset(){
        set_Industry = new Set<Id>();
        set_Usrs  = new Set<Id>();
        industryTmExisting = new List<Industry_Team__c>();
        listaccgrp = new List<Account_Group__c>();
        map_IndustryWithactgrpSet = new Map<Id, Set<Id>>();
        set_accountgroup = new Set<Id>();
        map_acctgrpWithSetOpp = new Map<Id,Set<Id>>();
        mapIndustryWithUserSet = new Map<Id, Set<Id>>();
        map_acctgrpidWithuseridSet = new Map<Id, Set<Id>>();
        map_userIdWithOpportuntySet = new Map<Id, Set<Id>>();
    }
    
    //for Duplicate Check
    public void AccessOnOpportunityAccGroupsHelper_Duplicate(List<Industry_Team__c>  lst_IndTeam){        
         
        for(Industry_Team__c industryTeam : lst_IndTeam){
            if(String.isNotBlank(industryTeam.User__c)){ 
                set_Industry.add(industryTeam.Industry__c);
                set_Usrs.add(industryTeam.User__c);
            } 
        }
        //querying all the existing Industry Team records
        industryTmExisting = [SELECT Id, User__c, Industry__c FROM Industry_Team__c WHERE User__c IN: set_Usrs AND Industry__c IN: set_Industry];
        
        //restricting duplicate records on basis of User and Industry Team        
        for(Industry_Team__c industryTm : lst_IndTeam){
            for(Industry_Team__c industryTmExstd  : industryTmExisting){
                //checking in the existing team the newly inserted industry team
                if(string.isNotBlank(industryTmExstd.User__c) && (industryTmExstd.User__c == industryTm.User__c) 
                && string.isNotBlank(industryTmExstd.Industry__c) && (industryTmExstd.Industry__c == industryTm.Industry__c)){
                    industryTm.addError('Duplicate Record');
                    break;
                }               
            }
         }
     } 
    
    
    //for Insertion
    public void AccessOnOpportunityAccGroupsHelper_Insert(List<Industry_Team__c>  lst_IndTeam){
        
        //fetching all the Industry records in a set
        for(Industry_Team__c industryteamObject : lst_IndTeam){
            set_Industry.add(industryteamObject.Industry__c);    
        }
        
        //quering for all the Account Group records from the Industry set
        listaccgrp = [SELECT Id, Customer_Industry__c FROM Account_Group__c WHERE Customer_Industry__c IN : set_Industry];
        
        //quering for all the Account Group Ids in a set
        for(Account_Group__c accgrpObject : listaccgrp){
            set_accountgroup.add(accgrpObject.Id);    
        }
        
        /*quering all the Related Opportunities for the Account Group Ids queried above and creating a map of
        Account Group with Set of Opportuntities*
        for(Related_Opportunity__c relatedOppObject : [SELECT Id, Account_Group__c, Opportunity__c FROM Related_Opportunity__c
                                                       WHERE Account_Group__c IN : set_accountgroup]){
            if(!map_acctgrpWithSetOpp.containsKey(relatedOppObject.Account_Group__c)){
                map_acctgrpWithSetOpp.put(relatedOppObject.Account_Group__c, New Set<Id>());
            }                                                                      
            map_acctgrpWithSetOpp.get(relatedOppObject.Account_Group__c).add(relatedOppObject.Opportunity__c);      
        }
        
        /*quering all the Account Group from the Account Group list and creating a map of
        Industry with Set of Account Groups*
        for(Account_Group__c accgrpObject : listaccgrp){
            if(!map_IndustryWithactgrpSet.containsKey(accgrpObject.Customer_Industry__c)){
                map_IndustryWithactgrpSet.put(accgrpObject.Customer_Industry__c, new Set<Id>());
            }                                                                      
            map_IndustryWithactgrpSet.get(accgrpObject.Customer_Industry__c).add(accgrpObject.Id);                                                                        
        } 
        
        //creating a map of Industry with set of Users(Industry Team)
        for(Industry_Team__c objIndustryTeam : lst_IndTeam){
              if(!mapIndustryWithUserSet.containsKey(objIndustryTeam.Industry__c)){
                  mapIndustryWithUserSet.put(objIndustryTeam.Industry__c, new set<Id>());
              }                                                                      
              mapIndustryWithUserSet.get(objIndustryTeam.Industry__c).add(objIndustryTeam.User__c);                                                                        
        }
        
        //creating a map of Account Group with UserIds
        for(Account_Group__c accgrpObject : listaccgrp){
            if(!map_acctgrpidWithuseridSet.containsKey(accgrpObject.Id)){
                map_acctgrpidWithuseridSet.put(accgrpObject.Id, new set<Id>());
            } 
            if(mapIndustryWithUserSet.containsKey(accgrpObject.Customer_Industry__c)){
                Set<Id> userids = mapIndustryWithUserSet.get(accgrpObject.Customer_Industry__c);
                map_acctgrpidWithuseridSet.get(accgrpObject.Id).addAll(userids);
            }
        }
        
        //creating a map of UserID(Industry Team Users) with Set of Opportunity Ids
        for(Id accgrpId : map_acctgrpidWithuseridSet.keyset()){
            Set <Id> userIds = map_acctgrpidWithuseridSet.get(accgrpId);
            for(Id userId : userIds){
                if(map_acctgrpWithSetOpp.containskey(accgrpId)){
                    Set <Id> oppIdset = map_acctgrpWithSetOpp.get(accgrpId);
                    if(!map_userIdWithOpportuntySet.containskey(userId)){
                        map_userIdWithOpportuntySet.put(userId, new Set<Id>());
                    }
                    map_userIdWithOpportuntySet.get(userId).addall(oppIdset);
                }
            }        
        }
        
        //calling insert methods in the Utillty Class for sharing both Account Groups and Opportunities with Industry Team Users
        sharingutilObject.accGrpAccess(map_acctgrpidWithuseridSet, 'Read');
        sharingutilObject.OpportunitiesAccess(map_userIdWithOpportuntySet, 'Read');       
    }
    
    
    //for Updation. Updation involves Deletion and then Insertion
    public void AccessOnOpportunityAccGroupsHelper_Update(List<Industry_Team__c> lst_IndTeam_Update, List<Industry_Team__c> lst_IndTeam){
        
        //sending the old values for deletion
        AccessOnOpportunityAccGroupsHelper_Delete(lst_IndTeam_Update);        
        
        //clearing the memory
        reset();
        
        //sending the new values for insertion
        AccessOnOpportunityAccGroupsHelper_Insert(lst_IndTeam);
    }
    
    
    //for Deletion
    public void AccessOnOpportunityAccGroupsHelper_Delete(List<Industry_Team__c> lst_IndTeam){
        
        //fetching all the Industry records in a set
        for(Industry_Team__c industryteamObject : lst_IndTeam){
            set_Industry.add(industryteamObject.Industry__c);    
        }
        
        //quering for all the Account Group records from the Industry set
        listaccgrp = [SELECT Id, Customer_Industry__c FROM Account_Group__c WHERE Customer_Industry__c IN : set_Industry];
        
        //quering for all the Account Group Ids in a set
        for(Account_Group__c accgrpObject : listaccgrp){
            set_accountgroup.add(accgrpObject.Id);    
        }
        
        /*quering all the Related Opportunities for the Account Group Ids queried above and creating a map of
        Account Group with Set of Opportuntities*
        for(Related_Opportunity__c relatedOppObject : [SELECT Id, Account_Group__c, Opportunity__c FROM Related_Opportunity__c
                                                       WHERE Account_Group__c IN : set_accountgroup]){
            if(!map_acctgrpWithSetOpp.containsKey(relatedOppObject.Account_Group__c)){
                map_acctgrpWithSetOpp.put(relatedOppObject.Account_Group__c, New Set<Id>());
            }                                                                      
            map_acctgrpWithSetOpp.get(relatedOppObject.Account_Group__c).add(relatedOppObject.Opportunity__c);      
        }
        
        /*quering all the Account Group from the Account Group list and creating a map of
        Industry with Set of Account Groups*
        for(Account_Group__c accgrpObject : listaccgrp){
            if(!map_IndustryWithactgrpSet.containsKey(accgrpObject.Customer_Industry__c)){
                map_IndustryWithactgrpSet.put(accgrpObject.Customer_Industry__c, new Set<Id>());
            }                                                                      
            map_IndustryWithactgrpSet.get(accgrpObject.Customer_Industry__c).add(accgrpObject.Id);                                                                        
        } 
        
        //creating a map of Industry with set of Users(Industry Team)
        for(Industry_Team__c objIndustryTeam : lst_IndTeam){
              if(!mapIndustryWithUserSet.containsKey(objIndustryTeam.Industry__c)){
                  mapIndustryWithUserSet.put(objIndustryTeam.Industry__c, new set<Id>());
              }                                                                      
              mapIndustryWithUserSet.get(objIndustryTeam.Industry__c).add(objIndustryTeam.User__c);                                                                        
        }
        
        //creating a map of Account Group with UserIds
        for(Account_Group__c accgrpObject : listaccgrp){
            if(!map_acctgrpidWithuseridSet.containsKey(accgrpObject.Id)){
                map_acctgrpidWithuseridSet.put(accgrpObject.Id, new set<Id>());
            } 
            if(mapIndustryWithUserSet.containsKey(accgrpObject.Customer_Industry__c)){
                Set<Id> userids = mapIndustryWithUserSet.get(accgrpObject.Customer_Industry__c);
                map_acctgrpidWithuseridSet.get(accgrpObject.Id).addAll(userids);
            }
        }
        
        //creating a map of UserID(Industry Team Users) with Set of Opportunity Ids
        for(Id accgrpId : map_acctgrpidWithuseridSet.keyset()){
            Set <Id> userIds = map_acctgrpidWithuseridSet.get(accgrpId);
            for(Id userId : userIds){
                if(map_acctgrpWithSetOpp.containskey(accgrpId)){
                    Set <Id> oppIdset = map_acctgrpWithSetOpp.get(accgrpId);
                    if(!map_userIdWithOpportuntySet.containskey(userId)){
                        map_userIdWithOpportuntySet.put(userId, new Set<Id>());
                    }
                    map_userIdWithOpportuntySet.get(userId).addall(oppIdset);
                }
            }        
        }
        
        //calling insert methods in the Utillty Class for removing sharing both Account Groups and Opportunities with Industry Team Users
        sharingutilObject.accGrpAccessRemove(map_acctgrpidWithuseridSet);
        sharingutilObject.OpportunitiesAccessRemove(map_userIdWithOpportuntySet);
    }
}

    AccessOnOpportunityAccGroupsTest
    
    /********************************************************************************************************
Test Class Name: AccessOnOpportunityAccGroupsTest
Created By: Shashi Ranjan
Created Date: 26/May/2017
Description: Test class for IndustryTeamBefore and IndustryTeamAfter triggers, AccessOnOpportunityAccGroupsHandler class
             and AccessOnOpportunityAccGroupsHelper class on the Industry Team object. 
             Created as a part of US-0068.

Modification Log:
* Developer                           Date                                   Description
* -------------------------------------------------------------------------------------------------------

**********************************************************************************************************

@isTest()
public class AccessOnOpportunityAccGroupsTest{
    
    public static User testUser;
    public static User testUser1;
    public static Account accountObject;
    public static Opportunity oppObject;
    public static Account_Group__c accountgroupObject;
    public static Industry__c industryObject;
    public static Industry_Team__c industryTeamObject;
    public static Related_Account__c relatedaccountObject;        
    
    //setting up the test data
    @isTest()
    public static void setUPData(){
        
        //test users
        Profile profileObject = [SELECT ID FROM Profile Where Name = 'Standard User'];
        testUser = new User(Alias = 'testusr', Country = 'United Kingdom', Email ='test@randomdemodomain.com', EmailEncodingKey = 'UTF-8', LastName = 'User', FirstName = 'Test', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', ProfileId = profileObject.Id, TimeZoneSidKey = 'America/Los_Angeles', UserName = 'test@andomdemodomain.com');
        insert testUser;
        
        testUser1 = new User(Alias = 'testusr1', Country = 'United Kingdom', Email ='test1@randomdemodomain.com', EmailEncodingKey = 'UTF-8', LastName = 'User', FirstName = 'Test', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', ProfileId = profileObject.Id, TimeZoneSidKey = 'America/Los_Angeles', UserName = 'test1@andomdemodomain.com');
        insert testUser1;
               
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
        
        //opportunity
        oppObject = new Opportunity();
        oppObject.Name = 'TestOpp';
        oppObject.AccountId = accountObject.Id;
        oppObject.StageName = '1 Opportunity Development';
        oppObject.CloseDate = Date.Today();
        oppObject.Siemens_Status__c = '1 In Preparation';        
        insert oppObject;
        
        //industry
        industryObject = new Industry__c();
        industryObject.Industry_Key__c = 'Test Industry';
        insert industryObject;
        
        //acount group
        accountgroupObject = new Account_Group__c();
        accountgroupObject.Name = 'Test Account Group wo Industry';
        accountgroupObject.Start_Fiscal_Year__c = '2017';
        accountgroupObject.End_Fiscal_Year__c = '2022';
        accountgroupObject.Customer_Industry__c = industryObject.Id;
        insert accountgroupObject; 
     }
    
    @isTest()
     public static void industryteamcreationwithopp(){
       setUPData();
       
       Test.startTest();
           //creating a Related Account record to link Account and Opportunity records to an Account Group
           relatedaccountObject = new Related_Account__c();
           relatedaccountObject.Siemens_Account__c = accountObject.Id;
           relatedaccountObject.Siemens_Account_Group__c = accountgroupObject.Id;
           insert relatedaccountObject;
               
           //creating an Industry Team User
           industryTeamObject = new Industry_Team__c();
           industryTeamObject.Industry__c = industryObject.Id;
           industryTeamObject.User__c = testUser.Id;
           insert industryTeamObject;
           
           //updatin the Industry Team User to another user
           industryTeamObject.User__c = testUser1.Id;
           update industryTeamObject;
           
           //checking for duplicate user
           try{
               industryTeamObject.User__c = testUser1.Id;
               update industryTeamObject;
           }catch(Exception exceptionObject){
               Boolean expectedExceptionThrown =  exceptionObject.getMessage().contains('DML') ? TRUE : FALSE;
               System.assertEquals(expectedExceptionThrown, FALSE);
           }
           
           //deleting the Industry Team User
           delete industryTeamObject;
       Test.stopTest();
    }
}

*/}