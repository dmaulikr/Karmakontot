from flask import Flask

app = Flask(__name__)

import mysql.connector

cnx = mysql.connector.connect(user='karmakonto', password='bitch',
                              host='127.0.0.1', port='8889',
                              database='karmakonto')

@app.errorhandler(500)
def internal_error(exception):
  app.logger.exception(exception)
  return "Aw crap!"

@app.route("/")
def hello():

  return "Hello Kitty!"

@app.route("/test")
def karma():

  query = "SELECT help_id, user FROM help;"

  results = makeQuery(query)
  
  message = "Users foo: " 

  for (id, user) in results:
    message = message + user + " "

  return message

@app.route("/rest/1.0/help")
def helps():
  cursor = cnx.cursor()
  query = "SELECT help_id, user FROM help;"
  cursor.execute(query)

# run simple query and return results as a list of tuples
def makeQuery(query):
  cursor = cnx.cursor()
  app.logger.debug("Executing query: " + query)
  cursor.execute(query)
  results = cursor.fetchall()
  cursor.close()
  return results 

if __name__ == "__main__":
    app.run(debug=True)
