FROM python:3.9-slim@sha256:c01a2db78654c1923da84aa41b829f6162011e3a75db255c24ea16fa2ad563a0

# FROM python:3.9-slim as build

# RUN apt-get update && \
#     apt-get install -y --no-install-recommends \
#     build-essential gcc

RUN groupadd -g 999 python && \ 
    useradd -r -u 999 -g python python

WORKDIR /app

# RUN python -m venv /app/venv

# ENV PATH="/app/venv/bin:$PATH"

COPY requirements.txt .

RUN pip3 install -r requirements.txt

# FROM python:3.9-slim@sha256:c01a2db78654c1923da84aa41b829f6162011e3a75db255c24ea16fa2ad563a0

# WORKDIR /app

# COPY --from=build /app/venv ./venv

COPY  --chown=python:python . .

# RUN chmod +x gunicorn.sh

# ENV PATH="/app/venv/bin:$PATH"
USER 999

CMD [ "python", "app.py" ]
# ENTRYPOINT ["./gunicorn.sh"]