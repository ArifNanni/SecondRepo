public class test111
{
     @future
    public static void processRecords()
    {   
         // Get those records based on the IDs
         List<Account> accts = [SELECT Name FROM Account];
         processRecords1();
         // Process records
    }   
    
    public static void futuremethod(){
    
    for(integer i =0 ; i<100 ; i++)
    {
    List<Account> acc = [Select id from Account limit 1];
    } 
  }
  
 
    public static void processRecords1()
    {   
         // Get those records based on the IDs
         List<Account> accts = [SELECT Name FROM Account];
         // Process records
    }   
}