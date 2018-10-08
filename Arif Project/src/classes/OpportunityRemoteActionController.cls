global with sharing class OpportunityRemoteActionController {
 
      public Static list<Opportunity> opp1{get;set;}
      public list<Opportunity> opp2{get;set;}
      public Opportunity opp{get;set;}
      public String stageName{get;set;}
   
 
      public OpportunityRemoteActionController() {
          
      }
       /**
 
      * Method that creates the select option dynamically.
 
      **/
      public Pagereference exam()
      {
         opp2 =    [select id,Name,Amount,stageName from Opportunity WHERE stageName =: stageName];
       System.debug('----List'+opp1);
           return null;
      }
 
      public List<SelectOption> getOptions() {
 
          List<SelectOption> options = new List<SelectOption>();
          Schema.DescribeFieldResult fieldResult = Opportunity.StageName.getDescribe();
          List<Schema.PicklistEntry> ple = fieldResult.getPicklistValues();
          options.add(new SelectOption('--Select--', '--Select--'));
         for( Schema.PicklistEntry f : ple)
         {
         //system.debug('f.getLabel()=>'+f.getLabel() +' ==f.getValue()' +f.getValue());
          options.add(new SelectOption(f.getLabel(), f.getValue()));
         }   
         return options;
      }
 
      /**
 
      * Remote action involved with Javascript remoting and is made global
 
      **/
 
      @RemoteAction
      global static Opportunity[] getOpportunityDetails(String stageNameDet) {
       opp1 =    [select id,Name,Amount,stageName from Opportunity WHERE stageName =: stageNameDet];
       System.debug('----List'+opp1);
           return opp1;
           
 
      }
 
}