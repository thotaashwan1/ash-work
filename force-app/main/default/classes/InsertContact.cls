public class InsertContact {
    public Contact objCont{get;set;}
    public List<Contact> ContactsList{get;set;}
    public ID RecordId{get;set;}
    public Contact CurrentCont{get;set;}
    
    public InsertContact(){
        objCont = new Contact();
        ContactsList = new List<Contact>([select id,FirstName,LastName,Phone,Email,Fax from Contact]);

    }
    
    public void insertRec(){
        system.debug('***RecordId****'+RecordId);
        try{
            if(objCont.id != null){
                upsert objCont;
            }
            else{
                insert objCont;
            }
            objCont = new Contact();
            ContactsList = new List<Contact>([select id,FirstName,LastName,Phone,Email,Fax from Contact]);
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.info,'inserted successfully');
            ApexPages.addMessage(myMsg);
        }
        catch(exception ex){
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Error, ex.getMessage());
            ApexPages.addMessage(myMsg);
        }
    }
    
    public string displayContact(){
        system.debug('***RecordId****'+RecordId);
        objCont = [SELECT id,FirstName,LastName,Phone,Email,Fax from Contact WHERE id = :RecordId];
        return null;
    }
    
    public void sendEmail(){
    try{
        string errorMesg = '';
        objCont = [SELECT id,FirstName,LastName,Phone,Email,Fax from Contact WHERE id = :RecordId];
        if(objCont.id != null && objCont.Email != null){
            objCont.setEmail__c = True;
            upsert objCont;
            system.debug('**Email Address:**'+objCont.setEmail__c);
            system.debug('**Receipient Email: **'+objCont.Email);
            errorMesg = 'Email has been sent successfully !';
        }
        else{
            objCont.setEmail__c = False;
            upsert objCont;
            errorMesg = 'Email address is null, enter valid email address';
        }
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Info, errorMesg);
        ApexPages.addMessage(myMsg);
    }
    catch(exception e){
        ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.Error, e.getMessage());
        ApexPages.addMessage(myMsg);
    }
    }   
}