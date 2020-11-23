import subprocess as sp
import pymysql
import pymysql.cursors
import getpass
import time

from datetime import datetime
from PIL import Image 




def Display_Tourist_Location():

    try:
        tmp=sp.call('clear', shell=True)
        query = "select * from TOURIST_LOCATION;"

        cur.execute(query)
        con.commit()
        Result = cur.fetchall()

        print("Tourist Spots\n")
        print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format("Latitude","Longitde","Name of the Location","Weather","Opening Time","Closing Time"))
        for x in range(130):
            print("=",end="")
        print("\n")


        for location in Result:
            print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format(location["Latitude"],location["Longitude"],location["Location_Name"],location["Weather"],str(location["Opening_Time"]),str(location["Closing_Time"])))
            for x in range(130):
                print("-",end="")
            print("\n")

    except Exception as e:
        con.rollback()
        print("The select query failed")
        print("--> ", e)


def Average_Wages():
    t = 1
    tmp=sp.call('clear', shell=True)
    while t:
        print("\n")
        print("Choose 1 if you wish to view Average value for Maid Staff")
        print("Choose 2 if you wish to view Average value for Guide Staff")
        print("Choose 3 if you wish to view Average value for All Staff")
        t = 1
        value = input("Enter Type(1 or 2 or 3) : ")
        if value == '1':
            try:
                query = "SELECT AVG(Monthly_Wages) FROM STAFF WHERE SSN IN (SELECT Maid_SSN FROM MAID_SERVICE);"
                cur.execute(query)
                con.commit()
                Result = cur.fetchall()
                print("average salary is:")
                print(Result[0]["AVG(Monthly_Wages)"])
            
            
            except Exception as e:
                con.rollback()
                print("The select query failed")
                print("--> ", e)

        elif value == '2':
            try:
                query = "select avg(Monthly_Wages) from STAFF where SSN in (select Guide_SSN from TOUR_GUIDE);"
                cur.execute(query)
                con.commit()
                Result = cur.fetchall()
                print("average salary is:")
                #print(Result)
                print(Result[0]["avg(Monthly_Wages)"])

            except Exception as e:
                con.rollback()
                print("The select query failed")
                print("-->" , e)
        
        elif value == '3':
            try:
                query = "select avg(Monthly_Wages) from STAFF"
                cur.execute(query)
                con.commit()
                Result = cur.fetchall()
                print("average salary is:")
                #print(Result)
                print(Result[0]["avg(Monthly_Wages)"])
            
            except Exception as e:
                con.rollback()
                print("The select query failed")
                print("--> ", e)

        else:
            print("Please enter valid option")
            continue

        t = t-1

       
    return



def HighestPaidStaff():
    tmp=sp.call('clear', shell=True)
    t = 1
    while t:
        print("Choose 1 if you wish to view Max salary given to the Maid Staff")
        print("Choose 2 if you wish to view Max salary given to the Guide Staff")

        value = input("Enter Type(1 or 2) : ")

        if value == '1':

            try:
                
                query = " select Full_Name ,  Monthly_Wages from STAFF where Monthly_Wages in (SELECT MAX(Monthly_Wages) FROM STAFF WHERE SSN IN (SELECT Maid_SSN FROM MAID_SERVICE));"
                cur.execute(query)
                con.commit()
                Result = cur.fetchall()
                print("|{:^20}|{:^20}|".format("Full_Name","Salary"))
        
                for x in range(45):
                    print("=",end="")
                print("\n")

                for s in Result:
                    print("|{:^20}|{:^20}|".format(s["Full_Name"],s["Monthly_Wages"]))
                    for x in range(45):
                        print("-",end="")
                    print("\n")

            
            
            except Exception as e:
                con.rollback()
                print("The select query failed")
                print("--> ", e)

        elif value == '2':
            try:
                query = "select Full_Name , Monthly_Wages from STAFF where Monthly_Wages in (select max(Monthly_Wages) from STAFF where SSN in (select Guide_SSN from TOUR_GUIDE));"
                cur.execute(query)
                con.commit()
                Result = cur.fetchall()
                print("|{:^20}|{:^20}|".format("Full_Name","Salary"))
        
                for x in range(45):
                    print("=",end="")
                print("\n")

                for s in Result:
                    print("|{:^20}|{:^20}|".format(s["Full_Name"],s["Monthly_Wages"]))
                    for x in range(45):
                        print("-",end="")
                    print("\n")
            
            except Exception as e:
                con.rollback()
                print("The select query failed")
                print("--> ", e)

        else:
            print("Please enter valid option")
            continue

        t = t-1

       
    return
            

