trigger ParentTrigger on Parent_Object__c (before insert) {
  ParentTriggerHelper.processRecords(Trigger.new);
}