import json
import re
from flask import Flask,render_template, request
from flask_mysqldb import MySQL
 
app = Flask(__name__)
 
app.config['MYSQL_HOST'] = '159.65.156.24'
app.config['MYSQL_USER'] = 'jopi'
app.config['MYSQL_PASSWORD'] = 'sxh0Paa8i9Y='
app.config['MYSQL_DB'] = 'BookDb'

try: 
    mysql = MySQL(app)
    print("db connection successful")
except Exception as e:
    print("error occured while connecting to db")


##user

@app.route("/books/search",methods=["POST"])
def get_books():
    try:
        req=  request.json
        search_string = req["search_string"]+"%"
        cursor =  mysql.connection.cursor()
        cursor.execute('SELECT book.book_id,book.book_name,publisher.publisher_name,author.author_name,book.book_count FROM book,publisher as publisher,author as author where book.author_id = author.author_id and book.publisher_id=publisher.publisher_id AND book.book_name LIKE %s',(search_string,))
        result = cursor.fetchall()
        result_list = []
        for res in result:
            result_list.append({
                "book_id":res[0],
                "book_name":res[1],
                "author_name":res[2],
                "publisher_name":res[3],
                "book_count":res[4]
            })
        print("result ",result_list)
        return json.dumps(result_list),200
    except Exception as e:
        print(e)
        return "Unexpected Errors",500

@app.route("/fee/insert",methods=["POST"])
def insert_fee():
    try:
        con = mysql.connection
        cursor =  con.cursor()
        req = request.json
        starting = int(req["starting"])
        ending = int(req["ending"])
        fee = int(req["fee"])
        values = 'INSERT INTO fee(starting,ending,fee) VALUES(%s,%s,%s)'
        cursor.execute(values, (starting,ending,fee))
        con.commit()
        return "Successfully Inserted",200
    except Exception as e:
        print("error occured while inserting fee")
        print(e)
        return "Unexpected Error",e

@app.route("/fee/get",methods=["GET","POST"])
def get_fee():
    try:
        cursor =  mysql.connection.cursor()
        cursor.execute('''SELECT * FROM fee''')
        result = cursor.fetchall()
        print("result ",result)
        result_list =[]
        for res in result:
            result_list.append({
                "starting":res[0],
                "ending":res[1],
                "fee":res[2]
            })
        return json.dumps(result_list),200
    except Exception as e:
        print(e)
        return "Unexpected Error",500


##acconut

@app.route("/api/admin/create",methods= ["POST"])
def create_admin():
    try:
        con = mysql.connection
        cursor =  con.cursor()
        req = request.json
        print(req)
        email = req["email"]
        password =  req["password"]
        # password =hash(req["password"])
        name = req["name"]
        print(email)
        print(name)
        print(password)
        values = 'INSERT INTO admin(id,email,password,name) VALUES(NULL,%s,%s,%s)'
        cursor.execute(values, (email,password,name))
        #cursor.execute(.format(str(email),str(password),str(name)))
        # cursor.commit()
        con.commit()
        return "successfully created admin"
    except Exception as e:
        print("error occured while creating admin account")
        print(e)
        return "Error"

@app.route("/api/admin/login",methods=["POST"])
def admin_signin():
    try:
        cursor = mysql.connection.cursor()
        req = request.json
        print(req)
        email = str(req["email"]).replace("OR","")
        password = str(req["password"]).replace("OR","")
        
        query = 'SELECT COUNT(*) FROM admin where email=%s AND password=%s'
        cursor.execute(query,(email,password))
        res = cursor.fetchall()
        if int(res[0][0])==1:
            return "login success",200
        elif int(res[0][0])==0:
            return "invalid username or password",400
        else:
            return "unexpected error occured",500
    except Exception as e:
        print("error occured during admin login")
        print(e)
        return "Unexpected error",500


##Publisher

