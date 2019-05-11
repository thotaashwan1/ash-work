trigger AccountDeletion on Account (before delete) {
    
    for(Account a : [SELECT ID FROM Account WHERE ID IN (SELECT AccountID FROM Opportunity) AND ID IN : Trigger.Old]){
        Trigger.OldMap.get(a.Id).addError('Cannot delete account with related Opportunities.');
    }

}