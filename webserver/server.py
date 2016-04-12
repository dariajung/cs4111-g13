#!/usr/bin/env python2.7

"""
Columbia's COMS W4111.001 Introduction to Databases
Example Webserver

To run locally:

    python server.py

Go to http://localhost:8111 in your browser.

A debugger such as "pdb" may be helpful for debugging.
Read about it online.
"""

import os
from sqlalchemy import *
from sqlalchemy.pool import NullPool
from flask import Flask, request, render_template, g, redirect, Response
from collections import namedtuple
import json
import re
import time
from werkzeug.contrib.cache import SimpleCache

tmpl_dir = os.path.join(os.path.dirname(os.path.abspath(__file__)), 'templates')
app = Flask(__name__, template_folder=tmpl_dir)


#
# The following is a dummy URI that does not connect to a valid database. You will need to modify it to connect to your Part 2 database in order to use the data.
#
# XXX: The URI should be in the format of: 
#
#     postgresql://USER:PASSWORD@w4111a.eastus.cloudapp.azure.com/proj1part2
#
# For example, if you had username gravano and password foobar, then the following line would be:
#
#     DATABASEURI = "postgresql://gravano:foobar@w4111a.eastus.cloudapp.azure.com/proj1part2"
#
DATABASEURI = "postgresql://djj2115:0358@w4111a.eastus.cloudapp.azure.com/proj1part2"

#
# This line creates a database engine that knows how to connect to the URI above.
#
engine = create_engine(DATABASEURI)

#
# Example of running queries in your database
# Note that this will probably not work if you already have a table named 'test' in your database, containing meaningful data. This is only an example showing you how to run queries in your database using SQLAlchemy.
#
engine.execute("""CREATE TABLE IF NOT EXISTS test (
  id serial,
  name text
);""")

# comment out code that keeps inserting grace hopper, alan turing, ada lovelace
# engine.execute("""INSERT INTO test(name) VALUES ('grace hopper'), ('alan turing'), ('ada lovelace');""")

# set up a simple cache
cache = SimpleCache()

@app.before_request
def before_request():
  """
  This function is run at the beginning of every web request 
  (every time you enter an address in the web browser).
  We use it to setup a database connection that can be used throughout the request.

  The variable g is globally accessible.
  """
  try:
    g.conn = engine.connect()
  except:
    print "uh oh, problem connecting to database"
    import traceback; traceback.print_exc()
    g.conn = None

@app.teardown_request
def teardown_request(exception):
  """
  At the end of the web request, this makes sure to close the database connection.
  If you don't, the database could run out of memory!
  """
  try:
    g.conn.close()
  except Exception as e:
    pass

#
# @app.route is a decorator around index() that means:
#   run index() whenever the user tries to access the "/" path using a GET request
#
# If you wanted the user to go to, for example, localhost:8111/foobar/ with POST or GET then you could use:
#
#       @app.route("/foobar/", methods=["POST", "GET"])
#
# PROTIP: (the trailing / in the path is important)
# 
# see for routing: http://flask.pocoo.org/docs/0.10/quickstart/#routing
# see for decorators: http://simeonfranklin.com/blog/2012/jul/1/python-decorators-in-12-steps/
#
@app.route('/')
def index():
  """
  request is a special object that Flask provides to access web request information:

  request.method:   "GET" or "POST"
  request.form:     if the browser submitted a form, this contains the data in the form
  request.args:     dictionary of URL arguments, e.g., {a:1, b:2} for http://localhost?a=1&b=2

  See its API: http://flask.pocoo.org/docs/0.10/api/#incoming-request-data
  """

  # DEBUG: this is debugging code to see what request looks like
  print request.args
  #
  # example of a database query
  #
  # cursor = g.conn.execute("SELECT name FROM test")
  # names = []
  # for result in cursor:
  #   names.append(result['name'])  # can also be accessed using result[0]
  # cursor.close()

  # Flask uses Jinja templates, which is an extension to HTML where you can
  # pass data to a template and dynamically generate HTML based on the data
  # (you can think of it as simple PHP)
  # documentation: https://realpython.com/blog/python/primer-on-jinja-templating/
  #
  # You can see an example template in templates/index.html
  #
  # context are the variables that are passed to the template.
  # for example, "data" key in the context variable defined below will be 
  # accessible as a variable in index.html:
  #
  #     # will print: [u'grace hopper', u'alan turing', u'ada lovelace']
  #     <div>{{data}}</div>
  #     
  #     # creates a <div> tag for each element in data
  #     # will print: 
  #     #
  #     #   <div>grace hopper</div>
  #     #   <div>alan turing</div>
  #     #   <div>ada lovelace</div>
  #     #
  #     {% for n in data %}
  #     <div>{{n}}</div>
  #     {% endfor %}
  #
  # context = dict(data = names)
  #
  # render_template looks in the templates/ folder for files.
  # for example, the below file reads template/index.html
  #
  return render_template("index.html")

