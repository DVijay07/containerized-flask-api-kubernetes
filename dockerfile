
# flow of coder 

#1. create directory in docker 
#2. copy the code .txt, .py to docker directory
#3. install the dependencies packages
#4. run the code

#5. build the docker image
# REPOSITORY                                      TAG                                                                           IMAGE ID       CREATED         SIZE
#python-app                                      latest                                                                        57ef0983d8fb   2 minutes ago   1.12GB
#6. run the docker container


FROM python:3.10

WORKDIR /app

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY Layer1_backend.py .

CMD ["python3", "Layer1_backend.py"]