def Guest_Duration():

    try:
        tmp=sp.call('clear', shell=True)
        print("Guests staying More than a week:\n")
        
        query = "select Booking_ID, Full_Name from GUEST where ( DATEDIFF(Check_Out_Date,Check_In_Date) >= 7);"

        cur.execute(query)
        con.commit()
        Result = cur.fetchall()

        print("|{:^20}|{:^20}|".format("Booking ID","Name"))
        for x in range(45):
            print("=",end="")
        print("\n")
        
        for guest in Result:

            print("|{:^20}|{:^20}|".format(guest["Booking_ID"],guest["Full_Name"]))
            for x in range(45):
                print("-",end="")
            print("\n")

    except Exception as e:
        con.rollback()
        print("The select query failed")
        print("--> ", e)

    return


def Display_Vehicle_Deets():

    try:
        tmp=sp.call('clear', shell=True)
        print("\n")
        Time = input(("Enter Time at which you'd like to start your journey(HH(24):MM:SS): "))
    
        #StartTime = '05:00:00'
        #LastTime = '19:00:00'
        query = "select Number_Plate, Availability, Cost,T.Start_Time,T.Last_Ride_Time from TRANSPORT T,TRANSPORT_COST TC where(T.Start_Time <= '%s' and T.Last_Ride_Time > '%s' and T.Start_time = TC.Start_Time and T.Last_Ride_Time = TC.Last_Ride_Time);" %(Time,Time)


        cur.execute(query)
        con.commit()
        Result = cur.fetchall()
        print("Car details are:\n")
        print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format("Number Plate","Availability", "Cost","Start_Time","Last_Ride_Time"))
        
        for x in range(110):
            print("=",end="")
        print("\n")

        for car in Result:
            if car["Availability"] == 1:
                car["Availability"] = "Available"
            if car["Availability"] == 0:
                car["Availability"] = "Unavailable"
           
            print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format(car["Number_Plate"],car["Availability"],car["Cost"],str(car["Start_Time"]),str(car["Last_Ride_Time"])))
            for x in range(110):
                print("-",end="")
            print("\n")

    except Exception as e:
        con.rollback()
        print("The select query failed")
        print("--> ", e)

    return


def Display_Available_Rooms():

    try:
        tmp=sp.call('clear', shell=True)
        print("The Avalible Rooms are:\n")

        query = "SELECT Room_Number,R.Floor_Number,R.Number_of_Beds,Cost FROM ROOM R, ROOM_COST RC WHERE (Availability_of_Room = 1 AND R.Floor_Number = RC.Floor_Number AND R.Number_of_Beds = RC.Number_of_Beds);"

        cur.execute(query)
        con.commit()
        Result = cur.fetchall()

        print("|{:^15}|{:^15}|{:^15}|{:^15}|".format("Room Number","Floor Number", "Number of Beds", "Cost"))
        print("=================================================================")
        for room in Result:
            print("|{:^15}|{:^15}|{:^15}|{:^15}|".format(room["Room_Number"],room["Floor_Number"],room["Number_of_Beds"],room["Cost"]))
            print("-----------------------------------------------------------------")

    except Exception as e:
        con.rollback()
        print("The select query failed")
        print("--> ", e)

    return




