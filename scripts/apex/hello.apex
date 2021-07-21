List<Parent_Object__c> parents = [select id, name from Parent_Object__c];
System.debug('Number of parents: ' + parents.size());