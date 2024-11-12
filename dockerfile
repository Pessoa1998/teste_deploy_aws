# Use uma imagem base do Python
FROM python:3.10-slim

# Crie um usuário não-root
RUN groupadd -r puser && useradd -r -m -g puser -G audio,video -s /sbin/nologin puser
USER puser

# Defina o diretório de trabalho
WORKDIR /app

# Copie apenas requirements.txt
COPY requirements.txt .

# Instale dependências do Python
RUN pip install --no-cache-dir -r requirements.txt

# Copie o código da aplicação
COPY . .

# Exponha a porta
EXPOSE 5000

# Comando para rodar a aplicação (substitua 'app.py' pelo nome correto do arquivo principal)
CMD ["python", "app.py"]
