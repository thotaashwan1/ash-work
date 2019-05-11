trigger OpportunityAmt on Opportunity (before insert, before update) {
    FOR(Opportunity opp : Trigger.New){
        IF(Trigger.isInsert & opp.Amount > 10000)
            opp.addError('For inserts the amount cannot be more than 10K');
        ELSE IF(Trigger.isUpdate & opp.Amount > 25000)
            opp.addError('For updates the amount cannot be more than 25K');
    }

}