#
# This is an example of a different path.  You can see it at:
# 
#     localhost:8111/another
#
# Notice that the function name is another() rather than index()
# The functions for each app.route need to have different names
#
@app.route('/another')
def another():
  return render_template("another.html")

# test route, not really important
@app.route('/politicians')
def politicians():
  print request.args

  cursor = g.conn.execute("SELECT p.name FROM politicians p")
  names = []

  for result in cursor:
    names.append(result['name'])  # can also be accessed using result[0]

  cursor.close() # import to make sure no SQL injection

  context = dict(data = names)

  return render_template("politicians.html", **context)

# ----------------------- Search Routes -----------------------------------

# s is passed in query
def is_query_safe(s):
  # check against weird SQL statements
  sql_statements = ['DROP TABLE', 'DROP DATABASE', 'DROP INDEX', 'DELETE TABLE']
  s = s.upper()

  for statement in sql_statements:
    if statement in s:
      return False

  return True

def politician_exists(s):
  politicians = ['Harry Reid'
                  ,'Marco Rubio'
                  ,'Ted Cruz'
                  ,'Chuck Schumer'
                  ,'Bernie Sanders'
                  ,'Rand Paul'
                  ,'Mitch McConnell'
                  ,'Barbara Boxer'
                  ,'Elizabeth Warren'
                  ,'John McCain'
                  ,'Dean Heller'
                  ,'Dianne Feinstein'
                  ,'Patrick Leahy'
                  ,'Bill Nelson'
                  ,'John Cornyn'
                  ,'Ed Markey'
                  ,'Jeff Flake'
                  ,'Bob Menendez'
                  ,'Cory Booker'
                  ,'John Boehner'
                  ,'Nancy Pelosi'
                  ,'Paul Ryan'
                  ,'Kevin McCarthy'
                  ,'Tulsi Gabbard'
                  ,'Steny Hoyer'
                  ,'James Clyburn'
                  ,'Steve Scalise'
                  ,'Cathy McMorris Rodgers'
                  ,'Eric Cantor'
                  ,'Kirsten Gillibrand'
                  ,'Kay Hagan'
                  ,'Richard Burr'
                  ,'Mary Landrieu'
                  ,'David Vitter'
                  , 'Sania']

  return s in politicians

def industries_exists(s):
  industries = ['Agribusiness'
                ,'Communications'
                ,'Construction'
                ,'Defense'
                ,'Energy'
                ,'Finance'
                ,'Healthcare'
                ,'Liberal'
                ,'Conservative'
                ,'Labor'
                ,'Lobbyists'
                ,'Transportation'
                ,'Alcohol'
                ,'Casinos'
                ,'Pro-gun'
                ,'Anti-gun'
                ,'Immigration'
                ,'Veteran Affairs'
                ,'Economics and Public Finance'
                ,'Human Rights'
                ,'Renewable Energy'
                ,'Fossil Fuels'
                ,'Pro-Israel'
                ,'Education'
                ,'Pharmaceuticals'
                ,'Tobacco'
                ,'Law Firms'
                ,'Food Industry'
                ,'Emergency Management'
                ,'Government Operations and Politics - Campaign Finance'
                ,'Government Operations and Politics']

  return s in industries

