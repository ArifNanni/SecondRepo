trigger OppDelete on Opportunity (before delete) {
Set<id> OpportunityIds = new Set<id>();
Set<id> AccountIds = new Set<id>();

for(Opportunity Opp: trigger.old)
{   
    AccountIds.add(Opp.AccountId);
    OpportunityIds.add(Opp.id);
}

List<ChatterTopics__c> ChatterTopics = [select id from ChatterTopics__c where Opportunity1__c in:OpportunityIds and 
                                        Account__c in:AccountIds];

 if(ChatterTopics.size()>0)
   {
     delete ChatterTopics;
   }

}