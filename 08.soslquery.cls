public class soslquery
{
    public static void demo()
    {
        //Using SOSL we're searching for Name Nike within Account Object
        //We're using List<List<SObject>> because each record will be returning multiple values
        
        //If we replace Name fields will All fields, the search results will change accordingly
        //Adding multiple Objects is simple as modifying the SOSL query
        //[find 'Nike*' in name fields returning Account(Id, name, type), Customer__c(Id, name, Customer_Status__c)]
        
        List<List<SObject>> soslList = [find 'Nike*' in name fields returning Account(Id, name, type)];
        
        System.debug('Returned Records : '+soslList);  
    }
        //soslquery.demo();
}