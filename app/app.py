# Antes esse código estava com a nomenclatura __init__.py e hoje ele está com a nomenclatura app.py
from flask import Flask
from flask_sqlalchemy import SQLAlchemy

app = Flask(__name__)
# DATABASE_URL=postgresql://meu_usuario:123@localhost/meu_banco
# app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://your_user:your_password@postgres/your_db'
# app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///items.db'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://meu_usuario:123@localhost/meu_banco'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
db = SQLAlchemy(app)

from app import routes  # Importa as rotas após a inicialização do app e db

app.config['DEBUG'] = True
