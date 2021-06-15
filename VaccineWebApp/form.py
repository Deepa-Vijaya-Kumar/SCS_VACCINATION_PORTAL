from flask_wtf import Form
from wtforms import SelectField, StringField, validators
from wtforms.fields.simple import SubmitField


class TestForm(Form):
    state = SelectField(u'', choices=())
    district = SelectField(u'', choices=())
    vaccine = SelectField(u'', choices=())

class BookForm(Form):
    user_name=StringField('Full Name', [validators.required(), validators.length(max=20)])
    proof_id=StringField('Heath Insurance ID', [validators.required(), validators.length(max=10)])
    submit=SubmitField("Register")