def seeLeastWorkingMaids():
    """
    Function to show all the maids who work in the least number of rooms
    """
    try:
        query="SELECT Maid_SSN , Staff_ID , Full_Name , Age , Monthly_Wages , Date_of_Joining, COUNT(Room_Number) as Rooms_Cleaned from CLEANS_ROOM cl , STAFF st where cl.Maid_SSN = st.SSN  group by Maid_SSN having COUNT(Room_Number) in ( select MIN(C.mcnt) from (select COUNT(Room_Number) as mcnt from CLEANS_ROOM group by Maid_SSN) C );"
        # print(query)
        print("\n")
        cur.execute(query)
        con.commit()
        Result=cur.fetchall()
        # print(type(Result))
        # print(Result)
        # for maid in Result:
        #     print(maid)

        
        print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format("Maid SSN","Staff ID","Full Name","Age","Monthly Salary","Date of Joining","Rooms Cleaned"))
        for x in range(150):
            print("=",end="")
        print("\n")
        for maid in Result:
            print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format(maid["Maid_SSN"],maid["Staff_ID"],maid["Full_Name"],maid["Age"],maid["Monthly_Wages"],str(maid["Date_of_Joining"]),maid["Rooms_Cleaned"]))
            for x in range(150):
                print("-",end="")
            print("\n")
            
           

        print(cur.rowcount, "rows returned")

    except Exception as e:
        con.rollback()
        print("The select query failed")
        print("--> ", e)

    return


def enterGuest():
   
    try:

        tmp=sp.call('clear', shell=True)
        values={}
        print("Enter new guest's details: ")
        values["full_name"]=input("Name (Fname Minit Lname): ")
        values["full_name"]
        values["checkin"]=input("Check-in Date(YYYY-MM-DD): ")
        values["checkout"]=input("Check-out Date(YYYY-MM-DD): ")
        values["mems"]=int(input("Enter the total number of people: "))

        query="INSERT INTO GUEST(Full_Name , Check_In_Date , Check_Out_Date , No_Members_To_Book_For) VALUES('%s', '%s', '%s', %d); " % (
            values["full_name"], values["checkin"], values["checkout"], values["mems"])

        #print(query)
        cur.execute(query)

        value = input(("Press 1 if you wish to view the available rooms(any other key to skip): "))
        
        if value == '1':
            print("The Avalible Rooms are:\n")

            room_query = "SELECT Room_Number,R.Floor_Number,R.Number_of_Beds,Cost FROM ROOM R, ROOM_COST RC WHERE (Availability_of_Room = 1 AND R.Floor_Number = RC.Floor_Number AND R.Number_of_Beds = RC.Number_of_Beds);"

            cur.execute(room_query)
            room_res = cur.fetchall()
            print("|{:^15}|{:^15}|{:^15}|{:^15}|".format("Room Number","Floor Number", "Number of Beds", "Cost"))
            print("=================================================================")
            for room in room_res:
                print("|{:^15}|{:^15}|{:^15}|{:^15}|".format(room["Room_Number"],room["Floor_Number"],room["Number_of_Beds"],room["Cost"]))
                print("-----------------------------------------------------------------")


        room_str=input(
            "Enter Room(s) to book (if more than one separate by commas): ")
        room_arr=room_str.split(',')
        for r_ele in room_arr:
            r_ele=r_ele.strip()
            r_num=int(r_ele)
            query2="UPDATE ROOM SET Availability_of_Room = false WHERE Room_Number = %d; " % (
                r_num)
            #print(query2)
            ret=cur.execute(query2)
            if ret == 0:
                raise Exception('Invalid room number')

            query3="INSERT INTO ROOM_BOOKED SELECT Room_Number , Booking_ID FROM ROOM,GUEST WHERE Room_Number = %d ORDER BY Booking_ID DESC LIMIT 1; " % (
                r_num)
            #print(query3)
            cur.execute(query3)

        getIdquery="SELECT Booking_ID FROM GUEST ORDER BY Booking_ID DESC LIMIT 1;"
        cur.execute(getIdquery)
        arr=cur.fetchall()
        obj=arr[0]
        # print(obj)
        latest_id=obj['Booking_ID']
        # print(latest_id)
        mems=values["mems"]
        # print(mems)
        mems=mems-1
        print("\n")
        if mems > 0:
            print("Enter the extra member details")
        c=0
        while mems:
            print("Enter Dependent", c+1, "Details")
            age=int(input("Enter Age: "))
            name=input("Enter name: ")
            family_query="INSERT INTO FAMILY_INFO VALUES(%d , %d , '%s'); " % (
                latest_id, age, name)
            cur.execute(family_query)
            c=c+1
            mems=mems - 1

        con.commit()

        print("Inserted Into Database and booked room")

    except Exception as e:
        con.rollback()
        print("The query failed")
        print("--> ", e)

    return


