import json
from flask import Flask, request, render_template, make_response,flash
# from flask.helpers import flash
from flask_wtf.recaptcha import validators
from form import TestForm,BookForm
from query import query_db
import sqlite3
import random

app = Flask(__name__)
app.config['SECRET_KEY'] = "my precious"


@app.route("/state", methods=["GET", "POST"])
def index():
    """
    Render form and handle form submission
    """
    form = TestForm(request.form)
    form.state.choices = [('', 'Select a state')] + [
        (x[0], x[1]) for x in query_db("state")]
    chosen_state = None
    chosen_district = None
    
    return render_template('index.html', form=form)

@app.route("/book/<string:state>/<string:district>/<string:vaccine>/<string:date>/", methods=["GET", "POST"])
def book(state,district,vaccine,date):
    """
    Render form and handle form submission
    """
    form = BookForm(request.form)

    # if request.method=="GET":
    return render_template('book.html', form=form,district =district,state=state,vaccine=vaccine,date=date)
    # elif request.method=="POST":
    #     if form.validate()==False:
    #         flash("All fields are required")
    #         return render_template('book.html', form=form, data = data)
    #     else:
    #         return("Successful")



@app.route("/state/<int:state_id>/", methods=["GET"])
def get_request(state_id):
    """
    Handle GET request to - /<department_id>/
    Return a list of tuples - (<employee id>, <employee name>)
    """
    data = [
        (x[0], x[1]) for x in query_db("district")
        if x[2] == state_id]
    response = make_response(json.dumps(data))
    response.content_type = 'application/json'
    return response

@app.route("/district/<int:district_id>/", methods=["GET"])
def get_request1(district_id):
    """
    Handle GET request to - /<department_id>/
    Return a list of tuples - (<employee id>, <employee name>)
    """
    data = [
        (x[0], x[1]) for x in query_db("vaccine")
        if x[2] == district_id]
    response = make_response(json.dumps(data))
    response.content_type = 'application/json'
    return response

@app.route("/vaccineslot/<string:vaccine>/<string:district>/", methods=["GET"])
def get_request2(vaccine,district):
    """
    Handle GET request to - /<department_id>/
    Return a list of tuples - (<employee id>, <employee name>)
    """
    district_id = [
        (x[0]) for x in query_db("district")
        if x[1] == district]
    data = [
        (x[3], x[4]) for x in query_db("vaccine")
        if x[2] == district_id[0] and x[1] == vaccine]
    response = make_response(json.dumps(data))
    response.content_type = 'application/json'
    return response

@app.route("/booking/<string:vaccine>/<string:district>/<string:date>/", methods=["GET"])
def manipulate_db(district,vaccine,date):
    district_id = [
        (x[0]) for x in query_db("district")
        if x[1] == district]
    connection = sqlite3.connect('test.db')
    with connection as db:
        cur = connection.cursor()    
        if date.lower()=='today':

          # cur.execute("UPDATE {}".format(table) SET {Column} = {Column} + {Value} WHERE {Condition}
            cur.execute("UPDATE vaccine set today_slot=today_slot-1 where today_slot > 0 and vaccine_name='{}' and district_id='{}'".format(vaccine,district_id[0]) )
        elif date.lower()=='tomorrow':
            print(district_id[0])
            print(vaccine)
            print(date)
            cur.execute("UPDATE vaccine set tomorrow_slot=tomorrow_slot-1 where tomorrow_slot > 0 and vaccine_name='{}' and district_id='{}'".format(vaccine,district_id[0]) )
    a=["VACC"+str(random.randint(500, 50000))]
    response = make_response(json.dumps(a))
    response.content_type = 'application/json'
    return response

if __name__ == "__main__":

    app.run(debug=True)
