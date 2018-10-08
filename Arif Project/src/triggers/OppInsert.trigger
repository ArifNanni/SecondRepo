trigger OppInsert on Opportunity (after insert) {
List<ChatterTopics__c> ChatterTopics1 = new List<ChatterTopics__c>();
set<id> AccountIds = new set<id>();
Map<id,set<String>> MapFeedItem = new Map<id,set<String>>();
for(Opportunity Opp: trigger.new){
AccountIds.add(Opp.AccountId);
}
List<ChatterTopics__c> ChatterTopics = [Select id,Topic_Body__c,Account__c from ChatterTopics__c where Account__c in:AccountIds];
if(ChatterTopics.size()>0)
{
for(ChatterTopics__c ChatterTemp : ChatterTopics)
{
    if(!MapFeedItem.containsKey(ChatterTemp.Account__c))
      {
       set<String> Dummy = new set<String>();
       Dummy.add(ChatterTemp.Topic_Body__c);
       MapFeedItem.put(ChatterTemp.Account__c,Dummy);
      }
      else
      {
       set<String> Dummy = new set<String>();
       Dummy=MapFeedItem.get(ChatterTemp.Account__c);
       Dummy.add(ChatterTemp.Topic_Body__c);
       MapFeedItem.put(ChatterTemp.Account__c,Dummy);
      }
   }


  for(Opportunity Opp: trigger.new){
  
     for(String str : MapFeedItem.get(Opp.AccountId))
     {
       ChatterTopics__c CT = new ChatterTopics__c();
       CT.Opportunity1__c =  Opp.Id ;
       CT.Account__c = Opp.AccountId ;
       CT.Topic_Body__c = str ;
        ChatterTopics1.add(CT);
       }
  
     }
     insert ChatterTopics1;
     List<ChatterTopics__c> ChatterTopics2 = [Select id from ChatterTopics__c  where Account__c in:AccountIds and Opportunity1__c = null ];
     delete ChatterTopics2;
}
 }    
 

 
/*
ChatterTopics__c CT = new ChatterTopics__c();
      CT.Account__c = acc.AccountId ;
      CT.Opportunity1__c =  acc.id ;
    //  CT.Topic_Body__c = FI.Body ;
      ChatterTopics.add(CT);*/