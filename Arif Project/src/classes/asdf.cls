public class asdf {
  public String search;
   public String getSearch() {
        return search;
    }

   public void setSearch(String s) {
        search = s;
    }

   
   
   

list<contact> accounts; 
    public asdf(ApexPages.StandardSetController controller) {
    

    }
                   public list<contact> getAccounts() {
               
                   return accounts;
                   
                           
    }
    public PageReference save1()
    { accounts = [select id,name from contact where name like :search+'%'];
    System.debug('yes happening'+accounts.size());
        
    return null;}
   
                 
   
    }