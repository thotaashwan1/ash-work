//Create opportunities for an account if it doesn't have any related opportunities
trigger AddRelatedRecord on Account (after insert, after update) {
    
    List<Opportunity> listOpps = new List<Opportunity>();
    Map<Id,Account> mapAcctOpp = new Map<Id, Account>([SELECT ID, (SELECT ID FROM Opportunities) FROM Account WHERE ID =: Trigger.New]);
    
    for(Account a : Trigger.New){
        system.debug('mapAcctOpp.get(a.Id).Opportunities.size()'+mapAcctOpp.get(a.Id).Opportunities.size());
        if(mapAcctOpp.get(a.Id).Opportunities.size() == 0){
            listOpps.add(new Opportunity(Name=a.Name+' Opportunity',
                                        StageName='Prospecting',
                                        CloseDate=System.today().addMonths(1),
                                        AccountId=a.Id));
        }
    }
    if(!listOpps.isEmpty()){
        insert listOpps;
        system.debug('listOpps: '+listOpps);
    }

}