public class transisentCon {

   public Account acc1 { get; set; }

   


public transisentCon ()
{
 acc1 = [Select name from Account Limit 1];
}
}