//Querying parent from child
List<Child_object__c> children = [select id, name, Parent_Object__c, 
                                         Parent_Object__r.Name, Parent_Object__r.OwnerId, 
                                         Parent_Object__r.Owner.Name, Parent_Object__r.Owner.UserName  
                                    from Child_object__c
                                  order by Parent_Object__r.Name];

for (Child_object__c childObj : children) {
    System.debug('>>> Child: ' + childObj.Name + ', Parent: ' + childObj.Parent_Object__r.Name);
}

//Querying children from parent
List<Parent_Object__c> parents = [select id, name, 
                                         (select id, name from Child_Objects__r) 
                                    from Parent_Object__c];
System.debug(parents);
for (Parent_Object__c parent : parents) {
    System.debug(parent.Name);
    List<Child_object__c> children = parent.Child_Objects__r;
    for (Child_object__c childObj : children) {
        System.debug('>>> Child: ' + childObj.Name);
    }
}