global class AttachExcelToMyAccount {
    webservice static string GenerateExcel(string actId){
        string strMesg = '';
        MyAccount__c objAct = [select id,Name,XMLResponse__c from MyAccount__c where id =:actId];
        if(objAct.XMLResponse__c != null){
            system.PageReference PageRef = Page.GenerateEXCELForMyAct;
            PageRef.getParameters().put('Id',objAct.Id);
            Blob body = Test.isRunningTest() ? Blob.valueOf('String toBlob') : PageRef.getContent();
            Attachment att = new Attachment();
            att.body = body;
            att.Name = 'XML Response'+objAct.Name+'.xls';
            att.ParentId = objAct.Id;
            insert att;
        }else{
            return 'No XML to Parse';
        }
        return strMesg;
    }
}