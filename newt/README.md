# Hotel Quokka Database CLI
A command line interface that accesses a mysql database named 'HOTEL_QUOKKA'.
- The contents of the Database HOTEL_QUOKKA are dumped and saved in newt.sql file with some test values in the tables. To start a mysql environment with that database run the command:
```sh
mysql -u <username> -p 
```
- And then source the file inside the mysql environment by:
```sh
source newt.sql
```
This will create a database HOTEL_QUOKKA with all the tables and values and make it your current used database

 - Exit mysql environment and download the python file HotelQuokka.py. Run it as
 ```sh
 python3 HotelQuokka.py
 ```
This will lead you to a CLI interface, where on entering your username and mysql password, you can begin to interact with the Database. 
Run any commands as presented to you. They have been divided into requirements of a guest and requirements related to the staff