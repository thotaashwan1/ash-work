trigger streamlineCollectionsAndQueries on Account (before insert, before update, before delete) {
    
    List<Account> listAccountAndOpps = new  List<Account>();
    if(Trigger.isBefore && (Trigger.isUpdate || Trigger.isDelete)){
    listAccountAndOpps = [SELECT Id, Name, (SELECT Id, closedate, stagename FROM Opportunities 
                                            WHERE (stagename = 'Closed - Lost' or stagename = 'Closed - Won'))
                                            from Account where Id IN : Trigger.NewMap.keyset()];
    
        for(Account a : listAccountAndOpps){
            for(Opportunity o : a.Opportunities){
                if(o.stagename == 'Closed - Lost'){
                    o.Amount = 0;
                    system.debug('Opportunity Closed - Lost');
                }else if(o.stagename == 'Closed - Won'){
                    o.Amount = 20000;
                    system.debug('Opportunity Closed - Won');
                }else o.Amount = 10000;
            }
        }
    }
    

}