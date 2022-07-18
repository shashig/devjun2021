public with sharing class MyBatchClass implements Database.Batchable<sObject>, Database.Stateful {
    String query = 'select id, name from Account';
    Integer executeCount = 0;
    Integer recordCount = 0;
    
    public Database.QueryLocator start(Database.BatchableContext BC) {
        System.debug('Came to start method @ ' + System.now());
        return (Database.getQueryLocator(query));
    }

    public void execute(Database.BatchableContext BC, List<sObject> scope) {
        executeCount++;
        System.debug('Came to execute method @ ' + System.now() + '. Number of records: ' + scope.size() + '. Execution count: ' + executeCount);
        recordCount += scope.size();
        //Account acct = (Account)scope[0];
        List<Account> accounts = (List<Account>)scope;
        Integer index = 1;
        for (Account a : accounts) {
            a.Description = '' + ((executeCount - 1) * 30 + index++);
        }
        Database.update(accounts, false);
        //System.debug('Account Name: ' + acct.Name);
    }

    public void finish(Database.BatchableContext BC) {
        System.debug('Came to finish method @ ' + System.now());
        System.debug('execute ran ' + executeCount + ' times.');
        System.debug('Records Processed: ' + recordCount + '.');
    }
}
