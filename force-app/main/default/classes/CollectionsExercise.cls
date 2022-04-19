public with sharing class CollectionsExercise {
    private static List<Account> insertAccounts(Integer numAccounts) {
        List<Account> accounts = new List<Account>();

        for (Integer i = 0; i < numAccounts; i++) {
            accounts.add(new Account(Name = 'Sample Account - ' + i));
        }
        insert (accounts);

        return accounts;
    }

    public static List<Opportunity> insertOpportunities(Integer numAccounts) {
        List<Opportunity> opportunities = new List<Opportunity>();
        List<Account> accounts = CollectionsExercise.insertAccounts(numAccounts);

        for (Account a : accounts) {
            Integer numOpportunities = (Integer)(Math.random() * 10);
            for (Integer i = 0; i < numOpportunities; i++) {
                Opportunity o = new Opportunity(Name = 'Sample Opportunity - ' + i, 
                                        CloseDate = System.today() + 20, 
                                        StageName = 'Qualification', 
                                        Amount = (100000 * Math.random()).round(),
                                        AccountId = a.Id );
                opportunities.add(o);
            }
        }
        insert (opportunities);

        return opportunities;
    }

    public static List<Opportunity> getOpportunities() {
        return [select id, name, amount, account.name
                  from Opportunity
                 where name like 'Sample%'];
    }
}
