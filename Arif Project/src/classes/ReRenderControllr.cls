public class ReRenderControllr {

 Public string OutPutString{get;set;}
   
  Public ReRenderControllr(){
    OutPutString = 'Test value set in Constructor';
  }
   
  Public void ShowBlockMethod(){
   OutPutString = 'value set in method called by button click' ;
  }
  

}