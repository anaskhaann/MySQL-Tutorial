import sqlite3

class DBHelper:
    def __init__(self):
        try:
            # Connect to Db
            self.conn = sqlite3.connect("db/demo.db")
            # create cursor object to connect to db
            self.mycursor = self.conn.cursor()
        except:
            print("Some Error Occured. Failed to Connect to Database")
        else:
            print("Connect to Database")

    def register(self,name,email,password):
        try:
            # We are passing null for id since it has autoincrement in database
            self.mycursor.execute("""
    INSERT INTO `user` (`Id`, `name`, `email`, `password`) VALUES (NULL, '{}','{}','{}')""".format(name,email,password))
            # Commit to save changes
            self.conn.commit()
        except:
            return -1
        else:
            return 1
        
    def search(self, email, password):
        try:
            self.mycursor.execute(f"""SELECT * FROM `user` WHERE email LIKE '{email}' AND password LIKE '{password}'""")
            data = self.mycursor.fetchall()

            return data
        
        except:
            print("Invalid Email/Password")
        