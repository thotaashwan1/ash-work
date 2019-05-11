global class AttachXMLToCandidate {
    webservice static string GenerateExcel (string candId){
        string strMesg = '';
        system.debug('**CandID from button: **'+candId);
        Candidate__c objCand = [select Id,Name,XMLResponse__c from Candidate__c where Id = :candId];
        system.debug('**Candidate Object: **'+objCand);
            if(objCand.XMLResponse__c != null){
            system.PageReference pageRef = Page.GenerateExcelpage;
            pageRef.getParameters().put('Id',objCand.Id);
            blob body = Test.isRunningTest() ? blob.valueof('string of blob') : PageRef.getContent();
            system.debug('**Body** '+body);
            Attachment att = new Attachment();
            att.body = body;
            att.Name = 'XMLResponse'+objCand.Name+'.xls';
            att.ParentId = objCand.Id;
            insert att;
        }else{
            strMesg = 'No XML to Parse';
        }
        return strMesg;
    }

}