trigger accountname on Account (after insert)
{
  if(Trigger.isAfter && Trigger.isInsert)
  {
   List<AccountShare> lstAccShare = new List<AccountShare>();
    for(account acc:Trigger.new)
    {
      AccountShare c = new AccountShare();
      c.AccountId = acc.id;
      c.UserOrGroupId = '00528000004OVFM';
      c.AccountAccessLevel = 'Read';
      c.OpportunityAccessLevel  = 'Read';
      lstAccShare.add(c);
    } 
    List<Database.SaveResult> accountInsertResults = Database.insert(lstAccShare,false);
  }
}