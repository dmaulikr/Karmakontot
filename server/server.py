from flask import Flask
from flask import request
from flask import Response
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
    user = request.form['user']
    title = request.form['title']
    message = request.form['message']
    latitude = request.form['latitude']
    longitude = request.form['longitude']
    return makeResponse(postHelp(user, title, message, latitude, longitude))
  else:
    return getHelp(id)

  return json.dumps(respose)

def getHelp(id=None):
  query = "SELECT id, user, title, message, coord_lat, coord_long, done_id, timestamp FROM help"

  if id != None:
    query += " WHERE id =" + id

  results = makeQuery(query)

  helps = []

  for (id, user, title, message, coord_lat, coord_long, done_id, timestamp) in results:
    helps.append({'id':id, 'user':user, 'title':title, 'message':message, 'latitude':coord_lat, 'longitude':coord_long, 'done_id':done_id, 'url':"/rest/1.0/help/" + str(id), 'timestamp':str(timestamp)})

  respose = {'helps':helps, 'hits':len(helps)}

  return makeResponse(respose)

def postHelp(user, title, message, latitude, longitude):
  add_help = ("INSERT INTO help "
              "(user, title, message, coord_lat, coord_long) "
              "VALUES (%s, %s, %s, %s, %s)")

  help = (user, title, message, latitude, longitude)

  cursor = cnx.cursor()

  cursor.execute(add_help, help)

  help_id = cursor.lastrowid

  return help_id

###
# DONE
###
@app.route("/rest/1.0/done/", methods=['POST', 'GET'])
@app.route("/rest/1.0/done/<id>")
def done(id=None):
  respose = {}

  if request.method == 'POST':
    help_id = request.form['help_id']
    user = request.form['user']
    return makeResponse(postDone(help_id, user))
  else:
    query = "SELECT id, user, help_id, timestamp FROM done"
    if id != None:
      query += " WHERE id = " + id
    results = makeQuery(query)
    dones = []
    for (id, user, help_id, timestamp) in results:
      dones.append({'id':id, 'user':user, 'help_id':help_id, 'url':"/rest/1.0/done/" + str(id), 'timestamp':str(timestamp)})

    respose = {'dones':dones, 'hits':len(dones)}

  return makeResponse(respose)

def postDone(help_id, user):
  add_done = ("INSERT INTO done "
              "(help_id, user) "
              "VALUES (%s, %s)")

  done = (help_id, user)

  cursor = cnx.cursor()

  cursor.execute(add_done, done)

  done_id = cursor.lastrowid

  return done_id


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

  return makeResponse(respose)


def makeResponse(response):
  return Response(json.dumps(response), mimetype='application/json')

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
