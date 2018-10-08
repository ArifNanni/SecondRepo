trigger OpportunityTeamMemberHelper on OpportunityTeamMember (after insert) {
List<FeedItem> FIList = new List<FeedItem>();
Map<id,string> strconcat = new Map<id,string>();
set<id> TeamMemberId =new set<id>();
set<id> TeamMemberUserId =new set<id>();
 if(trigger.isInsert){
 for(OpportunityTeamMember newOpptyTM: trigger.new) {
           
          TeamMemberUserId.add(newOpptyTM.UserId);
          TeamMemberId.add(newOpptyTM.Id);
          }
 for( OpportunityTeamMember opptm : [SELECT Name,Opportunity.name,OpportunityId,UserId,user.id,user.name FROM OpportunityTeamMember WHERE UserId in : TeamMemberUserId
                                               and id in:TeamMemberId])
      {
string temp = 'Hi '+opptm.user.name +'id  '+ opptm.user.id+'idf'+opptm.user.id+' welcome to '+opptm.Opportunity.name+' Opportunity Team ';
            strconcat.put(opptm.id,temp);
       }
                                                  
                                          
        for(OpportunityTeamMember temp: trigger.new) {
 
        FeedItem FI = new FeedItem();
         
           //String str = opptm.user.name ;
           //system.debug('Hiiii'+str);  
           // system.debug('--'+oppty.User.username);
            FI.Body = strconcat.get(temp.id);
             FI.ParentId = temp.OpportunityId;
            FIList.add(FI);
          }
       
           if(FIList.size() > 0) {
        insert FIList;
                 }

}
}