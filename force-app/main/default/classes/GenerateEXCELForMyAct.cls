public class GenerateEXCELForMyAct {
    public List<ParseXML> lstParseXML{get;set;}
    public string name;
    public GenerateEXCELForMyAct(){
        string actId = ApexPages.currentPage().getParameters().get('Id');
        MyAccount__c objAct = [select Id,XMLResponse__c from MyAccount__c where id = : actId];
        lstParseXML = new List<ParseXML>();
        Dom.Document doc = new Dom.Document();
        doc.load(objAct.XMLResponse__c);
        name = doc.getRootElement().getAttributeValue('for','');
        for(Dom.XMLNode xNode : doc.getRootElement().getChildElements()){
            string agency = xNode.getAttributeValue('_ReportingAgency','');
            integer score = Integer.valueOf(xNode.getAttributeValue('_CreditScore',''));
            lstParseXML.add(new ParseXML(agency,score));
            system.debug('**lstParseXML**'+lstParseXML);
            system.debug('**agency**'+agency);
            system.debug('**score**'+score);
        }
        
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