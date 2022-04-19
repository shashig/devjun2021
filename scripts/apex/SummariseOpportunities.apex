//Run the below only once. This will insert 100 accounts and then 
//insert between 0 to 9 opportunities (randomly) for each account. 
List<Opportunity> opps = CollectionsExercise.insertOpportunities(100);

//Once you have run the above, you can get the inserted opportunities 
//using below call. It uses 'Sample%' as the name pattern to get opportunities.
//The following can be run any number of times. 
List<Opportunity> savedOpps = CollectionsExercise.getOpportunities();

//Objective is to get two maps as follows. The key would be Account Name.
Map<String, Integer> opportunityCounts;
Map<String, Double> opportunityAmounts;

/* Sample input and output data
***** Input *****
Account-Name, Opportunity-Name, Opportunity-Amount
Sample-Account-1, Sample-Opportunity-1, 255
Sample-Account-1, Sample-Opportunity-2, 223
Sample-Account-2, Sample-Opportunity-1, 2454
Sample-Account-2, Sample-Opportunity-2, 1235
Sample-Account-2, Sample-Opportunity-3, 213534
Sample-Account-2, Sample-Opportunity-4, 12366

***** Opportunity Counts Map *****
Sample-Account-1 -> 2
Sample-Account-2 -> 4

***** Opportunity Amounts Map *****
Sample-Account-1 -> 478
Sample-Account-2 -> 229589
*/