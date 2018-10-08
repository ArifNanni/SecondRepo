trigger FeedItem1 on FeedItem (After insert,Before delete) {
if(Trigger.isInsert)
{
Map<id,set<FeedItem>> MapFeedItem = new Map<id,set<FeedItem>>();
List<ChatterTopics__c> ChatterTopics = new List<ChatterTopics__c>();
 for(FeedItem FeedItem : Trigger.new)
 {  
  String SObjName = FeedItem.parentId.getSObjectType().getDescribe().getName();
 if(FeedItem.body.contains('#'))
 {
   if(SobjName.equals('Account'))
   {
      if(!MapFeedItem.containsKey(FeedItem.parentId))
      {
       set<FeedItem> Dummy = new set<FeedItem>();
       Dummy.add(FeedItem);
       MapFeedItem.put(FeedItem.parentId,Dummy);
      }
      else
      {
       set<FeedItem> Dummy = new set<FeedItem>();
       Dummy=MapFeedItem.get(FeedItem.parentId);
       Dummy.add(FeedItem);
       MapFeedItem.put(FeedItem.parentId,Dummy);
      }
    }  
  } 
 }
    
    if(MapFeedItem.keySet().size()>0)
    {
    for(Account acc : [select id,(select id from Account.Opportunities) from Account where id in:MapFeedItem.keySet()])
    {
        Boolean Flag = false;
        for(FeedItem FI : MapFeedItem.get(acc.Id)) 
         { 
          for(Opportunity opp : acc.Opportunities)
           {
            ChatterTopics__c CT = new ChatterTopics__c();
            CT.Account__c = acc.Id ;
            CT.Opportunity1__c =  opp.id ;
            CT.Topic_Body__c = FI.Body ;
            ChatterTopics.add(CT);
            Flag  = true;
          }
           if(!Flag)
           {
            ChatterTopics__c CT = new ChatterTopics__c();
            CT.Account__c = acc.Id ;
            CT.Topic_Body__c = FI.Body ;
            ChatterTopics.add(CT);
           }
        }
     }
         
    
    insert ChatterTopics;
    
    }
    }
   
    if(Trigger.isdelete)
    {
      set<String> Str = new set<String>();
      List<ChatterTopics__c> ChatterTopicId = new List<ChatterTopics__c>();
      List<id> AccountIds = new List<id>();
      for(FeedItem FeedItem : Trigger.old)
         {  
           String SObjName = FeedItem.parentId.getSObjectType().getDescribe().getName();
           if(FeedItem.body.contains('#'))
             {
             if(SobjName.equals('Account'))
               {
                 Str.add(FeedItem.body);    
                 AccountIds.add(FeedItem.parentId);
                 
            
               }
             }
         }
        for( ChatterTopics__c ChatterTopics  : [select id,Topic_Body__c from ChatterTopics__c where
                                        Account__c in:AccountIds])
           {
              
                                        
                  
                  if(Str.contains(ChatterTopics.Topic_Body__c))
                  {
                    ChatterTopicId.add(ChatterTopics);
                  }
                  
             }
             
             
               if(ChatterTopicId.size()>0)
               {
        delete ChatterTopicId;
        }
    }
}