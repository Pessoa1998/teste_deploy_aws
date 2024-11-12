from app.app import celery, db
from app.models import Item

@celery.task
def add_item_task(nome, descricao, preco, quantidade):
    novo_item = Item(nome=nome, descricao=descricao, preco=preco, quantidade=quantidade)
    db.session.add(novo_item)
    db.session.commit()
    return {'status': 'Item adicionado com sucesso'}
