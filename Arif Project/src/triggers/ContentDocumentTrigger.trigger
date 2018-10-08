trigger ContentDocumentTrigger on ContentDocument (before insert,before update,after insert,after update) {
   if(Trigger.isInsert)
   {
    System.debug('+++++ContentDocumentTriggerINSERT ');
    }
    if(Trigger.isupdate)
   {
    System.debug('+++++ContentDocumentTriggerUPDATE ');
    }
}