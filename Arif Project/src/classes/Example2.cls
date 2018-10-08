public class Example2 {


public Integer bvalue {get;set;}
public Integer avalue {get;set;}
public Integer result {get;set;}
public string operation {get;set;}

public Example2()
{
Account a=[select id from Account limit 1];

 }

public pagereference subb()
{
SYSTEM.DEBUG('A1'+BVALUE);
SYSTEM.DEBUG('B1'+AVALUE);
SYSTEM.DEBUG('r1'+result);
result=avalue-bvalue;
operation='subraction';
return null;
}


}