def deleteGuest():
   
    try:
        tmp = sp.call('clear' , shell= True)
        query = "select * from GUEST;"

        cur.execute(query)
        Result = cur.fetchall()

        print("Currently staying guests\n")
        print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format("Booking_ID","Full_Name","Check_In_Date","Check_Out_Date","No_Members_To_Book_For"))
        for x in range(110):
            print("=",end="")
        print("\n")


        for guest in Result:
            print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format(guest["Booking_ID"],guest["Full_Name"],str(guest["Check_In_Date"]),str(guest["Check_Out_Date"]),guest["No_Members_To_Book_For"]))
            for x in range(110):
                print("-",end="")
            print("\n")
        
        id=int(input("Enter the id of the guest to be deleted: "))
        query1="UPDATE ROOM SET Availability_of_Room = true WHERE Room_Number IN (SELECT Room_Number FROM ROOM_BOOKED WHERE Guest_Booking_ID = %d);" % (
            id)
        ret=cur.execute(query1)
        if ret == 0:
            raise Exception('No such guest exists / invalid booking id')
        query2="DELETE FROM GUEST WHERE Booking_ID = %d" % (id)
        cur.execute(query2)
        con.commit()

        print("Deleted from Database")

    except Exception as e:
        con.rollback()
        print("Failed to delete from database")
        print("--->", e)

    return


def bookTrip():

    try:
        tmp=sp.call('clear', shell=True)
        guest_id=int(input("Enter Booking_ID of Guest that booked the trip: "))
        lat=float(input("Enter Latitude of area upto 2 decimal places: "))
        lon=float(input("Enter Longitude of area upto 2 decimal places: "))

        t = 1
        while t:
            guide_ssn=int(input("Enter SSN of tour guide accompanying: "))
            
            guide_check = "select Booked_By_ID from TOUR_GUIDE where Guide_SSN = %d;" % (guide_ssn)
            ret = cur.execute(guide_check)
            res = cur.fetchall()
            if ret == 0:
                print("No such Tour Guide")
                continue
            elif res[0]["Booked_By_ID"] is not None:
                if res[0]["Booked_By_ID"] != guest_id:
                    print("Tour guide already booked by another guest")
                    continue
            
            t = t-1
            
        num_cars=int(input("Enter number of cars to book: "))
        c=0
        while num_cars:
            t = 1
            while t:
                num_plate=input(
                    "Enter number plate of car %d(eg. AA12BB1234): " % (c+1))
                
                car_check = "select Booked_By_ID from TRANSPORT where Number_Plate = '%s';" % (num_plate)
                ret = cur.execute(car_check)
                res = cur.fetchall()
                if ret == 0:
                    print("No such Vehicle")
                    continue
                elif res[0]["Booked_By_ID"] is not None:
                    if res[0]["Booked_By_ID"] != guest_id:
                        print("Vehicle already booked by another guest")
                        continue
                t = t-1
            
            query="INSERT INTO TRIP_BOOKING VALUES(%d , %f , %f , %d , '%s');" % (
                guide_ssn, lat, lon, guest_id, num_plate)
            cur.execute(query)

            query1 = "update TRANSPORT set Booked_By_ID = %d , Availability = false where Number_Plate = '%s';" % (guest_id , num_plate)
            cur.execute(query1)

            query2  = "update TOUR_GUIDE set Booked_By_ID = %d where Guide_SSN = %d;" % (guest_id , guide_ssn)
            cur.execute(query2)

            num_cars=num_cars - 1
            c=c+1

        con.commit()

        print("Inserted and trip booked , have a nice time!!")

    except Exception as e:
        con.rollback()
        print("The following query failed")
        print("--->", e)

