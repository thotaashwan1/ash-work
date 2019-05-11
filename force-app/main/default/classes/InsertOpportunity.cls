public class InsertOpportunity {
    public Opportunity objOpp{get;set;}
    public InsertOpportunity(){
        objOpp = new Opportunity();
    }
    public void insertOpp(){
        try{
            system.debug('Before insert');
            insert objOpp;
            system.debug('record inserted');
            objOpp = new Opportunity();
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.info,'Opportunity Record Inserted Successfully');
            ApexPages.addMessage(myMsg);
        }
        Catch(exception ex){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,ex.getMessage());
            ApexPages.addMessage(myMsg);
        }
        
    }

}