def call_recache():

  results_politicians = []
  results_states = []
  pac_names = []
  pac_ids = []
  spac_names = []
  industries = []
  legislation = []
  results_senators = []
  results_reps = []

  # everything in the cache expires after 300 seconds

  # get politician names
  print 'check how often this is called'

  cursor = g.conn.execute("SELECT p.name FROM politicians p")
  
  for result in cursor:
    results_politicians.append(result)

  cursor.close() # import to make sure no SQL injection

  cache.set("politicians", results_politicians, timeout=300)


  # get senators
  cursor = g.conn.execute("SELECT p.name FROM politicians p, senators s WHERE s.name = p.name")
  
  for result in cursor:
    results_senators.append(result)

  cursor.close() # import to make sure no SQL injection

  cache.set("senators", results_senators, timeout=300)

  # get representatives
  cursor = g.conn.execute("SELECT p.name FROM politicians p, representatives r WHERE r.name = p.name")

  for result in cursor:
    results_reps.append(result)

  cursor.close() # import to make sure no SQL injection

  cache.set("representatives", results_reps, timeout=300)
  

  # get state names
  cursor = g.conn.execute("SELECT s.state_name FROM rep_state s")

  for result in cursor:
    results_states.append(result)

  cursor.close() # import to make sure no SQL injection

  cursor = g.conn.execute("SELECT s.state_name FROM rep_district s")

  for result in cursor:
    results_states.append(result)

  cursor.close()

  cache.set("states", results_states, timeout=300)
  

  # get PAC names
  cursor = g.conn.execute("SELECT p.name, p.committee_id FROM pacs p")

  for result in cursor:
    pac_names.append(result['name'])
    pac_ids.append(result['committee_id'])

  cursor.close()

  cursor = g.conn.execute("SELECT p.name, p.committee_id FROM super_pacs p")
  for result in cursor:
    spac_names.append(result['name'])
    pac_ids.append(result['committee_id'])

  cursor.close()

  cache.set('pac_names', pac_names, timeout=300)
  cache.set('pac_ids', pac_ids, timeout=300)
  cache.set('spac_names', spac_names, timeout=300)

  # get industry summaries
  cursor = g.conn.execute("SELECT i.summary FROM industries i")

  for result in cursor:
    industries.append(result)

  cursor.close()

  cache.set('industries', industries, timeout=300)

  # get legislation names
  cursor = g.conn.execute("SELECT l.name FROM legislation l")

  for result in cursor:
    legislation.append(result)

  cursor.close()

  cache.set('legislation', legislation, timeout=300)


# TODO: Check user input
@app.route('/search')
def search():

  results_politicians = []
  results_states = []
  pac_names = []
  pac_ids = []
  spac_names = []
  industries = []
  legislation = []
  senators = []
  reps = []

  if (cache.get("politicians") is None 
      or cache.get("states") is None 
      or cache.get("pac_names") is None
      or cache.get("pac_ids") is None
      or cache.get("spac_names" is None)
      or cache.get("legislation" is None)
      or cache.get("senators" is None)
      or cache.get("representatives" is None)):
    call_recache()

  results_politicians = cache.get("politicians")
  results_states = cache.get("states")
  pac_names = cache.get('pac_names')
  pac_ids = cache.get('pac_ids')
  spac_names = cache.get('spac_names')
  industries = cache.get('industries')
  legislation = cache.get('legislation')
  senators = cache.get('senators')
  reps = cache.get('representatives')

  return render_template("search.html", 
                            politicians=results_politicians 
                            , state_names=results_states
                            , pac_names=pac_names
                            , pac_ids=pac_ids
                            , spac_names=spac_names
                            , industries=industries
                            , legislation=legislation
                            , senators=senators
                            , reps=reps)

@app.route('/money_search')
def money_search():
  results_politicians = []
  results_states = []
  pac_names = []
  pac_ids = []
  spac_names = []
  industries = []
  legislation = []
  senators = []
  reps = []

  if (cache.get("politicians") is None 
      or cache.get("states") is None 
      or cache.get("pac_names") is None
      or cache.get("pac_ids") is None
      or cache.get("spac_names" is None)
      or cache.get("legislation" is None)
      or cache.get("senators" is None)
      or cache.get("representatives" is None)):
    call_recache()

  results_politicians = cache.get("politicians")
  results_states = cache.get("states")
  pac_names = cache.get('pac_names')
  pac_ids = cache.get('pac_ids')
  spac_names = cache.get('spac_names')
  industries = cache.get('industries')
  legislation = cache.get('legislation')
  senators = cache.get('senators')
  reps = cache.get('representatives')

  return render_template("money_search.html", 
                            politicians=results_politicians 
                            , state_names=results_states
                            , pac_names=pac_names
                            , pac_ids=pac_ids
                            , spac_names=spac_names
                            , industries=industries
                            , legislation=legislation
                            , senators=senators
                            , reps=reps)

@app.route('/error')
def display_error():
  return render_template("error.html")


