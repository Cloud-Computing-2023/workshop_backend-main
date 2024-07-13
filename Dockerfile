FROM python:3.9-slim
#FROM 461388931911.dkr.ecr.ca-central-1.amazonaws.com/python-base-image:8b75e18

#Make app folder on root
RUN mkdir -p /app

#Set working directory for application
WORKDIR /app

#Copy installation direction file and perform packages installation
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

#Copy application to working directoy
COPY *.py ./
COPY Procfile ./

EXPOSE 5000

#Run app with gunicorn 
CMD ["gunicorn",  "-b", "0.0.0.0:5000", "app:app"]


