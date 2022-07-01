FROM python:3.9-slim@sha256:c01a2db78654c1923da84aa41b829f6162011e3a75db255c24ea16fa2ad563a0

RUN groupadd -g 999 python && \ 
    useradd -r -u 999 -g python python

WORKDIR /app

COPY requirements.txt .

# RUN pip install -r requirements.txt
RUN set -ex \
    && pip install --upgrade pip \
    && pip install --no-cache-dir -r /app/requirements.txt

COPY  --chown=python:python . .

RUN chmod +x gunicorn.sh

USER 999

EXPOSE 5000

ENTRYPOINT ["./gunicorn.sh"]