@app.route('/search_politician', methods=['GET'])
def search_polit():

  query = request.args.get('query')

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  # make sure less than 30 characters
  if len(query) > 30 or not politician_exists(query):
    print 'Politician not in the database'
    msg = 'Politician ' + query + ' is not in the database'
    return render_template('error.html', error_msg=msg)

  print 'search_politician'
  print query
  cursor = g.conn.execute("SELECT * FROM politicians p WHERE p.name = %s", query)
  rows = cursor.fetchall()

  cursor.close() # import to make sure no SQL injection
  
  return render_template('search_results.html', politician_data = rows)


@app.route('/search_senator', methods=['GET'])
def search_senator():

  query = request.args.get('query')

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  print 'search_senator'
  print query

  cursor = g.conn.execute("""SELECT p.name, p.DOB, p.net_worth, p.incumbent_status, p.party_affiliation, p.years_in_office
                              FROM politicians p, senators s 
                              WHERE p.name = %s AND p.name = s.name""", query)

  # import to make sure no SQL injection
  results = []

  for result in cursor:
    results.append(result)

  cursor.close() # import to make sure no SQL injection
  
  return render_template('search_results.html', senators_data = results)


@app.route('/search_rep', methods=['GET'])
def search_representative():

  query = request.args.get('query')

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  print 'search_senator'
  print query

  cursor = g.conn.execute("""SELECT p.name, p.DOB, p.net_worth, p.incumbent_status, p.party_affiliation, p.years_in_office
                              FROM politicians p, representatives r 
                              WHERE p.name = %s AND p.name = r.name""", query)

  # import to make sure no SQL injection
  results = []

  for result in cursor:
    results.append(result)

  cursor.close() # import to make sure no SQL injection
  
  return render_template('search_results.html', reps_data = results)


@app.route('/search_state', methods=['GET'])
def search_state():

  query = request.args.get('query')

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)
  
  # make sure length is less than 15
  # Longest state name is Rhode Island
  if len(query) > 15 or not all(x.isalpha() or x.isspace() for x in query):
    print 'Query was too long or contained non alphabet characters'

    msg = 'State query was too long or contained non-alphabet and/or non-space characters'
    return render_template('error.html', error_msg=msg)

  print 'search_state'
  print query

  cursor = g.conn.execute("SELECT * FROM rep_state r WHERE r.state_name = %s", query)
  results = []

  for result in cursor:
    results.append(result)

  cursor.close() # import to make sure no SQL injection

  results2 = []
  cursor = g.conn.execute("SELECT * FROM rep_district d WHERE d.state_name = %s", query)
  for result in cursor:
    results2.append(result)

  cursor.close() # import to make sure no SQL injection
  
  return render_template("search_results.html", state_data = results, rep_data = results2)

#search for pacs by committee id
@app.route('/search_pac_id', methods=['GET'])
def search_pac_id():
  query = request.args.get('query')

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  print 'search/pac_id'
  print query

  # all committee_ids are in the form C[00411330], C followed by 8 numbers
  pattern = "C\d{8}"
  regex_test = re.match(pattern, query)
  if not regex_test:
    print 'Committee ID is not in the correct format'
    msg = 'Committee ID is not in the correct format'
    return render_template('error.html', error_msg=msg)

    return redirect('/search')

  cursor = g.conn.execute("SELECT * FROM pacs WHERE pacs.committee_id = %s", query)
  results_pacs = []

  for result in cursor:
    results_pacs.append(result)

  cursor.close() # import to make sure no SQL injection

  cursor = g.conn.execute("SELECT * FROM super_pacs WHERE super_pacs.committee_id = %s", query)
  results_spacs = []

  for result in cursor:
    results_spacs.append(result)

  cursor.close() # import to make sure no SQL injection

  return render_template("search_results.html", pac_id_data = results_pacs, spac_id_data = results_spacs)

# search for pacs by name
@app.route('/search_pac_name', methods=['POST', 'GET'])
def search_pac():

  query = request.args.get('query') # TODO: do validation on query

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  print 'search/pac'
  print query

  cursor = g.conn.execute("SELECT * FROM pacs WHERE pacs.name = %s", query)
  results = []

  for result in cursor:
    results.append(result)

  cursor.close() # import to make sure no SQL injection

  return render_template("search_results.html", pac_data = results)

# search for pacs by industry

