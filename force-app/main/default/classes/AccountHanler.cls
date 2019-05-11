public class AccountHanler {
    
    Public Static List<Opportunity> listOpps{get;set;}

    Public static void createNewOpp(List<Account> listActs){
        for(Account a : listActs){
            Opportunity opp = new Opportunity();
            opp.Name = a.Name + ' - Opportunity';
            opp.AccountId = a.Id;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today().addMonths(1);
            listOpps.add(opp);
        }
        if(listOpps.size() > 0){
            insert listOpps;
        }
    }

}