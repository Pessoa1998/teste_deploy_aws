# Antes esse código estava com a nomenclatura __init__.py e hoje ele está com a nomenclatura app.py
# from flask import Flask
# from flask_sqlalchemy import SQLAlchemy
# app = Flask(__name__)
# DATABASE_URL=postgresql://meu_usuario:123@localhost/meu_banco
# app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://your_user:your_password@postgres/your_db'
# app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///items.db'
# app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://meu_usuario:123@localhost/meu_banco'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# db = SQLAlchemy(app)
# from app import routes
# app.config['DEBUG'] = True





































# from flask import Flask
# from flask_sqlalchemy import SQLAlchemy
# from celery import Celery

# app = Flask(__name__)
# app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://meu_usuario:123@localhost/meu_banco'
# app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
# app.config['DEBUG'] = True

# # Configuração do broker do Celery
# app.config['CELERY_BROKER_URL'] = 'redis://localhost:6379/0'
# app.config['CELERY_RESULT_BACKEND'] = 'redis://localhost:6379/0'

# db = SQLAlchemy(app)

# # Configurando o Celery
# def make_celery(app):
#     celery = Celery(app.import_name, broker=app.config['CELERY_BROKER_URL'])
#     celery.conf.update(app.config)
#     celery.Task = type('ContextTask', (celery.Task,), {'run': lambda s, *a, **k: app.app_context().push() or s.run(*a, **k)})
#     return celery

# celery = make_celery(app)

# from app import routes  # Importa as rotas após a inicialização do app e db











































































from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from celery import Celery

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://meu_usuario:123@localhost/meu_banco'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['DEBUG'] = True

# Configuração do broker e backend do Celery
app.config['CELERY_BROKER_URL'] = 'redis://localhost:6379/0'
app.config['CELERY_RESULT_BACKEND'] = 'redis://localhost:6379/0'

db = SQLAlchemy(app)

# Configurando o Celery
def make_celery(app):
    celery = Celery(app.import_name, broker=app.config['CELERY_BROKER_URL'])
    celery.conf.update(app.config)
    class ContextTask(celery.Task):
        def __call__(self, *args, **kwargs):
            with app.app_context():
                return self.run(*args, **kwargs)
    celery.Task = ContextTask
    return celery

celery = make_celery(app)

from app import routes  # Importa as rotas após a inicialização do app e db