def Guest_arriving_onDate():

    try:
        tmp=sp.call('clear', shell=True)
        req_date=input("Enter date to see number of check-ins on that day:")

        query = "select count(Booking_ID) as NumberOfGuests from GUEST where Check_In_Date = '%s'" % (req_date)
        cur.execute(query)
        res = cur.fetchall()

        if res[0]["NumberOfGuests"] == 0:
            print("No Guests arrived on this date")
        else:
            print("Number of Guests who arrived on Date %s" % req_date)
            print(res[0]["NumberOfGuests"])

    except Exception as e:
        con.rollback()
        print("The following query failed")
        print("--->",e)

def Total_Staff_Salary():
    
    try:
        tmp = sp.call('clear',shell=True)
        query = "select sum(Monthly_Wages) as sum_Salary from STAFF"
        cur.execute(query)
        sum_salary = cur.fetchall()
        print("Hotel spends %f on all Staff Salaries" % (sum_salary[0]["sum_Salary"]) )

    except Exception as e:
        con.rollback()
        print("The following query failed")
        print("--->",e)

def Cheapest_room():
    try:
        tmp=sp.call('clear', shell=True)

        query = "SELECT MIN(Cost) as cheap FROM ROOM,ROOM_COST WHERE ROOM.Floor_Number = ROOM_COST.Floor_Number AND ROOM.Number_of_Beds = ROOM_COST.Number_of_Beds AND ROOM.Availability_of_Room = true "
        cur.execute(query)
        res = cur.fetchall()

        print("The minimum cost of a currently available room is %f" % (res[0]["cheap"]) )
    except Exception as e:
        con.rollback()
        print("The following query failed")
        print("--->",e)

def Guest_Details():
    try:
        tmp=sp.call('clear', shell=True)
        req_name = input("Enter first few letters of Full Name or Complete Full Name of Guest whose details are required:")

        query = "SELECT * from GUEST where Full_Name  LIKE '%s" % (req_name)
        query += "%';"
        cur.execute(query)
        res = cur.fetchall()

        # print(res[0]) #does this work idk


        print("Guest details are:\n")
        print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format("Booking_ID","Full_Name", "Check_In_Date","Check_Out_Date","No_Members_To_Book_For"))
        
        for x in range(110):
            print("=",end="")
        print("\n")

        for guest in res:
            print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format(guest["Booking_ID"],guest["Full_Name"],str(guest["Check_In_Date"]),str(guest["Check_Out_Date"]),guest["No_Members_To_Book_For"]))
            
            for x in range(110):
                print("-",end="")
            print("\n")


    except Exception as e:
        con.rollback()
        print("The following query failed")
        print("--->",e)

def Emp_Details():
    try:
        tmp=sp.call('clear', shell=True)
        req_name = input("Enter first few letters of Full Name or Complete Full Name of Employee whose details are required:")

        query = "SELECT * from STAFF where Full_Name LIKE '%s" % (req_name)
        query += "%';"
        cur.execute(query)
        res = cur.fetchall()

        # print(res[0]) #does this work idk

        print("Employee details are:\n")
        print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format("SSN","Staff_ID", "Full_Name","Age","Monthly_Wages","Date_of_Joining"))
        
        for x in range(110):
            print("=",end="")
        print("\n")

        for emp in res:
            print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format(emp["SSN"],emp["Staff_ID"],emp["Full_Name"],emp["Age"],emp["Monthly_Wages"],str(emp["Date_of_Joining"]) ) )
            
            for x in range(110):
                print("-",end="")
            print("\n")


    except Exception as e:
        con.rollback()
        print("The following query failed")
        print("--->",e)