@app.route("/api/admin/search-publisher",methods=["POST"])
def get_admin():
    try:
        req = request.json
        search_string ="%"+ str(req["search_string"]).lower()+"%"
        cursor =  mysql.connection.cursor()

        cursor.execute('SELECT * FROM publisher WHERE publisher_name LIKE %s',(search_string,))
        result = cursor.fetchall()
        print("result ",result)
        resp = []
        for res in result:
            print(int(res[0]))
            print(str(res[1]))
            resp.append({
                "id":res[0],
                "name":res[1]
            })
        return json.dumps(resp),200
    except Exception as e:
        print(e)
        return "error",500

@app.route("/api/admin/add-publisher",methods=["POST"])
def post_publisher():
    try:
        con = mysql.connection
        cursor =  con.cursor()
        req = request.json
        print(req)
        publihser_name = str(req["name"]).lower()
        print(publihser_name)
        print(type(publihser_name))
        query = 'INSERT INTO publisher(publisher_id,publisher_name) VALUES(NULL,%s)'
        cursor.execute(query, (publihser_name,))
        con.commit()
        return "successfully added publisher",200
    except Exception as e:
        print("error occured while creating publisher")
        print(e)
        return "Error",500



##Author

@app.route("/api/admin/add-author",methods=["POST"])
def add_author():
    try:
        con = mysql.connection
        cursor =  con.cursor()
        req = request.json
        print(req)
        author_name = str(req["name"]).lower()
        query = 'INSERT INTO author(author_id,author_name) VALUES(NULL,%s)'
        cursor.execute(query, (author_name,))
        con.commit()
        return "successfully added author",200
    except Exception as e:
        print("error occured while creating author")
        print(e)
        return "Error",500

@app.route("/api/admin/search-author",methods=["POST"])
def search_author():
    try:
        req = request.json
        search_string ="%"+ str(req["search_string"]).lower()+"%"
        cursor =  mysql.connection.cursor()

        cursor.execute('SELECT * FROM author WHERE author_name LIKE %s',(search_string,))
        result = cursor.fetchall()
        print("result ",result)
        resp = []
        for res in result:
            print(res[0])
            print(res[1])
            resp.append({
                "id":int(res[0]),
                "name":str(res[1])
            })
        return json.dumps(resp),200
    except Exception as e:
        print(e)
        return "error",500


##Book
@app.route("/api/admin/add-book",methods=["POST"])
def add_book():
    try:
        con = mysql.connection
        cursor =  con.cursor()
        req = request.json
        print(req)
        book_name = str(req["book_name"]).lower()
        author_id = int(req["author_id"])
        publisher_id = int(req["publisher_id"])
        book_count = int(req["book_count"])
        query = 'INSERT INTO book(book_id,book_name,author_id,publisher_id,book_count) VALUES(NULL,%s,%s,%s,%s)'
        cursor.execute(query, (book_name,author_id,publisher_id,book_count))
        con.commit()
        return "successfully added book",200
    except Exception as e:
        print("error occured while creating author")
        print(e)
        return "Error",500

        
if __name__ == '__main__':
    app.run(host='159.89.161.168', port=4050)



# cursor.execute(''' CREATE TABLE admin(id int AUTO_INCREMENT PRIMARY KEY,email varchar(50),password varchar(1000),name varchar(50))''')
# cursor.execute(''' CREATE TABLE author(author_id int AUTO_INCREMENT PRIMARY KEY, author_name varchar(50))''')
# cursor.execute(''' CREATE TABLE publisher(publisher_id int AUTO_INCREMENT PRIMARY KEY,publisher_name varchar(50))''')
# cursor.execute(''' CREATE TABLE book(book_id int AUTO_INCREMENT PRIMARY KEY, book_name varchar(100),author_id int references author,publisher_id int references publisher,book_count int)''')
# cursor.execute(''' CREATE TABLE fee(starting_time int,ending_time int,fee int) ''')