public class soqlquery06
{
    public static void demo()
    {
       //SOQL Binding Example: Change value at one place only
       //Variables can be refered by : notation
       
       string cust1 = 'Philips';
       
       List<Customer__c> custList1 = [select id, name from Customer__c where name =: cust1]; 
       List<Customer__c> custList2 = [select id, name from Customer__c where name =: cust1];
       List<Customer__c> custList3 = [select id, name from Customer__c where name =: cust1]; 
       List<Customer__c> custList4 = [select id, name from Customer__c where name =: cust1];
       List<Customer__c> custList5 = [select id, name from Customer__c where name =: cust1]; 
       
       System.debug('custList1 values are : '+custList1);  
       System.debug('custList2 values are : '+custList2);  
       System.debug('custList3 values are : '+custList3);
       System.debug('custList4 values are : '+custList4);
       System.debug('custList5 values are : '+custList5);
    
    }
    //soqlquery06.demo();
}