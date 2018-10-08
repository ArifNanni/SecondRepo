public class DeleteClosedLostOpps
{
    @InvocableMethod
    public static void OppDelete(List<Id> OpportunityIds1)
    {
        List<Opportunity> Opp =[select id from Opportunity
                          where id in :OpportunityIds1
                       and StageName = 'Closed Lost'];
        //delete Opp;
        //return 'hell';
   }
}