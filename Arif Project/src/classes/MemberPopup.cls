public class MemberPopup 
{
    public List<Contact> memberList {get;set;}
    public List<Contact> memberAddList {get;set;}
    public String memberName {get;set;} 
    public list<contact> con = new list<contact>();
     
    public MemberPopup()
    {
        String sql = 'SELECT LastName, Email FROM Contact limit 12';
        memberList = Database.Query(sql);
        memberAddList = new List<contact>();
        for(contact memberList1 : memberList)
        memberAddList.add(memberList1);
    }
    public void upserti()
    {
      for(Integer i=0 ;i<memberAddList.size() ;i++)
      {
        if(memberAddList[i].LastName == '')
        {
          memberAddList.remove(i);
        }
      
      // return null;
      }
      upsert memberAddList;
    }
    
    public void AddRow()
    {
        memberAddList.add(new contact());
    }  
}