# search for Super PACs by name
@app.route('/search_spac', methods=['GET'])
def search_spac():
  query = request.args.get('query') # TODO: do validation on query

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  print 'search/spac'
  print query

  cursor = g.conn.execute("SELECT * FROM super_pacs WHERE super_pacs.name = %s", query)
  results = []

  for result in cursor:
    results.append(result)

  cursor.close() # import to make sure no SQL injection

  return render_template("search_results.html", spac_data = results)

# search for legislation by name
@app.route('/search_legislation', methods=['GET'])
def search_legislation():
  query = request.args.get('query') # TODO: do validation on query

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  print 'search/legislation'
  print query

  cursor = g.conn.execute("""SELECT p.name, legislation.name, legislation.passed, p.party_affiliation
                              FROM legislation, politicians p, p_sponsors s 
                              WHERE legislation.name = %s AND s.legislation_name = %s AND s.p_sponsor_name = p.name""", query, query)
  results = []

  for result in cursor:
    results.append(result)

  cursor.close() # import to make sure no SQL injection

  return render_template("search_results.html", legislation_data = results)

@app.route('/search_legislation_by_summary', methods=['GET'])
def search_legislation_by_summary():
  query = request.args.get('query') # TODO: do validation on query

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  print 'search/legislation by summary'
  print query

  cursor = g.conn.execute("""SELECT a.summary, l.name, p.name, p.party_affiliation, l.passed
                            FROM advocates a, legislation l, politicians p, p_sponsors s
                            WHERE a.summary = %s AND l.name = a.name AND p.name = s.p_sponsor_name AND s.legislation_name = l.name""", query)
  results = []

  for result in cursor:
    results.append(result)

  cursor.close() # import to make sure no SQL injection

  return render_template("search_results.html", legislation_industry_data = results)


@app.route('/search_pac_by_summary', methods=['GET'])
def search_pac_by_summary():
  query = request.args.get('query') # TODO: do validation on query

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  print 'search/pac by summary'
  print query

  cursor = g.conn.execute("""SELECT p.name, p.committee_id, p.budget, p.cash_spent, p.cash_on_hand, p.registrant, i.industry_summary
                            FROM pacs p, interested_in i
                            WHERE i.industry_summary = %s AND p.committee_id = i.committee_id""", query)
  results = []

  for result in cursor:
    results.append(result)

  cursor.close() # import to make sure no SQL injection

  cursor = g.conn.execute("""SELECT max(p.cash_spent)
                              FROM interested_in i, pacs p
                              WHERE p.committee_id = i.committee_id AND i.industry_summary = %s
                              GROUP BY p.cash_spent
                              ORDER BY p.cash_spent DESC
                              """, query)

  max_spent = []
  for result in cursor:
    max_spent.append(result[0])

  cursor.close()

  return render_template("search_results.html", pacs_industry_data = results, max_spent=max_spent)


# search for money from PACs for specified politician
@app.route('/search_money_from_pacs', methods=['GET'])
def search_money():

  query = request.args.get('query') # TODO: do validation on query

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  if not politician_exists(query):
    msg = 'Politician ' + query + ' not in database'
    return render_template('error.html', error_msg=msg)

  cursor = g.conn.execute('''SELECT new_t.politician_name, new_t.amount, i.committee_id, i.industry_summary, p.name
  FROM (SELECT *
  FROM pac_supports INNER JOIN pac_donate ON pac_supports.committee_id = pac_donate.to_committee_id
  WHERE pac_supports.politician_name = %s) as new_t, interested_in i, pacs p
  WHERE i.committee_id = new_t.from_committee_id AND p.committee_id = i.committee_id''', query)

  total_amount = 0

  results = []
  for result in cursor:
    results.append(result)
    total_amount += result.amount

  print total_amount
  
  cursor.close() # import to make sure no SQL injection

  return render_template('search_results.html', money_data = results, total_amount = total_amount)

# add route on seeing how given politician x voted for a bill that supports industry y
@app.route('/search_voting_bill', methods=['GET'])
def search_how_polit_voted_on_bill():

  query_p = request.args.get('query_p') # do validation on query_p

  # check for malicious intent
  if not is_query_safe(query_p):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  if not politician_exists(query_p):
    msg = 'Politician ' + query_p + ' not in database'
    return render_template('error.html', error_msg=msg)

  # make sure query_l is one of specified industries
  query_l = request.args.get('query_l') # do validation on query_l

  # check for malicious intent
  if not is_query_safe(query_l):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  # check industries exist
  if not industries_exists(query_l):
    msg = 'Industry ' + query_l + ' not in database'
    return render_template('error.html', error_msg=msg)

  cursor = g.conn.execute('''SELECT DISTINCT on (l.name) l.name, l.passed, v.voted_for, p.name, a.summary
            FROM votes v, politicians p, legislation l, advocates a
            WHERE p.name = %s AND a.summary = %s AND a.name = l.name''', query_p, query_l)

  results = []
  for result in cursor:
    results.append(result)
  
  cursor.close() # import to make sure no SQL injection

  return render_template('search_results.html', vote_i_data = results)

