Global class accountProcessBatch implements database.batchable<sObject>{
    global list<Account> start(Database.batchableContext bc){
        list<Account> lstAccount = [select id,Name,industry,type,phone from Account where Name != null];
        return lstAccount;
    }
    global void execute(Database.BatchableContext bc, list<Account> lstscope){
        system.debug(''+lstscope);
    }
    global void finish(database.Batchablecontext bc){
        
    }
    
}