def Guest_Total_SpendAmount():
    
    try:
        tmp=sp.call('clear', shell=True)
        guest = int(input("Enter Booking ID of guest for which total amount they have spent will be calculated:"))

        query1 = "SELECT sum(Cost) as sum_Room FROM ROOM_COST WHERE (Floor_Number, Number_of_Beds) IN (SELECT Floor_Number,Number_of_Beds FROM ROOM WHERE Room_Number IN (SELECT Room_Number FROM ROOM_BOOKED WHERE Guest_Booking_ID = %d ) )" % (guest)
        cur.execute(query1)
        rooms_cost = cur.fetchall()

        query2 = "SELECT sum(Cost) as sum_Trip FROM TRANSPORT_COST WHERE (Start_Time,Last_Ride_Time) IN (SELECT Start_Time,Last_Ride_Time FROM TRANSPORT WHERE Number_Plate IN (SELECT Transport_Number_Plate FROM TRIP_BOOKING WHERE Guest_Booking_ID = %d))" % (guest)
        cur.execute(query2)
        trip_cost = cur.fetchall()
        
        if trip_cost[0]["sum_Trip"]:
            total_cost = float(rooms_cost[0]["sum_Room"]) + float(trip_cost[0]["sum_Trip"])
        else:
            total_cost = float(rooms_cost[0]["sum_Room"])

        print("The total amount spent by the Guest on Rooms is %f" % float(rooms_cost[0]["sum_Room"]) )
        if trip_cost[0]["sum_Trip"]:
            print("The total amount spent by the Guest on Trips is %f" % float(trip_cost[0]["sum_Trip"]) )
        else:
            print("The Guest has not gone on any trips so far\n")
        
        print("\n")
        print("The total amount spent by Guest with Booking ID %d at Hotel Quokka so far is %f" % (guest,total_cost) )

    except Exception as e:
        con.rollback()
        print("The following query failed")
        print("--->",e)

def hireStaff():

    try:
        tmp=sp.call('clear', shell=True)
        print("Hire a new staff member by entering the appropriate details")
        ssn = int(input("Enter the SSN(9 digit) of the new employee: "))
        name = input("Enter the full name of the person: ")
        age = int(input("Enter the age of the person(just the number): "))
        sal = float(input("Enter the initial salary of the new employee(2 decimal places): "))
        date = datetime.today().strftime('%Y-%m-%d')
        query = "insert into STAFF(SSN , Full_Name , Age , Monthly_Wages , Date_of_Joining) values(%d , '%s' ,  %d , %f , '%s');" % (ssn , name , age , sal , date)
       # print(query)
        cur.execute(query)
        while 1:
            spec = input("Enter the job he has applied for (M - Maid , T - Tour Guide , O - Other): ")
            
            if spec == "M":
                maid_ssn = ssn
                sup = None
                cleaning = input("Enter your cleaning speciality(optional - press enter to skip): ")
                if cleaning == "":
                    cleaning = None
                
                while 1:
                    floor = int(input("Enter the floor(1 - 5) you would like to be assigned(your supervisor will be set accordingly): "))
                    if not (floor >= 1 and floor <=5):
                        print("Invalid floor number")
                        continue

                    sup_assign_query = "select SUP_SSN from FLOOR_SUP where Floor_Number = %d;" % (floor)
                   # print(sup_assign_query)
                    ret = cur.execute(sup_assign_query)
                    if ret == 0:
                        print("Thie floor has no supervisor yet")
                        break

                    res = cur.fetchall()
                    sup = res[0]["SUP_SSN"]
                    print("You were assigned to Supervisor with SSN %d" % (sup))
                    break
                
                if cleaning:
                    if sup:
                        maid_query = "insert into MAID_SERVICE values(%d , '%s' , %d);" % (maid_ssn , cleaning , sup)
                    else:
                        maid_query = "insert into MAID_SERVICE values(%d , '%s' , NULL);" % (maid_ssn , cleaning)
                else:
                    if sup:
                        maid_query = "insert into MAID_SERVICE values(%d , NULL , %d);" % (maid_ssn ,sup)
                    else:
                        maid_query = "insert into MAID_SERVICE values(%d , NULL , NULL);" % (maid_ssn)
                
               # print(maid_query)
                cur.execute(maid_query)

            elif spec == "T":
                guide_ssn = ssn
                years = int(input("Enter number of years of experience(0 if new): "))
                guide_query = "insert into TOUR_GUIDE value(%d , %d , NULL);" % (guide_ssn , years)
                #print(guide_query)
                cur.execute(guide_query)

            elif spec == "O":
                print("Okay you will be assigned once you start working!")

            else:
                print("Please enter a valid job")
                continue

            break

       
        con.commit()
        print("The person was hired and the date of joining was marked as today!")

    except Exception as e:
        con.rollback()
        print("The insert failed")
        print("--->" , e)