# TODO: Add search form for seeing how politicians voted on legislation 
# that was in the same industry as their donation pacs (input: politician name)
# @app.route('/search_money_legislation', methods=['GET'])
# def money_legislation():
#   query = request.args.get('query') # do validation on query, which is politician name
#   results = []
#   return render_template('search_results.html', money_legislation_data = results)

@app.route('/search_vote_on_legislation', methods=['GET'])
def search_vote_on_legislation():

  query_p = request.args.get('query_p')
  query_l = request.args.get('query_l')

  cursor = g.conn.execute("""SELECT v.legislation_name, v.politician_name, v.voting_stage, v.voted_for, l.passed
                              FROM politicians p, legislation l, votes v
                              WHERE v.politician_name = %s 
                                    AND l.name = %s 
                                    AND l.name = v.legislation_name 
                                    AND v.politician_name = p.name """, query_p, query_l)

  results = []

  for result in cursor:
    results.append(result)

  cursor.close()

  return render_template('/search_results.html', vote_on_legislation=results)

@app.route('/search_polit_spac_supports', methods=['GET'])
def search_politician_spacs_supports():

  query = request.args.get('query') # TODO: do validation on query

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  results = []

  cursor = g.conn.execute("""SELECT sp.committee_id, ss.amount, p.name, sp.name, sp.viewpoint
                              FROM super_pacs sp, spac_supports ss, politicians p
                              WHERE ss.name = p.name AND ss.committee_id = sp.committee_id AND p.name = %s
                              """, query)

  for result in cursor:
    results.append(result)

  cursor.close()
  
  return render_template('/search_results.html', polit_spac_supports_data = results)

@app.route('/search_polit_spac_against', methods=['GET'])
def search_politician_spacs_against():

  query = request.args.get('query') # TODO: do validation on query

  # check for malicious intent
  if not is_query_safe(query):
    msg = 'Stop trying to alter the database!'
    return render_template('error.html', error_msg=msg)

  results = []

  cursor = g.conn.execute("""SELECT sp.committee_id, ss.amount, p.name, sp.name, sp.viewpoint
                              FROM super_pacs sp, spac_against ss, politicians p
                              WHERE ss.name = p.name AND ss.committee_id = sp.committee_id AND p.name = %s
                              """, query)

  for result in cursor:
    results.append(result)

  cursor.close()
  
  return render_template('/search_results.html', polit_spac_against_data = results)

# --------------------------------------------

# Example of adding new data to the database
@app.route('/add', methods=['POST'])
def add():
  name = request.form['name']
  print name
  s = text("INSERT INTO test(name) VALUES (:n)")
  g.conn.execute(s, n = name)

  cursor.close() # import to make sure no SQL injection

  return redirect('/')

# another way of doing the same thing:
# @app.route('/add', methods=['POST'])
# def add():
#   name = request.form['name']
#   g.conn.execute('INSERT INTO test(name) VALUES (%s)', name)
#   return redirect('/')

# Deletion of data in a table in the database
@app.route('/delete/test', methods=['POST'])
def delete():
  name = request.form['name']
  print name
  s = text("DELETE FROM test WHERE test.name = :n", name)
  g.conn.execute(s, n = name)
  return redirect('/')


@app.route('/login')
def login():
    abort(401)
    this_is_never_executed()


if __name__ == "__main__":
  import click

  @click.command()
  @click.option('--debug', is_flag=True)
  @click.option('--threaded', is_flag=True)
  @click.argument('HOST', default='0.0.0.0')
  @click.argument('PORT', default=8111, type=int)
  def run(debug, threaded, host, port):
    """
    This function handles command line parameters.
    Run the server using:

        python server.py

    Show the help text using:

        python server.py --help

    """

    HOST, PORT = host, port
    print "running on %s:%d" % (HOST, PORT)
    app.run(host=HOST, port=PORT, debug=debug, threaded=threaded, use_reloader=True)


  run()
