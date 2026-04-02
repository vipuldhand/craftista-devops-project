# /c:/Users/Vipul/Desktop/craftista/catalogue/Dockerfile
FROM python:3.12-slim

# set working dir
WORKDIR /app

# install dependencies if requirements file exists
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# copy app
COPY . .

# expose typical microservice port
EXPOSE 5000

# entrypoint
CMD ["python", "app.py"]