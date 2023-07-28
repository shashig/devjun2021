public without sharing class ApexSecurityDemo {
    @AuraEnabled(Cacheable=true)
    public static List<Apex_Security_Demo__c> getApexSecurityDemoRecords() {
      return [select id, name, Your_Mood__c 
                from Apex_Security_Demo__c 
                with security_enforced
               order by CreatedDate
             ];
    }
}