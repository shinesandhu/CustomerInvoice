public class deleterecord
{
    public static void demo()
    {
        //Delete All Customer records, which start with name = Nike
        //In SOQL query we use LIKE and % together. Here % could be 0 or more characters
        List<Customer__c> delList = [select id, name from Customer__c where name like 'Nike%'];
        delete delList;
        System.debug('How many records got deleted? '+delList.size());
        //Open Execute Anonymous Window, deleterecord.demo();  
    }
}