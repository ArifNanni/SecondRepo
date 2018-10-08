trigger OppUpdate on Opportunity (after update) {
Map<id,id> mapold = new Map<id,id>();
List<ChatterTopics__c> ChatterTopics1 = new List<ChatterTopics__c>();
Map<id,id> mapnew = new Map<id,id>();
for(Opportunity opp : trigger.old)
 {
  mapold.put(opp.id,opp.AccountId);
 }
 for(Opportunity opp : trigger.new)
 {
  mapnew.put(opp.id,opp.AccountId);
 }

list<ChatterTopics__c> ChatterTopics = [select id,Opportunity1__c,Account__c from ChatterTopics__c where Opportunity1__c in:
                                       mapnew.keySet()];
       if(ChatterTopics.size()>0)
       {
  for(ChatterTopics__c ChatterTopic : ChatterTopics)
  {
    if(mapold.get(ChatterTopic.Opportunity1__c) == ChatterTopic.Account__c)
     {
        ChatterTopics__c CT = new ChatterTopics__c();
        CT.id = ChatterTopic.id;
        CT.Account__c = mapnew.get(ChatterTopic.Opportunity1__c) ;
        ChatterTopics1.add(CT);
     }
  
  }
    if(ChatterTopics1.size()>0){
  update ChatterTopics1;
  }
  }
}