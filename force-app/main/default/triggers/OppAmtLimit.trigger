trigger OppAmtLimit on Opportunity (before insert, before update) {
    Double Total = 0;
    List<Opportunity> opp = [SELECT Name, Amount FROM Opportunity WHERE CreatedDate = TODAY];
    FOR(Opportunity opp2 : opp){
        Total = opp2.Amount+Total;
    }
    
    FOR(Opportunity o : Trigger.New){
        IF((o.Amount+Total) > 50000)
            o.addError('You cannot create or update an opportunity as the limit for the day is 50K only');
    }
        
        

}