trigger Oppoy on OpportunityTeamMember (After insert) {
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
        //creating message body
ConnectApi.MessageBodyInput messageBodyInput = new ConnectApi.MessageBodyInput();

//Creating segments
messageBodyInput.messageSegments = new List<ConnectApi.MessageSegmentInput>();

//creating text segment
ConnectApi.TextSegmentInput textSegmentInput = new ConnectApi.TextSegmentInput();
textSegmentInput.text = 'Hi ';
messageBodyInput.messageSegments.add(textSegmentInput);
System.debug('*****'+textSegmentInput);

//Creating mention segment
ConnectApi.MentionSegmentInput mentionSegmentInput = new ConnectApi.MentionSegmentInput();
mentionSegmentInput.id = opptm.UserId;
messageBodyInput.messageSegments.add(mentionSegmentInput);

//creating text segment
textSegmentInput = new ConnectApi.TextSegmentInput();
textSegmentInput.text = ' Welcome to '+ opptm.Opportunity.name +' opportunity team ' ;
messageBodyInput.messageSegments.add(textSegmentInput);

System.debug('*****'+textSegmentInput);
 
//Create Feeditem and built body
ConnectApi.FeedItemInput Input = new ConnectApi.FeedItemInput();
Input.body = messageBodyInput;
Input.subjectId = opptm.OpportunityId;
ConnectApi.ChatterFeeds.postFeedElement(null,Input); 

}
}


       }