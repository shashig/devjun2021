//EC__c - Input data
//Constituency__c = external id field Constituency_Id__c
//Candidate_Constituency__c
//Account = Party with external Id field Party_Id__c

//key = party_name__c, value = party_id__c
static Map<String, String> partiesMap = new Map<String, String>(); 

//key = candidate_name__c, value = party_id__c
static Map<String, String> candidatesMap = new Map<String, String>(); 

static List<Constituency__c> constituencies = new List<Constituency__c>();

public static void processElectionData() {
  List<EC__c> electionInfoList = [select party_name__c, party_id__c, 
                                        candidate_name__c, constituency_name__c,
                                        constituency_id__c, votes__c, etc. 
                                    from EC__c
    ]; 

  for (EC__c ec : electionInfoList) {
    partiesMap.put(ec.party_name__c, ec.party_id__c);
    candidatesMap.put(ec.candidate_name__c, ec.party_id__c);
    constituencies.add(new Constituency__c(Name = ec.constituency_name__c,
                                Constituency_Id__c = ec.Constituency_Id__c,
                                etc.
                            )
                      );
  }
  //insert parties and candidates
  insertParties();
  List<Contact> candidates = insertCandidates(); 
  
  //once inserted, list will have candidate ids also. Convert to map
  //Key = LastName, ID = Contact Id
  Map<String, Id> candidateIdsMap = new Map<String, Id>();
  for (Contact c : candidates) {
    candidateIdsMap.put(c.LastName, c.Id);
  }

  //No special processing for constituencies. Just insert them. 
  insert constituencies;

  //Insert candidate constituenies
  insertCandidateConstituency(electionInfoList, candidateIdsMap);
}

private static void insertParties() {
  List<Account> parties = new List<Account>();
  for (String partyName : partiesMap.keySet()) {
    parties.add(new Account(Name = partyName, Party_Id__c = partiesMap.get(partyName)));
  }
  //technically not required as we know that the list will have items
  if (parties.size() > 0) {
    insert parties;
  }
}

private static List<Contact> candidates insertCandidates() {
  List<Contact> candidates = new List<Contact>();
  for (String candidateName : candidatesMap.keySet()) {
    String partyId = candidatesMap.get(candidateName);
    Account candidateParty = new Account(Party_Id__c = partyId);
    candidates.add(new Contact(LastName = candidateName, Account = candidateParty));
  }
  //technically not required as we know that the list will have items
  if (candidates.size() > 0) {
    insert candidates;
  }

  //We need to return candidates to have the ids of the inserted candidates
  return candidates;
}

private static void insertCandidateConstituency(List<EC__c> electionInfoList,
                                                Map<String, Id> candidateIdsMap) {
  List<Candidate_Constituency__c> ccs = new List<Candidate_Constituency__c>();
  for (EC__c ec : electionInfoList) {
    Candidate_Constituency__c cc = new Candidate_Constituency__c(
      Votes__c = ec.Votes__c,
      etc.
    );

    //set parent candidate id
    cc.Candidate_Id__c = candidateIdsMap.get(ec.candidate_name__c);

    //set parent Constituency
    Constituency__c const = new Constituency__c(Constituency_Id__c = ec.Constituency_Id__c);
    cc.Constituency__r = const; 

    //add to list
    ccs.add(cc);
  }

  if (ccs.size() > 0) {
    insert ccs;
  }
}