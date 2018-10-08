public class AccountRoleAssignments {

   public static void accountPrimaryCheck(List<Siemens_Account_Role_Assignment__c> lstaccountRole)
   {
            map<string,string> mapNewRole = new map<string,string>();
            set<Id> accountNewIdSet = new set<Id>();
            set<Id> setRoleRecordId = new set<Id>();
            map<Id,set<string>> mapAccountPreviousRoleCheck = new map<Id,set<string>>();
            map<Id,set<string>> mapAccountRoleCheck = new map<Id,set<string>>();
            set<string> setStr = new set<string>();
            set<string> setPreviousString = new set<string>();
            
      for(Siemens_Account_Role_Assignment__c objIndRole : lstaccountRole){
          if(objIndRole.Siemens_Pricing_Primary__c)
            {  
               accountNewIdSet.add(objIndRole.Siemens_CompanyID__c);
               if(objIndRole.Id <> Null){
               setRoleRecordId.add(objIndRole.Id);
               } 
            
            
               String str = string.valueOf(objIndRole.Siemens_CompanyID__c)  + 
                            string.valueOf(objIndRole.Siemens_Business_Unit__c) + string.valueOf(objIndRole.Siemens_Country__c) +
                            string.valueOf(objIndRole.Siemens_Divisions__c) + string.valueOf(objIndRole.Siemens_Pricing_Primary__c) ;  
                            system.debug('Antstr'+str);
               if(mapAccountRoleCheck.containskey(objIndRole.Siemens_CompanyID__c)){
               Set<string> temp = mapAccountRoleCheck.get(objIndRole.Siemens_CompanyID__c);
                  if(!temp.contains(str)) {
                  temp.add(str);
                  system.debug('antifstr'+str);
                  mapAccountRoleCheck.put(objIndRole.Siemens_CompanyID__c,temp);
                  str = '';
              
                  }else{
                  system.debug('anterror'+str);
                  objIndRole.addError('This type of comapny Role already exists with same BU, Country and Division in your bluk operation.');   
                  }
               }
               else{
                  Set<string> temp = new Set<String>();
                  temp.add(str);
                  system.debug('antelsestr'+str);
                 mapAccountRoleCheck.put(objIndRole.Siemens_CompanyID__c,temp);
               }
           }
     }
     for(Siemens_Account_Role_Assignment__c objRole: [Select Id,Name,Siemens_CompanyID__c,Siemens_Pricing_Primary__c,Siemens_Business_Unit__c,Siemens_Country__c,Siemens_Divisions__c
                                From Siemens_Account_Role_Assignment__c Where Siemens_CompanyID__c IN: accountNewIdSet and Id!=: setRoleRecordId and Siemens_Pricing_Primary__c = true]){
          
             String strRole = string.valueOf(objRole.Siemens_CompanyID__c)  + string.valueOf(objRole.Siemens_Business_Unit__c) + string.valueOf(objRole.Siemens_Country__c)  +
                              string.valueOf(objRole.Siemens_Divisions__c) + string.valueOf(objRole.Siemens_Pricing_Primary__c) ;
             setPreviousString.add(strRole); 
             mapAccountPreviousRoleCheck.put(objRole.Siemens_CompanyID__c,setPreviousString);    
             mapNewRole.put(strRole,objRole.Name);             
      }
       
     for(Siemens_Account_Role_Assignment__c objIndRoleTemp : lstaccountRole){
          if(objIndRoleTemp.Siemens_Pricing_Primary__c ){
             
               if(mapAccountPreviousRoleCheck.containsKey(objIndRoleTemp.Siemens_CompanyID__c)){
               
                 set<string> setTemp = mapAccountRoleCheck.get(objIndRoleTemp.Siemens_CompanyID__c);
                 for(String str : setTemp){ 
                    String dummy = string.valueOf(objIndRoleTemp.Siemens_CompanyID__c)  + string.valueOf(objIndRoleTemp.Siemens_Business_Unit__c) + string.valueOf(objIndRoleTemp.Siemens_Country__c) + 
                    string.valueOf(objIndRoleTemp.Siemens_Divisions__c) + string.valueOf(objIndRoleTemp.Siemens_Pricing_Primary__c) ;
                           
                      if(dummy == str)
                        {
                         if(mapAccountPreviousRoleCheck.get(objIndRoleTemp.Siemens_CompanyID__c).contains(str))  
          
                             {
                               objIndRoleTemp.addError('This type of Company Role with same BU, Country and Division  already exists in ' +mapNewRole.get(str));               
                             }
                         }
                   }
                 }
             }                       
       }   
   }
    
 /**
      * Arif Mohammad (US-0034)
      * Checks for the Unique check , i.e on a same Account, there can be no more than one assignment of the combination of 
        same  same company role,same BU,same DIV and same Country for a particular Account.
      * @param List<Siemens_Account_Role_Assignment__c>
    **/
    public static void accountRoleCheck(List<Siemens_Account_Role_Assignment__c> lstaccountRole){
            map<string,string> mapNewRole = new map<string,string>();
            set<Id> accountNewIdSet = new set<Id>();
             set<Id> setRoleRecordId = new set<Id>();
             map<Id,set<string>> mapAccountPreviousRoleCheck = new map<Id,set<string>>();
            map<Id,set<string>> mapAccountRoleCheck = new map<Id,set<string>>();
            set<string> setStr = new set<string>();
            set<string> setPreviousString = new set<string>();
            //added
            map<Id,set<string>> mapAccountRole1 = new map<Id,set<string>>();
            map<Id,set<string>> mapAccountPreviousRoleCheck1 = new map<Id,set<string>>();
            set<string> setPreviousString1 = new set<string>();
            //added

            
   
   
      for(Siemens_Account_Role_Assignment__c objIndRole : lstaccountRole){
        accountNewIdSet.add(objIndRole.Siemens_CompanyID__c);
         if(objIndRole.Id <> Null){
              setRoleRecordId.add(objIndRole.Id);
            } 
        
       
        
        String str = string.valueOf(objIndRole.Siemens_CompanyID__c)  + 
                            string.valueOf(objIndRole.Siemens_Business_Unit__c) + string.valueOf(objIndRole.Siemens_Country__c) +
                            string.valueOf(objIndRole.Siemens_Divisions__c) + string.valueOf(objIndRole.Siemens_Roles__c) ;  
                            system.debug('Antstr'+str);
          
          if(mapAccountRoleCheck.containskey(objIndRole.Siemens_CompanyID__c)){
            Set<string> temp = mapAccountRoleCheck.get(objIndRole.Siemens_CompanyID__c);
             if(!temp.contains(str)) {
                temp.add(str);
                 system.debug('antifstr'+str);
                mapAccountRoleCheck.put(objIndRole.Siemens_CompanyID__c,temp);
                str = '';
              
                }else{
                system.debug('anterror'+str);
               objIndRole.addError('This type of comapny Role already exists with same BU, Country and Division in your bluk operation.');   
               }
            }
             else{
                Set<string> temp = new Set<String>();
                temp.add(str);
                 system.debug('antelsestr'+str);
                mapAccountRoleCheck.put(objIndRole.Siemens_CompanyID__c,temp);
              }
                            
        
      }
       
      for(Siemens_Account_Role_Assignment__c objRole: [Select Id,Name,Siemens_CompanyID__c,Siemens_Roles__c,Siemens_Business_Unit__c,Siemens_Country__c,Siemens_Divisions__c
                                                        From Siemens_Account_Role_Assignment__c
                                                        Where Siemens_CompanyID__c IN: accountNewIdSet and Id!=: setRoleRecordId]){
         
       String strRole = string.valueOf(objRole.Siemens_CompanyID__c)  + string.valueOf(objRole.Siemens_Business_Unit__c) + string.valueOf(objRole.Siemens_Country__c) + string.valueOf(objRole.Siemens_Divisions__c) +
                             string.valueOf(objRole.Siemens_Roles__c) ;
          setPreviousString.add(strRole); 
          //added
          setPreviousString1.add(objRole.Siemens_Roles__c);
           mapAccountPreviousRoleCheck1.put(objRole.Siemens_CompanyID__c,setPreviousString1);   
          // mapNewRole1.put(strRole,objRole.Name);
           //added
           mapAccountPreviousRoleCheck.put(objRole.Siemens_CompanyID__c,setPreviousString);    
           mapNewRole.put(strRole,objRole.Name);             
       
       }
       
           for(Siemens_Account_Role_Assignment__c objIndRoleTemp : lstaccountRole){
      
           
          if(mapAccountPreviousRoleCheck.containsKey(objIndRoleTemp.Siemens_CompanyID__c)){
            //  set<string> setTemp = mapAccountPreviousRoleCheck.get(objIndRoleTemp.Siemens_CompanyID__c);
              set<string> setTemp = mapAccountRoleCheck.get(objIndRoleTemp.Siemens_CompanyID__c);

                     system.debug('Countryyy'+objIndRoleTemp.Siemens_Country__c);
                for(String str : setTemp){ 
                 system.debug('entryyy'+str);
                 String dummy = string.valueOf(objIndRoleTemp.Siemens_CompanyID__c)  + string.valueOf(objIndRoleTemp.Siemens_Business_Unit__c) + string.valueOf(objIndRoleTemp.Siemens_Country__c) + 
                 string.valueOf(objIndRoleTemp.Siemens_Divisions__c) + string.valueOf(objIndRoleTemp.Siemens_Roles__c) ;
                 //added
                  if(mapAccountPreviousRoleCheck1.get(objIndRoleTemp.Siemens_CompanyID__c).contains(objIndRoleTemp.Siemens_Roles__c))  
                  {  
                     objIndRoleTemp.addError('Duplicate Account role already exists in '); 
                   }    
                   //added
 
             // if(mapAccountRoleCheck.get(objIndRoleTemp.Siemens_CompanyID__c).contains(str))  
             if(dummy == str)
             {
                  if(mapAccountPreviousRoleCheck.get(objIndRoleTemp.Siemens_CompanyID__c).contains(str))  
          
                             {
                  
                        objIndRoleTemp.addError('This type of Company Role with same BU, Country and Division  already exists in ' +mapNewRole.get(str));  }                
                            }
               }
             }                       
        }
     
     }
}