def fireStaff():

    try:
        tmp=sp.call('clear', shell=True)
        query = "select * from STAFF;"

        cur.execute(query)
        Result = cur.fetchall()

        print("Currently staying guests\n")
        print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format("SSN","Staff_ID","Full_Name","Age","Monthly_Wages" , "Date_of_Joining"))
        for x in range(130):
            print("=",end="")
        print("\n")


        for staff in Result:
            print("|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|{:^20}|".format(staff["SSN"],staff["Staff_ID"],staff["Full_Name"],staff["Age"],staff["Monthly_Wages"] , str(staff["Date_of_Joining"])))
            for x in range(130):
                print("-",end="")
            print("\n")
        
        while 1:
            ssn = int(input("Enter ssn(9 digit) of person to be fired: "))
            del_query = "delete from STAFF where SSN = %d;" % (ssn)
           # print(del_query)
            ret = cur.execute(del_query)
            if ret == 0:
                print("No such Staff member")
                continue

            con.commit()
            print("Person was successfully fired")

    except Exception as e:
        con.rollback()
        print("The delete falied")
        print("--->" , e)

def incrSal():

    try:
        tmp = sp.call('clear', shell=True)
        while 1:
            ssn = int(input("Enter SSN(9 digit) of the employee you want to increase the salary of: "))
            show_query = "select Full_Name , Monthly_Wages from STAFF where SSN = %d;" %(ssn)
            # print(show_query)
            ret = cur.execute(show_query)
            if ret == 0:
                print("No such employee")
                continue

            res = cur.fetchall()
            print("Name : %s , Current Salary : %f" % (res[0]["Full_Name"] , res[0]["Monthly_Wages"]))
            incr = float(input("Enter the increment amount(2 decimal places): "))
            incr_query = "update STAFF set Monthly_Wages = Monthly_Wages + %f where SSN = %d;" % (incr , ssn)
            print(incr_query)
            cur.execute(incr_query)
            con.commit()

            print("Wages successfully updated!")
            break

    except Exception as e:
        con.rollback()
        print("The update failed")
        print("-->" , e)

def displayGuest():
	try:
		tmp = sp.call('clear', shell=True)

		query = "select * from GUEST"
		ret = cur.execute(query)
		if ret == 0:
			print("No Guests currently")
			continue

		res = cur.fetchall()

	except:
		con.rollback()
		print("The update failed")
		print("-->",e)


def dispatch_guest(num):

    if num == 1:
        enterGuest()
    elif num == 2:
        deleteGuest()
    elif num == 3:
        Cheapest_room()
    elif num == 4:
        Display_Vehicle_Deets()

    elif num == 5:
        bookTrip()
    elif num == 6:
        Display_Tourist_Location()
    elif num == 7:
        Guest_Details()
    elif num == 8:
        Guest_arriving_onDate()
    elif num == 9:
        Guest_Duration()
    elif num == 10:
        Guest_Total_SpendAmount()     

    else:
        print("Error: Invalid Option")


def dispatch_staff(num):

    if num == 1:
        Emp_Details()
    elif num == 0:
    	displayGuest()
    elif num == 2:
        hireStaff()
    elif num == 3:
        fireStaff()
    elif num == 4:
        Total_Staff_Salary()
    elif num == 5:
        Average_Wages()
    
    elif num == 6:
        HighestPaidStaff()
    elif num == 7:
        incrSal()
    elif num == 8:
        seeLeastWorkingMaids()


    else:
        print("Error: Invalid Option")


# Global
    
