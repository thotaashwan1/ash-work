public class GenerateExcel {
    public List<ParseXML> lstParseXML{get;set;}
    String name = '';
    public GenerateExcel(){
        string candId = ApexPages.currentPage().getParameters().get('Id');
        system.debug('**CandID: **'+candId);
        Candidate__c objCand = [select Id,XMLResponse__c from Candidate__c where Id = :candId];
        lstParseXML = new List<ParseXML>();
        string xml = objCand.XMLResponse__c;
        Dom.Document doc = new Dom.Document();
        doc.load(xml);
        name = doc.getRootElement().getAttributevalue('for','');
        for(Dom.XMLNode xNode : doc.getRootElement().getChildElements()){
            integer score = Integer.valueOf(xNode.getAttributevalue('_CreditScore',''));
            string agency = xNode.getAttributeValue('_ReportingAgency','');
            lstParseXML.add(new ParseXML(agency,score));
        }
        system.debug('**List ParseXML: **'+lstParseXML);
    }
    
    public class ParseXML{
        public string agency{get;set;}
        public integer score{get;set;}
        
        public ParseXML(string agency, integer score){
            this.agency = agency;
            this.score = score;
                        
        }
    }

}