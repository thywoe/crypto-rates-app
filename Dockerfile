FROM python:3.9-slim@sha256:c01a2db78654c1923da84aa41b829f6162011e3a75db255c24ea16fa2ad563a0

RUN groupadd -g 999 python && \ 
    useradd -r -u 999 -g python python

WORKDIR /app

COPY requirements.txt .

RUN pip3 install -r requirements.txt

COPY  --chown=python:python . .

RUN chmod +x gunicorn.sh

USER 999

# CMD [ "python", "app.py" ]
ENTRYPOINT ["./gunicorn.sh"]