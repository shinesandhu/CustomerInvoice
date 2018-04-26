public class upsertrecord
{
    public static void demo()
    {
        //Upsert = Insert + Update
        //We're inserting 20 Customer records like Nike1,Nike2...
        //We're updating Customer_Description__c to Customer record with External ID = 500
        
        //This query will return single record, so we'll link it to a variable
        Customer__c cust = [select id, name, External_ID__c from Customer__c where External_ID__c = '500'];
        cust.Customer_Description__c = 'This record is updated';
        
        //This List will store the final values
        List<Customer__c> upsertcustList = new List<Customer__c>();
        
        // Taking care of updated part
        upsertcustList.add(cust);
        
        //Now the insert part
        for(integer i=1; i<=20;i++)
        {
            Customer__c cu = new Customer__c();
            cu.name = 'Nike'+i;
            upsertcustList.add(cu);
        }  
             upsert upsertcustList;
             System.debug('Upsert Record List: '+upsertcustList);
             //Open Execute Anonymous Window, upsertrecord.demo();
    }
}