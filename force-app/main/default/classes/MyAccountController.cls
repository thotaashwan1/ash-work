public class MyAccountController {
    public MyAccount__c myAct {get;set;}
    public boolean ed = false;
    public MyAccountController(){
      myAct = new MyAccount__c();
        
    }
    
    public apexPages.PageReference save(){
    system.debug('Save Function');
    insert myAct;
    try{
        if(myAct != null){
            return new apexPages.PageReference('/apex/MyAccountDetail');
            }
        }
        catch(system.DMLException e){
            ApexPages.AddMessage(new ApexPages.Message(ApexPages.Severity.Error,e.getMessage()));
        }
        return null;           
    
}

    public apexPages.PageReference edit(){
        boolean ed = true;
        return null;
    }

}