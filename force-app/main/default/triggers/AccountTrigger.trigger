trigger AccountTrigger on Account (before insert, after insert, before update, after update) {
    System.debug('Trigger.isExecuting: ' + Trigger.isExecuting);
    System.debug('Trigger.size: ' + Trigger.size);
    System.debug('Trigger.operationType: ' + Trigger.operationType);
}