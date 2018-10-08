trigger ContentVersionTrigger on ContentVersion (before insert,before update,after insert,after update) {
   if(Trigger.isInsert)
   {
    System.debug('+++++ContentVersionTriggerINSERT '+Trigger.new);
    }
     if(Trigger.isUpdate)
   {
    System.debug('+++++ContentVersionTriggerUPDATE '+Trigger.new);
    }
}