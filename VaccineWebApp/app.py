import json
from flask import Flask, request, render_template, make_response,flash
# from flask.helpers import flash
from flask_wtf.recaptcha import validators
from form import TestForm,BookForm
from query import query_db
import sqlite3
import random
import datetime
from datetime import timedelta

app = Flask(__name__)
app.config['SECRET_KEY'] = "my precious"


@app.route("/", methods=["GET", "POST"])
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

@app.route("/book/<string:state>/<string:district>/<string:vaccine>/<string:dose>/<string:time>/<string:date>/", methods=["GET", "POST"])
def book(state,district,vaccine,date,dose,time):
    """
    Render form and handle form submission
    """
    form = BookForm(request.form)

    # if request.method=="GET":
    return render_template('book.html', form=form,district =district,state=state,vaccine=vaccine,date=date,dose=dose,time=time)
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

@app.route("/booking/<string:vaccine>/<string:district>/<string:date>/<string:dose>/<string:health_id>/", methods=["GET"])
def manipulate_db(district,vaccine,date,dose,health_id):
    duration={ "BioNTech-Pfizer": 21,
                "AstraZeneca": 28,
                "Johnson & Johnson": 56,
                "Moderna":28}

    district_id = [
        (x[0]) for x in query_db("district")
        if x[1] == district]
    connection = sqlite3.connect('test.db')
    with connection as db:
        cur = connection.cursor()    
        cur.execute("SELECT * from vaccine_status where health_id='{}'".format(health_id))
        rows = cur.fetchall()
        if len(rows)!=0 and dose=="Dose-1":
            response = {
                "success": False,
                "message": "Dose-1 already booked for this ID!"
            }
            response = make_response(json.dumps(response))
            response.content_type = 'application/json'
            return response 
        cur.execute("SELECT vaccination_status from vaccine_status where health_id='{}'".format(health_id))
        rows = cur.fetchall()
        if len(rows)!=0 and dose=="Dose-2" and rows[0][0]=='TRUE':
            response = {
                "success": False,
                "message": "Dose-2 already booked for this ID!"
            }
            response = make_response(json.dumps(response))
            response.content_type = 'application/json'
            return response 
        elif len(rows)!=0 and dose=="Dose-2" and rows[0][0]=='FALSE':
            cur.execute("SELECT dose1_date from vaccine_status where health_id='{}'".format(health_id))
            rows = cur.fetchall()
            dose1_date=datetime.datetime.strptime(rows[0][0],"%d/%m/%Y")
            dose2_date=dose1_date+datetime.timedelta(days=duration[vaccine])
            cur.execute("SELECT vaccine_name from vaccine_status where health_id='{}'".format(health_id))
            rows = cur.fetchall()  
            if rows[0][0]!="AstraZeneca" or vaccine!="Moderna":
                if rows[0][0]!="Moderna" or vaccine!="AstraZeneca":  
                    if rows[0][0]!=vaccine:
                        response = {
                        "success": False,
                        "message": "Booking for Dose-2 can be done only for "+rows[0][0]
                        }
                        response = make_response(json.dumps(response))
                        response.content_type = 'application/json'
                        return response 
        elif dose=="Dose-2":
            cur.execute("SELECT * from vaccine_status where health_id='{}'".format(health_id))
            rows = cur.fetchall()  
            if len(rows)==0:
                response = {
                        "success": False,
                        "message": "Booking for Dose-2 cannot be done before Dose-1! Please book for Dose-1 first!"
                        }
                response = make_response(json.dumps(response))
                response.content_type = 'application/json'
                return response 

          
            # print(dose2_date< datetime.datetime.now())

        if date.lower()=='today':
            date=datetime.datetime.now().strftime("%d/%m/%Y")
            if dose=="Dose-2" and dose2_date> datetime.datetime.now():
                response = {
                "success": False,
                "message": "Booking for Dose-2 can be done only after "+dose2_date.strftime("%d/%m/%Y")
                }
                response = make_response(json.dumps(response))
                response.content_type = 'application/json'
                return response 
          # cur.execute("UPDATE {}".format(table) SET {Column} = {Column} + {Value} WHERE {Condition}
            cur.execute("UPDATE vaccine set today_slot=today_slot-1 where today_slot > 0 and vaccine_name='{}' and district_id='{}'".format(vaccine,district_id[0]) )
        elif date.lower()=='tomorrow':
            date=datetime.datetime.now()+datetime.timedelta(days=1)
            if dose=="Dose-2" and dose2_date> date:
                response = {
                "success": False,
                "message": "Booking for Dose-2 can be done only after "+dose2_date.strftime("%d/%m/%Y")
                }
                response = make_response(json.dumps(response))
                response.content_type = 'application/json'
                return response 
            date=date.strftime("%d/%m/%Y")
            

            # print(district_id[0])
            # print(vaccine)
            # print(date)
            cur.execute("UPDATE vaccine set tomorrow_slot=tomorrow_slot-1 where tomorrow_slot > 0 and vaccine_name='{}' and district_id='{}'".format(vaccine,district_id[0]) )
    token=["VACC"+str(random.randint(500, 50000))]
    dose1_date=""
    dose2_date=""
    if dose=="Dose-1":
        dose1_date=date
        cur.execute("INSERT into vaccine_status (health_id,dose1_date,dose2_date,registration_token,vaccination_status,vaccine_name)values({},'{}','{}','{}','{}','{}')".format(health_id,dose1_date,dose2_date,token[0],"FALSE",vaccine))
    else:
        dose2_date=date
        cur.execute("UPDATE vaccine_status set dose2_date='{}', vaccination_status='TRUE' where health_id={}".format(dose2_date,health_id))
    connection.commit()
    response = {
                "success": True,
                "message": token
            }
    response = make_response(json.dumps(response))
    response.content_type = 'application/json'
    return response

if __name__ == "__main__":

    app.run(debug=True)
