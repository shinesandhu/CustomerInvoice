public class CustomerTriggerHelper
{
    public static void demo(List<Customer__c> custList, Map<Id, Customer__c> oldMapCustomer)
    {
        //Demo method is passing in two inputs (Starting point is Customer records)
        //List<Customer__c> custList = Passing Customer records in a List
        //Map<Id, Customer__c> oldMapCustomer = Keeping old Customer record values intact
        
        //All Invoice records will be stored in this List
        List<Invoice__c> invList = new List<Invoice__c>();
 
 
        //We're comparing Customer records with custList
        //for(Customer__c cust : trigger.new)
        for(Customer__c cust : custList)
        {
             //Trigger.oldMap is replaced by oldMapCustomer  
             //if(cust.Customer_Status__c == 'Active' && trigger.oldMap.get(cust.id).Customer_Status__c != 'Active')
             if(cust.Customer_Status__c == 'Active' && oldMapCustomer.get(cust.id).Customer_Status__c != 'Active')
             {
                 Invoice__c inv = new Invoice__c();
                 inv.Customer__c = cust.id;
                 inv.Description__c = 'This record is created by a trigger';
                 inv.Status__c = 'Pending';
                 invList.add(inv);   
             }
  
        }    
                insert invList;
    }
}