while(1):
    tmp=sp.call('clear', shell=True)
    # im = Image.open(r"/home/mehulmathur/Pictures/Quokka.png")  
    # im.show()
    # time.sleep(3)
    # im.close()
    # Can be skipped if you want to hard core username and password
    print("Welcome back to Hotel Quokka DB interface!\n")
    username = input("Please enter your Username: ")
    # password = input("Please enter your Password: ")
    password = getpass.getpass('Please enter your Password: ')

    #username = 'Manasvi'
    #password = '$Bittu26'
    try:
        # Set db name accordingly which have been create by you
        # Set host to the server's address if you don't want to use local SQL server
        con=pymysql.connect(host='localhost',
                              user=username,
                              password=password,
                              db='HOTEL_QUOKKA',
                              cursorclass=pymysql.cursors.DictCursor)
        tmp=sp.call('clear', shell=True)

        if(con.open):
            print("Connected")
        else:
            print("Failed to connect")

        tmp=input("Press q to quit or any key to continue>.. ")
        if tmp == 'q':
            break

        with con.cursor() as cur:
            while(1):
                tmp=sp.call('clear', shell=True)  
                print("                        **        *    *")
                print("                      *    *      *  * ")
                print("                     *      *     **   ")
                print("                     *   *  *     **   ")
                print("                      *   **      *  * ")
                print("                        **  *     *    * ")              

                print("Access database concerning a guest or an employee:\n")
                print("A. Guest")
                print("B. Staff")
                print("C. Logout")

                ctype=input("Enter choice(A,B,C): ")

                if ctype == 'A':
                    tmp=sp.call('clear', shell=True)
                    print("Assist a Guest or View Guest Information!\n")
                    print("Please enter an option corresponding to the task at hand\n")
                  
                    print("\nIn order to help a Guest have a pleasant stay at Hotel Quokka:\n")
                    print("1. Would you like to Check-In a Guest?")
                    print("2. Would you like to Check-Out a Guest?")
                    print("3. Display the most economically priced currently available room")
                  
                    print("\nIf a Guest has requested to make use of Hotel Quokka's amazing tour packages:\n")
                    print("4. Display vehicle details for a particular time")
                    print("5. Book a Trip For a Guest.")
                    print("6. View Tourist Spots")
                  
                    print("\nTo view information about Guests:\n")
                    print("7. Retreive Guests' Details by name")
                    print("8. Determine the total number of guests arriving at a particular date")
                    print("9. Determine which guests are staying for more than a week")
                    print("10. Calculate total amount spent by a Guest during their stay so far")
                
                    print("100. Go back")
                    optno=int(input("Enter option number: "))
                    if optno == 100:
                        continue
                    else:
                        dispatch_guest(optno)
                        tmp=input(
                            "Press q to Logout or any other key to continue>.. ")
                        if tmp == 'q':
                            break
               
                elif ctype == 'B':
                    tmp=sp.call('clear', shell=True)
                    print("Here you can access the database regarding the Staff.\n")
                    
                    print("\nTo view an employee's details\n")
                    print("1.View employee details by name.")

                    print("\nHire/Fire a Staff Member\n")
                    print("2. Hire a New Staff Member.")
                    print("3. Fire a Staff Member.")

                    print("\nRegarding Staff Salaries\n")
                    print("4. Find total Hotel Budget spent on salaries.")
                    print("5. Determine Average Staff Salary.")
                    print("6. Determine maximum Staff Salary.")
                    print("7. Promote an Employee by increasing their salary")

                    print("\nRegarding Staff functioning\n")
                    print("8. Display maids ready to clean a room (maids with least number of rooms cleaned so far)")

                    print("100. Go back")
                    optno=int(input("Enter option number: "))
                    if optno == 100:
                        continue
                    else:
                        dispatch_staff(optno)
                        tmp=input(
                            "Press q to Logout or any other key to continue>.. ")
                        if tmp == 'q':
                            break

                elif ctype == 'C':
                    break

                else:
                    print("Invalid Option")
                    tmp=input("Enter any key continue>..")

    except:
        tmp=sp.call('clear', shell=True)
        print("Connection Refused: Either username or password is incorrect or user doesn't have access to database or user presses an escape sequence")
        tmp=input("Enter any key to CONTINUE>")
