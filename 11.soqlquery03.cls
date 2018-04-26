public class soqlquery03
{
    public static void demo()
    {
          //We're running query to fetch all Child records along with Parent record
          //We want all Invoice__c records of Customer__c = Apple  
         
         //Parent - Child relationship, you're working with more than one record here.
         //Invoices__r is pulling Child relationship. It's Invoices and not Invoice
         // SOQL query goes from Parent > Child
        
         List<Customer__c> custList = [select id, name, (select id, name from Invoices__r) from Customer__c where name = 'Apple'];
         System.debug('The Customer record is : '+custList);
         
         //This is how we obtain the Child records 
         List<Invoice__c> invList = custList[0].Invoices__r;
         System.debug('The Invoice records are : '+invList);    
    }
    //soqlquery03.demo();
}