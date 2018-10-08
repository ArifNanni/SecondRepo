Public Class WrapperAll
{
 Public Integer Salary;
 
 
   
  Public WrapperAll(String str)
 {
  WrapperDeSerialize obj3 = (WrapperDeSerialize)JSON.Deserialize(str,WrapperDeSerialize.class);
   System.debug('obj1'+obj3);
 }  
 
 Public WrapperAll()
 {
  Wrapper w = new Wrapper();
  //w.Age = 25;
   Wrapper1 w1 = new Wrapper1();
   w1.st1 = 143;
   w1.st1_Name = 'Arif';
  w.w1 = w1; 
   Wrapper2 w2 = new Wrapper2();
   w2.sal= 143000;
   w2.emp_Name= 'Nanni';
  w.w2 = w2; 
    
    
   string sBody = JSON.serialize(w,true);
   System.debug('Body::'+sBody);
   
   Wrapper obj1 = (Wrapper)JSON.Deserialize(sBody,Wrapper.class);
   System.debug('obj1'+obj1);
   
   Wrapper obj2 = (Wrapper)JSON.Deserialize(sBody.unescapeCsv().remove('\\'),Wrapper.class);
   System.debug('obj2'+obj2);
   
   WrapperDeSerialize obj3 = (WrapperDeSerialize)JSON.Deserialize(sBody,WrapperDeSerialize.class);
   System.debug('obj1'+obj3); 
 }
 
 Public Class WrapperDeSerialize
 {
  Public Integer Age;
  Public Wrapper1 w1;
  Public Wrapper3 w3;
  }
 
 Public Class Wrapper
 {
  Public Integer Age;
  Public Wrapper1 w1;
  Public Wrapper2 w2;
 }
 Public Class Wrapper1
 {
  Public Integer st1;
  Public String  st1_Name;
 }
 Public Class Wrapper2
 {
  Public Integer sal;
  Public String  emp_Name;
 }
  Public Class Wrapper3
 {
 
 }
 
}