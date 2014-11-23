from flask import Flask
from flask import request
from config import conf
import mysql.connector
import json

app = Flask(__name__)

cnx = mysql.connector.connect(user='karmakonto', password='bitch',
                              host=conf['db_host'], port=conf['db_port'],
                              database='karmakonto')

@app.errorhandler(500)
def internal_error(exception):
  app.logger.exception(exception)
  return "Aw crap!"

@app.route("/")
def hello():

  return "Hello Kitty!"

@app.route("/test")
def test():

  query = "SELECT help_id, user FROM help;"

  results = makeQuery(query)
  
  message = "Users foo: " 

  for (id, user) in results:
    message = message + user + " "

  return message


###
# HELP
###

@app.route("/rest/1.0/help/", methods=['POST', 'GET'])
@app.route("/rest/1.0/help/<id>")
def help(id=None):
  if request.method == 'POST':
    return postHelp()
  else:
    return getHelp(id)

  return json.dumps(respose)

def getHelp(id=None):
  query = "SELECT help_id, user, title, message, coord_lat, coord_long, done_by FROM help"

  if id != None:
    query += " WHERE help_id =" + id

  results = makeQuery(query)

  helps = []

  for (help_id, user, title, message, coord_lat, coord_long, done_by) in results:
    helps.append({'id':help_id, 'user':user, 'title':title, 'message':message, 'latitude':coord_lat, 'longitude':coord_long, 'done':done_by, 'url':"/rest/1.0/help/" + str(help_id)})

  respose = {'helps':helps, 'hits':len(helps)}

  return json.dumps(respose)

def postHelp():
  respose = {}
  return json.dumps(respose)

###
# DONE
###

###
# THANKS
###

###
#  KARMA
###
@app.route("/rest/1.0/karma/")
@app.route("/rest/1.0/karma/<id>", methods=['GET'])
def karma(id=None):
  respose = {}

  if request.method == 'PUT':
    delta = request.args.get('delta')
  else:
    query = "SELECT id, user, points FROM karma"
    if id != None:
      query += " WHERE id = " + id
    results = makeQuery(query)
    karmas = []
    for (id, user, points) in results:
      karmas.append({'id':id, 'user':user, 'karma':points})

    respose = {'karmas':karmas, 'hits':len(karmas)}

  return json.dumps(respose)



# run simple query and return results as a list of tuples
def makeQuery(query):
  cursor = cnx.cursor()
  app.logger.debug("Executing query: " + query)
  cursor.execute(query)
  results = cursor.fetchall()
  cursor.close()
  return results 

if __name__ == "__main__":
    app.run('0.0.0.0', debug=True)
