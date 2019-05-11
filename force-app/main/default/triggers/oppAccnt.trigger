trigger oppAccnt on Account (after insert) {
    List<Opportunity> Newopps = New List<Opportunity>();
    FOR(Account acc : Trigger.New){
        Opportunity opp = New Opportunity();
        opp.Name = acc.Name + 'Opportunity';
        opp.StageName = 'Prospecting';
        opp.CloseDate = Date.today() + 90 ;
        opp.AccountId = acc.Id;
        Newopps.add(opp);
        
    }
    insert Newopps;

}