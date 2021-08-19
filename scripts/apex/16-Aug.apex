try {
    Account acct = [select id, name from Account where name like '%Account%'];
    System.debug('>>>>> ' + acct.name);
} catch (Exception e) {
    System.debug('Exception occured: ' + e.getMessage());
}
