public class ApexClass
{
  
  Public static void  ApexMethodname(List<contact> list_con)
  {
     /* internal search */
     
    List<id> list_acc = new List<id>();
   // Contact con=new Contact();
                 for(contact con : list_con)
                      {
                            
                        Account a=con.Account;
                       //  System.debug('aaaaa'+list_con);
                        //  System.debug('bbbbb'+con);
                         // System.debug('ccccc'+a);
                         System.debug('++++'+con.Name);
                          System.debug('----'+con.account.Name);
              
               
                           
                      }
            }
 }