import sys
from dbHelper import DBHelper

class myShop:
    def __init__(self):
        # TO call and connect to database
        self.db = DBHelper()
        # SHow menu
        self.menu()

    def menu(self):
        user_input = input("""
                        1. Enter 1 to Register
                        2. Enter 2 to Login
                        3. Anything else to exit
                        """)
        
        if user_input== "1":
            self.register()
        elif user_input== "2":
            self.login()
        else:
            print(sys.exit(1000))
        
    def register(self):
        name = input("Enter Name:")
        email = input("Enter Email:")
        password = input("Enter Password:")

        response = self.db.register(name,email,password)
        
        # Checking if insertion is success
        if response:
            print("Sucessfully Registered")
        else:
            print("Registeration Failed")
        self.menu()

# Login
    def login(self):
        email = input("Enter Email:")
        password = input("Enter Password:")

        # Store the data
        data = self.db.search(email,password)

        if len(data)==0 :
            print("No user Found OR Invalid Credentials")
        else:
            print(f"Hello, {data[0][1]}")

obj = myShop()