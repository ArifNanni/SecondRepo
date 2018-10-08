Public Class ExampleAccessToIndTeamsOnOppAccGrp
{/*
AccessToIndTeamsOnOppAccGrpHandler:
/**********************************************************
Class Name: AccessToIndTeamsOnOppAccGrpHandler
Created By: Shashi Ranjan
Created Date: 23/May/2017
Description: Handler class for the AccessToIndTeamsOnOppsAccGrps
             trigger on the Account Group object.
Related Test Class: AccessToIndTeamsOnOppAccGrpTest
*****************Revision History***************************************
Modification Log:
* Developer            Date                Description
* ----------------------------------------------------------
R.Hari Krishna                  30/05/2017           (TKT-000090)On creation of new Account Group insert Account Group owner as Account Group Team and Provide Access on Account Group and it's Opportunities
R.Hari Krishna                  30/05/2017           (TKT-000090)On Owner change of Account Group insert Account Group new owner as Account Group Team if no record existed with that User and Provide Access on Account Group and it's Opportunities
***********************************************************

public class AccessToIndTeamsOnOppAccGrpHandler extends TriggerAction{
    
    public list<Account_Group__c> lst_NewAccGrp = (List<Account_Group__c>)trigger.new;
    public list<Account_Group__c> lst_OldAccGrp = (List<Account_Group__c>)trigger.old;
    public list<Account_Group__c> lst_AccGrp = new list<Account_Group__c>();
    public list<Account_Group__c> lst_AccGrp_old = new list<Account_Group__c>();
    public list<Account_Group__c> lst_AccGrpwithIndustry = new list<Account_Group__c>();
    public list<Account_Group__c> lst_AccGrpOwnerChanged = new list<Account_Group__c>(); 
    public list<Account_Group__c> lst_AccGrpOldOwner = new list<Account_Group__c>();
    
    public Boolean revokeIndustryTeamAccess = FALSE;
    
    // All TriggerAction triggers will use exactly this constructor. It never needs modification.
    public AccessToIndTeamsOnOppAccGrpHandler(){
         super();
    }
    
    /*All filtering logic should be done in the shouldRun method, and the return should always
    be some version of !COLLECTIONNAME.isEmpty().*
    public override boolean shouldRun(){
        if(this.isInsert()) {
            lst_AccGrp = lst_NewAccGrp;
            lst_AccGrp_old = lst_OldAccGrp;     
        }
        if(this.isDelete()){
            lst_AccGrp = lst_OldAccGrp;
        }
        if(this.isUpdate()){
            lst_AccGrp = lst_NewAccGrp;
            lst_AccGrp_old = lst_OldAccGrp;      
         }
                 
        return !lst_AccGrp.isEmpty();
    }
    
    /* All the actual work of the class needs to happen here, including the query.
    If there's a decision about what to update that can't be made until after you query something,
    put it in here, after the query. ShouldRun should never itself contain a query.*
    public override void doAction(){
        AccessToIndTeamsOnOppAccGrpHelper helperObject = new AccessToIndTeamsOnOppAccGrpHelper();
        if(this.isInsert()){
            //insert Account Group Team
            helperObject.makeOwnerAsAccountGroupTeam(lst_AccGrp);
            
            //Removing Account Groups with Industry field as blank
            for(Account_Group__c accgrpObject : lst_AccGrp){
                if(string.isnotblank(accgrpObject.Customer_Industry__c)){
                    lst_AccGrpwithIndustry.add(accgrpObject);
                 }
            }
            if(!lst_AccGrpwithIndustry.isEmpty()){                
                helperObject.AccessToIndTeamsOnOppAccGrpHelper_Insert(lst_AccGrpwithIndustry);
            }
        }
        
        if(this.isUpdate()){
            //verify whether owner changed or not
            for (Account_Group__c accGpr : lst_AccGrp){            
                Account_Group__c oldAccGrp = (Account_Group__c) Trigger.oldMap.get(accGpr.Id);                                        
                if(oldAccGrp.ownerId != accGpr.ownerId){
                  //new records which User or Group changed  
                  lst_AccGrpOwnerChanged.add(accGpr);                  
                  lst_AccGrpOldOwner.add(oldAccGrp);
                }
             }
                          
            if(lst_AccGrpOwnerChanged.size()>0 && lst_AccGrpOwnerChanged != null){            
                //insert Account Group Team on change of Account Group Owner
                helperObject.updateOwnerAsAccountGroupTeam(lst_AccGrpOwnerChanged,lst_AccGrpOldOwner);                
            }
            //Sending both Old and New Values for delete and then insert
            helperObject.AccessToIndTeamsOnOppAccGrpHelper_Update(lst_AccGrp_old, lst_AccGrp);
        }
        if(this.isDelete() ){
            helperObject.AccessToIndTeamsOnOppAccGrpHelper_Delete(lst_AccGrp, revokeIndustryTeamAccess);
        }
            
    }
}

AccessToIndTeamsOnOppAccGrpHelper:
/*********************************************************************************
Class Name: AccessToIndTeamsOnOppAccGrpHelper
Created By: Shashi Ranjan
Created Date: 23/May/2017
Description: Helper class for the AccessToIndTeamsOnOppsAccGrps
             trigger on the Account Group object
Related Test Class: AccessToIndTeamsOnOppAccGrpTest
*****************Revision History***************************************
Modification Log:
* Developer                      Date                         Description
* -------------------------------------------------------------------------------
R.Hari Krishna                  30/05/2017           (TKT-000090)On creation of new Account Group insert Account Group owner as Account Group Team  and Provide Access on Account Group and it's Opportunities
R.Hari Krishna                  30/05/2017           (TKT-000090)On Owner change of Account Group insert Account Group new owner as Account Group Team if no record existed with that User  and Provide Access on Account Group and it's Opportunities
*********************************************************************************
public class AccessToIndTeamsOnOppAccGrpHelper{
    
    ApexSharingUtilityClass sharingutilObject = new ApexSharingUtilityClass();    
    public Map<ID, ID> map_AccountGroupWithIndustryIds = new map<ID, ID>();
    public Map<ID, Set<ID>> map_IndustryWithUserIds = new map<ID, Set<ID>>();
    public Map<ID, Set<ID>> map_AccountGroupWithUserSetIds = new map<ID, Set<ID>>();
    public Map<ID, Set<Id>> map_AccGrpWithLstRldOppsIds = new map<ID, Set<Id>>();
    public Map<Id, Set<Id>> mapOfUsersWithOppSet = new Map<Id, Set<Id>>();
    public map<ID, ID> map_AccGrpTmUserWithAccGrpIds =  new map<ID, ID>();
    public Map<Id, Set<Id>> map_AccGrpTmUserWithLstOppsIds = new Map<Id, Set<Id>>();
    public Map<ID,Set<ID>> map_AccGrpUsrsIds =  new Map<ID,Set<ID>>();
    public Map<ID, set<Id>> map_AccGrpWithSetRldOppsIds = new Map<ID, set<Id>>(); 
    public List<Account_Group__c> lstAccGrpWithIndus = new List<Account_Group__c>();
    public List<Siemens_Account_Group_Team__c> accgrptm = new List<Siemens_Account_Group_Team__c>();
    public set<Id> set_AccountGrps = new Set<Id>();
    public set<Id> set_Usrs  = new Set<Id>(); 
    public List<Siemens_Account_Group_Team__c> lst_accGrpTmExstd = new List<Siemens_Account_Group_Team__c>();
    public Boolean boolDup = False;
    public List<Account_Group__c> lstDeDupAccGrps = new List<Account_Group__c>();
    List<Account_Group__Share> lst_AccGrpShareRecrds = new List<Account_Group__Share>();
    
    //resetting the values after deleting the existing shares and before inserting new shares(in update case)
    public void reset(){
        map_AccountGroupWithIndustryIds = new map<ID, ID>();
        map_IndustryWithUserIds = new map<ID, Set<ID>>();
        map_AccountGroupWithUserSetIds = new map<ID, Set<ID>>();
        map_AccGrpWithLstRldOppsIds = new map<ID, Set<Id>>();
        mapOfUsersWithOppSet = new Map<Id, Set<Id>>();
        map_AccGrpTmUserWithAccGrpIds =  new map<ID, ID>(); 
        map_AccGrpTmUserWithLstOppsIds = new Map<Id, Set<Id>>();
        map_AccGrpUsrsIds =  new Map<ID,Set<ID>>();
        map_AccGrpWithSetRldOppsIds = new Map<ID, set<Id>>(); 
        lstAccGrpWithIndus = new List<Account_Group__c>();
        accgrptm = new List<Siemens_Account_Group_Team__c>();
        set_AccountGrps = new Set<id>();
        set_Usrs  = new Set<id>(); 
        lst_accGrpTmExstd = new List<Siemens_Account_Group_Team__c>();
        lstDeDupAccGrps = new List<Account_Group__c>();
    }
    
    //On creation of new Account Group insert Account Group owner as Account Group Team  
    public void makeOwnerAsAccountGroupTeam(List<Account_Group__c>  lstAccGrp)
    {
        //create list of Account Group Teams 
        for(Account_Group__c accGroup : lstAccGrp){
            Siemens_Account_Group_Team__c accGrpTMbr = new Siemens_Account_Group_Team__c();
            accGrpTMbr.Siemens_Account_Group__c = accGroup.Id;
            accGrpTMbr.Siemens_User__c  = accGroup.OwnerId;
            accgrptm.add(accGrpTMbr);
        }
        //insert account Group Team(s)
        if(accgrptm.size()>0 || accgrptm != null)
            List<Database.SaveResult> lst_SR = Database.Insert(accgrptm,false);
    }
    
    //On Owner change of Account Group insert Account Group new owner as Account Group Team if no record existed with that User
    public void updateOwnerAsAccountGroupTeam(List<Account_Group__c>  lstAccGrpNewOwner,List<Account_Group__c>  lstAccGrpOldOwner)
    {        
        //if no duplicate existed then only insert
        removeDuplicates(lstAccGrpNewOwner);        
        if(lstDeDupAccGrps.size()>0 && lstDeDupAccGrps != null)
            makeOwnerAsAccountGroupTeam(lstDeDupAccGrps);   
        
        //prepare set of new Owners
        for(Account_Group__c ownerChgAccGrp : lstAccGrpNewOwner){
            set_Usrs.add(ownerChgAccGrp.OwnerId);        
        }
                
        for(Siemens_Account_Group_Team__c oldAccGrp : [SELECT Id, Siemens_User__c, Siemens_Account_Group__c FROM
                                                       Siemens_Account_Group_Team__c WHERE Siemens_Account_Group__c IN :
                                                       lstAccGrpNewOwner AND Siemens_User__c NOT IN : set_Usrs])    
        {
            Account_Group__Share accGprShareObj = new Account_Group__Share();                
            accGprShareObj.UserOrGroupId = oldAccGrp.Siemens_User__c;                                      
            accGprShareObj.RowCause = 'Manual';     
            accGprShareObj.ParentId = oldAccGrp.Siemens_Account_Group__c;                         
            accGprShareObj.AccessLevel = 'Read';  
                                  
            lst_AccGrpShareRecrds.add(accGprShareObj);
        }
        
        if(lst_AccGrpShareRecrds.size()>0 && lst_AccGrpShareRecrds !=null)
            insert lst_AccGrpShareRecrds;                 
    }
    
    //duplicate check method for Account Group Team    
    public void removeDuplicates(List<Account_Group__c>  lstAccGrp)
    {   
        //clear Up memory 
        reset();
        
        for(Account_Group__c accGrp : lstAccGrp){            
                set_AccountGrps.add(accGrp.Id);
                set_Usrs.add(accGrp.OwnerId);
        }                
        //querying all the existing Account Group Team records
        lst_accGrpTmExstd = [SELECT Id,Siemens_User__c,Siemens_Account_Group__c FROM Siemens_Account_Group_Team__c WHERE Siemens_User__c IN: set_Usrs AND Siemens_Account_Group__c IN: set_AccountGrps];
        
        //verifying if any existed record(s) available, on bases of User and Account Group        
        if(lst_accGrpTmExstd.size()>0 && lst_accGrpTmExstd != null){    
            for(Account_Group__c  accGrp : lstAccGrp){
                boolDup = False;
                for(Siemens_Account_Group_Team__c accGrpTmExstd : lst_accGrpTmExstd){                    
                    //checking in the existing team the newly inserted Account Group team
                  if(accGrpTmExstd.Siemens_User__c == accGrp.OwnerId && accGrpTmExstd.Siemens_Account_Group__c == accGrp.Id)
                  {                     
                    boolDup = True;
                    break;
                  }               
                }
                if(boolDup == False)                
                    lstDeDupAccGrps.add(accGrp);
            }
        }else{
            lstDeDupAccGrps.addAll(lstAccGrp);
        }                   
    }
        
    //for Insertion
    public void AccessToIndTeamsOnOppAccGrpHelper_Insert(List<Account_Group__c>  lstAccGrp){
    
        //creating a map of Account Group with Industry
        for(Account_Group__c accGroup : lstAccGrp){
            map_AccountGroupWithIndustryIds.put(accGroup.Id,accGroup.Customer_Industry__c);
        }           
            
        //creating a map of Industry with Set of Users(Industry Team Users)
        for(Industry_Team__c industryteam : [SELECT User__c, Industry__c FROM Industry_Team__c WHERE Industry__c IN: map_AccountGroupWithIndustryIds.values()]){
            if(map_IndustryWithUserIds.containsKey(industryteam.Industry__c)){
                map_IndustryWithUserIds.get(industryteam.Industry__c).add(industryteam.User__c);
            } 
            else{
                map_IndustryWithUserIds.put(industryteam.Industry__c, new Set<Id> {industryteam.User__c});
            }            
        }
            
        //creating a map of Acount Group with Set of Users(Industry Team Users)
        for(Id accgrpKey : map_AccountGroupWithIndustryIds.keyset()){
            for(Id industryKey : map_IndustryWithUserIds.keyset()){
                if(map_AccountGroupWithIndustryIds.get(accgrpKey) == industryKey){                   
                    Set<Id> lstUsrsIds = map_IndustryWithUserIds.get(industryKey);                    
                    map_AccountGroupWithUserSetIds.put(accgrpKey,lstUsrsIds);                         
                 }
            }
        }
        
        /*sending the map to the ApexSharingUtility class to share the Account Group records
        with related Industry Team Users*
        if(map_AccountGroupWithUserSetIds.size()>0 && map_AccountGroupWithUserSetIds != Null){
            sharingutilObject.accGrpAccess(map_AccountGroupWithUserSetIds, 'Read');
        }           
    }
    
    
    //for Updation
    public void AccessToIndTeamsOnOppAccGrpHelper_Update(List<Account_Group__c>  lst_AccGrpwithIndustry_old, List<Account_Group__c>  lst_AccGrpwithIndustry){
    
        /*deleting the existing share on Account Groups and Related Opportunities
        if Industry field is populated on the Account Group records*
        for(Account_Group__c accgrpObject : lst_AccGrpwithIndustry_old){
            if(string.isnotblank(accgrpObject.Customer_Industry__c)){
                lstAccGrpWithIndus.add(accgrpObject);
            }
        }
        
        /*if Account Group has the Industry field populated,
        then calling the delete functionality to remove the sharing from 
        Account Group and Related Opportunities*
        if(!lstAccGrpWithIndus.isEmpty()){
            AccessToIndTeamsOnOppAccGrpHelper_Delete(lstAccGrpWithIndus, TRUE);
        }
        
        /*inserting new sharing on Account Groups and Related Opportunities
        if Industry field is populated on the Account Group records*
        //clearing all the allocated memory
        reset();
        for(Account_Group__c accgrpObject : lst_AccGrpwithIndustry){
            if(string.isnotblank(accgrpObject.Customer_Industry__c)){
                lstAccGrpWithIndus.add(accgrpObject);
            }
        }
        
        //if Account Group has the Industry field populated
        if(!lstAccGrpWithIndus.isEmpty()){
            //creating a map of Account Group with Industry
            for(Account_Group__c accGroup : lstAccGrpWithIndus){
                map_AccountGroupWithIndustryIds.put(accGroup.Id,accGroup.Customer_Industry__c);
            }           
                
            //creating a map of Industry with Set of Users(Industry Team Users)
            for(Industry_Team__c industryteam : [SELECT User__c, Industry__c FROM Industry_Team__c WHERE Industry__c IN: map_AccountGroupWithIndustryIds.values()]){
                if(map_IndustryWithUserIds.containsKey(industryteam.Industry__c)){
                    map_IndustryWithUserIds.get(industryteam.Industry__c).add(industryteam.User__c);
                } 
                else{
                    map_IndustryWithUserIds.put(industryteam.Industry__c, new Set<Id> {industryteam.User__c});
                }            
            }
            
            //creating a map of Acount Group with Set of Users(Industry Team Users)
            for(Id accgrpKey : map_AccountGroupWithIndustryIds.keyset()){
                for(Id industryKey : map_IndustryWithUserIds.keyset()){
                    if(map_AccountGroupWithIndustryIds.get(accgrpKey) == industryKey){                   
                        Set<Id> lstUsrsIds = map_IndustryWithUserIds.get(industryKey);                    
                        map_AccountGroupWithUserSetIds.put(accgrpKey,lstUsrsIds);                         
                     }
                }
            }
                                
            /*sending the map to the ApexSharingUtility class to share the Account Group records
            with related Industry Team Users*
            if(map_AccountGroupWithUserSetIds.size()>0 && map_AccountGroupWithUserSetIds != Null){
                sharingutilObject.accGrpAccess(map_AccountGroupWithUserSetIds, 'Read');
            }
            
            
            //Related Opportunity Share
            //creating a map with Account Group and Set of Opportunity Ids
            for(Related_Opportunity__c rldOppsofAccGrp : [SELECT Account_Group__c, Id, Opportunity__c FROM Related_Opportunity__c WHERE Account_Group__c IN: map_AccountGroupWithUserSetIds.keyset()]){
                if(map_AccGrpWithLstRldOppsIds.containsKey(rldOppsofAccGrp.Account_Group__c)){
                    map_AccGrpWithLstRldOppsIds.get(rldOppsofAccGrp.Account_Group__c).add(rldOppsofAccGrp.Opportunity__c);
                } 
                else{
                    map_AccGrpWithLstRldOppsIds.put(rldOppsofAccGrp.Account_Group__c, new Set<Id> {rldOppsofAccGrp.Opportunity__c});
                }
            }
            
            //creating a map of Users with Set of Opportunities Id
            for(Id accId : map_AccountGroupWithUserSetIds.keyset()){
                for(Id userId : map_AccountGroupWithUserSetIds.get(accId)){
                    if(map_AccGrpWithLstRldOppsIds.containskey(accId)){
                        Set <Id> oppIdset = map_AccGrpWithLstRldOppsIds.get(accId);
                        if(!mapOfUsersWithOppSet.containskey(userId)){
                            mapOfUsersWithOppSet.put(userId, new Set<Id>());
                        }
                        mapOfUsersWithOppSet.get(userId).addall(oppIdset);
                    }    
                }
            }        
            
            /*sending the map to the ApexSharingUtility class to share the Related Opportunity records
            with related Industry Team Users*
            if(mapOfUsersWithOppSet.size()>0 && mapOfUsersWithOppSet!= Null){
                sharingutilObject.OpportunitiesAccess(mapOfUsersWithOppSet, 'Read');
            }
        }            
    }
    
    
    //for Deletion
    public void AccessToIndTeamsOnOppAccGrpHelper_Delete(List<Account_Group__c>  lstAccGrp, Boolean revokeIndustryTeamAccess){
    
        //querying for all the Related Account Group Team from the Account Group
        accgrptm =  [SELECT Id, Siemens_Account_Group__c FROM Siemens_Account_Group_Team__c WHERE Siemens_Account_Group__c  IN : lstAccGrp];
        
        //creating a map of Account Group with Account Group Team
        if(!accgrptm.isEmpty()){   
            for(Siemens_Account_Group_Team__c accGrpTm : [SELECT Id, Siemens_Account_Group__c, Siemens_User__c FROM Siemens_Account_Group_Team__c WHERE Id IN : accgrptm]){     
                map_AccGrpTmUserWithAccGrpIds.put(accGrpTm.Siemens_User__c, accGrpTm.Siemens_Account_Group__c);
                if(map_AccGrpUsrsIds.containsKey(accGrpTm.Siemens_Account_Group__c)){
                    Set<Id> stUsrIds = map_AccGrpUsrsIds.get(accGrpTm.Siemens_Account_Group__c);                
                    stUsrIds.add(accGrpTm.Siemens_User__c);
                    map_AccGrpUsrsIds.put(accGrpTm.Siemens_Account_Group__c, stUsrIds);
                 } 
                 else{    
                     map_AccGrpUsrsIds.put(accGrpTm.Siemens_Account_Group__c, new Set<ID> {accGrpTm.Siemens_User__c});
                 }
             }
         }
         
         //creating map of Account Group with set of Opportunities 
         for(Related_Opportunity__c OppsofAccGrp : [SELECT Account_Group__c,Id,Opportunity__c FROM Related_Opportunity__c WHERE Account_Group__c IN: map_AccGrpUsrsIds.KeySet()]){            
             if(map_AccGrpWithSetRldOppsIds.containsKey(OppsofAccGrp.Account_Group__c)){
                 Set<Id> lstOppsIds = map_AccGrpWithSetRldOppsIds.get(OppsofAccGrp.Account_Group__c);
                 lstOppsIds.add(OppsofAccGrp.Opportunity__c);
                 map_AccGrpWithSetRldOppsIds.put(OppsofAccGrp.Account_Group__c, lstOppsIds);
             } 
             else{
                 map_AccGrpWithSetRldOppsIds.put(OppsofAccGrp.Account_Group__c, new set<Id> {OppsofAccGrp.Opportunity__c});
             }
         }
        
        //creating a map of Account Group with Industry
        for(Account_Group__c accGroup : lstAccGrp){
            map_AccountGroupWithIndustryIds.put(accGroup.Id,accGroup.Customer_Industry__c);
        }           
                
        //creating a map of Industry with Set of Users(Industry Team Users)
        for(Industry_Team__c industryteam : [SELECT User__c, Industry__c FROM Industry_Team__c WHERE Industry__c IN: map_AccountGroupWithIndustryIds.values()]){
            if(map_IndustryWithUserIds.containsKey(industryteam.Industry__c)){
                map_IndustryWithUserIds.get(industryteam.Industry__c).add(industryteam.User__c);
            } 
            else{
                map_IndustryWithUserIds.put(industryteam.Industry__c, new Set<Id> {industryteam.User__c});
            }            
        }
            
        //creating a map of Acount Group with Set of Users(Industry Team Users)
        for(Id accgrpKey : map_AccountGroupWithIndustryIds.keyset()){
            for(Id industryKey : map_IndustryWithUserIds.keyset()){
                if(map_AccountGroupWithIndustryIds.get(accgrpKey) == industryKey){                   
                    Set<Id> lstUsrsIds = map_IndustryWithUserIds.get(industryKey);                    
                    map_AccountGroupWithUserSetIds.put(accgrpKey,lstUsrsIds);                         
                 }
            }
        }
         
         /*sending the map to the ApexSharingUtility class to remove the Account Group records
         sharing with related Industry Team Users*
         if(map_AccountGroupWithUserSetIds.size()>0 && map_AccountGroupWithUserSetIds != Null){
                sharingutilObject.accGrpAccessRemove(map_AccountGroupWithUserSetIds);
         }
         
         //Related Opportunity Share
         //creating a map with Account Group and Set of Opportunity Ids
         for(Related_Opportunity__c rldOppsofAccGrp : [SELECT Account_Group__c, Id, Opportunity__c FROM Related_Opportunity__c WHERE Account_Group__c IN: map_AccountGroupWithUserSetIds.keyset()]){
             if(map_AccGrpWithLstRldOppsIds.containsKey(rldOppsofAccGrp.Account_Group__c)){
                 map_AccGrpWithLstRldOppsIds.get(rldOppsofAccGrp.Account_Group__c).add(rldOppsofAccGrp.Opportunity__c);
             } 
             else{
                map_AccGrpWithLstRldOppsIds.put(rldOppsofAccGrp.Account_Group__c, new Set<Id> {rldOppsofAccGrp.Opportunity__c});
             }
         }
            
         //creating a map of Users with Set of Opportunities Id
         for(Id accId : map_AccountGroupWithUserSetIds.keyset()){
             for(Id userId : map_AccountGroupWithUserSetIds.get(accId)){
                 if(map_AccGrpWithLstRldOppsIds.containskey(accId)){
                     Set <Id> oppIdset = map_AccGrpWithLstRldOppsIds.get(accId);
                     if(!mapOfUsersWithOppSet.containskey(userId)){
                         mapOfUsersWithOppSet.put(userId, new Set<Id>());
                     }
                     mapOfUsersWithOppSet.get(userId).addall(oppIdset);
                 }    
             }
         }
         
         //creating a map of Account Group Team User with set of Opportunities to remove access 
         for(Id accGrpTmUsrKey : map_AccGrpTmUserWithAccGrpIds.keyset()){
            for(Id accGrpKey : map_AccGrpWithSetRldOppsIds.keyset()){
                if(map_AccGrpTmUserWithAccGrpIds.get(accGrpTmUsrKey) == accGrpKey){                   
                    Set<Id> lstOppsIds = map_AccGrpWithSetRldOppsIds.get(accGrpKey);
                    map_AccGrpTmUserWithLstOppsIds.put(accGrpTmUsrKey, lstOppsIds);                         
                }
            }
         }
         
         /*sending the map to the ApexSharingUtility class to remove the Related Opportunity records
         sharing with related Industry Team Users*
         if(mapOfUsersWithOppSet.size()>0 && mapOfUsersWithOppSet != Null){            
             sharingutilObject.OpportunitiesAccessRemove(mapOfUsersWithOppSet);
         }
         
         /*sending the map to the ApexSharingUtility class to remove the Related Opportunity records
         sharing with related Account Group Users*
         if(revokeIndustryTeamAccess == False){            
             sharingutilObject.OpportunitiesAccessRemove(map_AccGrpTmUserWithLstOppsIds);
         }
    }
}


/********************************************************************************************************
Test Class Name: AccessToIndTeamsOnOppAccGrpTest
Created By: Shashi Ranjan
Created Date: 28/May/2017
Description: Test class for AccountGroupAfter trigger, AccessToIndTeamsOnOppAccGrpHandler class
             and AccessToIndTeamsOnOppAccGrpHelper class on the Account Group object. 
             Created as a part of US-0068.

Modification Log:
* Developer                           Date                                   Description
* -------------------------------------------------------------------------------------------------------
R.Hari Krishna                  30/05/2017                                  TKT-000090- Related scenarios code covered 
**********************************************************************************************************

@isTest()
public class AccessToIndTeamsOnOppAccGrpTest{
    
    public static User testUser;
    public static User testUser1;
    public static Industry__c industryObject;
    public static Industry__c industryObject1;
    public static Industry_Team__c industryTeamObject;
    public static Industry_Team__c industryTeamObject1;
    public static Account accountObject;
    public static Opportunity oppObject;
    public static Account_Group__c accountgroupObject1 ;   
    public static Related_Account__c relatedaccountObject;
    public static Siemens_Account_Group_Team__c accountgroupteamObject;
    public static Account_Group__Share accgrpshare;
    
    //setting up the test data
    @isTest()
    public static void setUPData(){
        
        //users
        Profile profileObject = [SELECT ID FROM Profile Where Name = 'Siemens Sales Standard Profile'];
        testUser = new User(Alias = 'testusr', Country = 'United Kingdom', Email ='test@randomdemodomain.com', EmailEncodingKey = 'UTF-8', LastName = 'User', FirstName = 'Test', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', ProfileId = profileObject.Id, TimeZoneSidKey = 'America/Los_Angeles', UserName = 'test@andomdemodomain.com');
        insert testUser;
        
        testUser1 = new User(Alias = 'testusr1', Country = 'United Kingdom', Email ='test1@randomdemodomain.com', EmailEncodingKey = 'UTF-8', LastName = 'User', FirstName = 'Test', LanguageLocaleKey = 'en_US', LocaleSidKey = 'en_US', ProfileId = profileObject.Id, TimeZoneSidKey = 'America/Los_Angeles', UserName = 'test1@andomdemodomain.com');
        insert testUser1;
        
        //industries
        industryObject = new Industry__c();
        industryObject.Industry_Key__c = 'Test Industry';
        insert industryObject;
        
        industryObject1 = new Industry__c();
        industryObject1.Industry_Key__c = 'Test Industry';
        insert industryObject1;
        
        //industry team users
        industryTeamObject = new Industry_Team__c();
        industryTeamObject.Industry__c = industryObject.Id;
        industryTeamObject.User__c = testUser.Id;
        insert industryTeamObject; 
        
        industryTeamObject1 = new Industry_Team__c();
        industryTeamObject1.Industry__c = industryObject1.Id;
        industryTeamObject1.User__c = testUser1.Id;
        insert industryTeamObject1;   
               
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
        
        accountgroupObject1 = new Account_Group__c(); 
        accountgroupObject1.Name = 'Test Account Group wo Industry1';
        accountgroupObject1.Start_Fiscal_Year__c = '2017';
        accountgroupObject1.End_Fiscal_Year__c = '2022';
        accountgroupObject1.Customer_Industry__c = industryObject.Id;
        insert accountgroupObject1;    
        
        //account group team
        accountgroupteamObject = new Siemens_Account_Group_Team__c();
        accountgroupteamObject.Siemens_Account_Group__c = accountgroupObject1.Id;
        accountgroupteamObject.Siemens_User__c = testUser1.Id;
        insert accountgroupteamObject;
     }
     
     @isTest()
     public static void accountgroupcreation(){
       setUPData();
       
       Test.startTest();
           
           //creating an Account Group  
           Account_Group__c accountgroupObject = new Account_Group__c();           
           accountgroupObject.Name = 'Test Account Group wo Industry';
           accountgroupObject.Start_Fiscal_Year__c = '2017';
           accountgroupObject.End_Fiscal_Year__c = '2022';
           accountgroupObject.Customer_Industry__c = industryObject.Id;
           insert accountgroupObject;
         
           //account group team
           accountgroupteamObject = new Siemens_Account_Group_Team__c();
           accountgroupteamObject.Siemens_Account_Group__c = accountgroupObject.Id;
           accountgroupteamObject.Siemens_User__c = testUser.Id;
           insert accountgroupteamObject;
           
           //creating a Related Account record to link Account and Opportunity records to an Account Group
           relatedaccountObject = new Related_Account__c();
           relatedaccountObject.Siemens_Account__c = accountObject.Id;
           relatedaccountObject.Siemens_Account_Group__c = accountgroupObject.Id;
           insert relatedaccountObject;
           
           //updating the Account Group record to link to another Industry
           accountgroupObject.Customer_Industry__c = industryObject1.Id;
           update accountgroupObject;
         
           //checking for the shared record and the shared user
           accgrpshare = [SELECT Id, UserOrGroupId, ParentId, RowCause FROM Account_Group__Share WHERE ParentId = : accountgroupObject.Id and RowCause = 'Manual'];
           System.assertEquals(accgrpshare.UserOrGroupId, testUser1.Id);
           
           //deleting the Account Group record
           delete accountgroupObject;
       Test.stopTest();
    } 
    
     @isTest()
     public static void accountgroupOwnerTransfer(){
         setUPData();
         Test.startTest(); 
         system.runAs(testUser){
           //creating an Account Group  
           Account_Group__c accountgroupObjectTemp = new Account_Group__c();           
           accountgroupObjectTemp.Name = 'Test Account Group wo Industry';
           accountgroupObjectTemp.Start_Fiscal_Year__c = '2017';
           accountgroupObjectTemp.End_Fiscal_Year__c = '2022';
           accountgroupObjectTemp.Customer_Industry__c = industryObject.Id;
           insert accountgroupObjectTemp;
             try
            {
               if(accountgroupObjectTemp != null)
               {
                 accountgroupObjectTemp.ownerId = testUser1.Id;  
                 update accountgroupObjectTemp;
               }
            }catch(Exception e)
            {    
               System.Assert(accountgroupObjectTemp.Id == Null, e.getMessage());
            }            
         Test.stopTest();
         }
     }
}

*/}