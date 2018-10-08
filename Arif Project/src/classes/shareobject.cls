public class shareobject {
    set<string> b = new set<String>{'System Administrator'};
    public boolean bh { get; set; }
    public User pro { get; set; }
    public String sa { get; set; }
public Sharing_Rule_obj__c sha { get; set; }
public shareobject()
{
 sha = [Select id,name,Company__c,picklist__c from Sharing_Rule_obj__c limit 1];
 pro = [Select profile.name from User where id =: userinfo.getuserid() limit 1];
 if(b.contains(pro.profile.name))
 {
   bh=true;
 }
}
public void df()
{
  sha = [Select id,name,Company__c,picklist__c from Sharing_Rule_obj__c where id = 'a0r0I00004sGzff' limit 1];
}
}