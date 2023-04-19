# Ben_Pizza_Database
A client Named Ben Wants to set up a Pizza Delivery Store to Make and Deliver Pizza and wants a Database to Help Him Manage the Stocks ,Staff, deliveries and Ingredients 

I started with Understanding how the Business works and What the client want to see in Database 
then Started to put some effort in the Tables and Relations between Instence 
I designed based on  the Snowflake Scema As the Database Has Sub dimensions as in Recipes/ingredients Tables so StarScema won't be efficiente 

Besically I Divided the Data Base into 1 Fact Table (Orders) and 4 Dimensions tables (customers , Rota , Adress ,item)
then Each Dimensions has its Sub dimensions for More efficiency in retrieving data  

I Used Quick DBD For easily Designing the ERD And To Change it according to the Client Requirements then Excuted in Sql Server 
