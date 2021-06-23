from flask_wtf import Form
from wtforms import SelectField, StringField, validators
from wtforms.fields.simple import SubmitField


class TestForm(Form):
    state = SelectField(u'', choices=())
    district = SelectField(u'', choices=())
    vaccine = SelectField(u'', choices=())
    dose=SelectField(u'', choices=("Select your Dose","Dose-1","Dose-2"))

class BookForm(Form):
    user_name=StringField('Full Name', [validators.required(), validators.length(max=20)])
    proof_id=StringField('Heath Insurance ID', [validators.DataRequired(), validators.length(max=10,min=10)])
    submit=SubmitField("Register")
    