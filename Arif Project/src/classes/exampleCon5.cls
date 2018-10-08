public class exampleCon5 {

    public exampleCon5()
    {
      S1 = [Select name from Account limit 1];
      
    }

 public Integer count = 999;
 public List<Account> S1 {get; set;}

       public PageReference incrementCounter() {
        S1 = Database.query('Select name from Account limit '+(count+1));
       for(integer i=0 ; i<=1000 ;i++)
       {}
     System.debug('++++'+S1);
             count = count + 1;
 return null;
   }

                         
    public Integer getCount() {
return count;

    }

}