public class ListViewController
{
    public list<selectoption> objectlist{set;get;}
    public string objectname{set;get;}
    public list<selectoption> viewoption{set;get;}
    public string listid{set;get;}
    
    public ListViewController()
    {
        objectlist = new list<selectoption>();
        objectname='Lead';
        objectlist.add(new selectoption('Lead','Lead'));
        objectlist.add(new selectoption('Account','Account'));
        objectlist.add(new selectoption('Contact','Contact'));
        viewoption= new list<selectoption>();
        getlistopt();
        
    }
    
    public pagereference getlistopt()
    {
        viewoption.clear();
        
        String q = 'SELECT Name FROM '+ objectname+' LIMIT 1';
        ApexPages.StandardSetController ACC = new ApexPages.StandardSetController(Database.getQueryLocator(q));
        List<SelectOption> ListViews = ACC.getListViewOptions();
        
        viewoption.addall(ListViews) ;
        return null;
    }
    

}