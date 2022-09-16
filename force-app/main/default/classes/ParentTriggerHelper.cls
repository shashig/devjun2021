public with sharing class ParentTriggerHelper {
  static Integer executionCount = 0;

  public static void processRecords(List<Parent_Object__c> parents) {
    executionCount = executionCount + 1;
    System.debug('>>>> Execution Number: ' + executionCount);
    Map<String, Integer> counts = new Map<String, Integer>();

    for(Parent_Object__c po : parents) {
      if (counts.containsKey(po.Description__c)) {
        counts.put(po.Description__c, counts.get(po.Description__c) + 1);
      } else {
        counts.put(po.Description__c, 1);
      }
    }

    if (counts.size() > 0) {
      List<Summary__c> summaries = new List<Summary__c>();
      for (String key: counts.keySet()) {
        summaries.add(new Summary__c(Name = key, count__c = counts.get(key)));
      }
      insert(summaries);
    }
  }
}
