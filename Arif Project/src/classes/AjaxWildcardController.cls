public class AjaxWildcardController {

    public PageReference save() {
    update accList;
    update conList;
        return null;
    }

Public string inputtext{get;set;}
    Public List<account> accList{get;set;}
    Public List<contact> conList{get;set;}
    Public boolean flagshow{get;set;}
    Public Integer size{get;set;}
    Public AjaxWildcardController(){
    flagshow = false;
    size = 8;
    system.debug('constructor'+size);
    }    
    
    Public void actionSupMethod(){
     system.debug('inputtext-->'+inputtext);
    
      accList = database.Query('select name,accountnumber from account where name like '+'\''+'%'+inputtext+'%'+'\'');
     this.size = accList.size();
      conList = database.Query('select name from contact where name like '+'\''+'%'+inputtext+'%'+'\'');
    
    }
        

}