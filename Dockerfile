FROM python:3.10-slim-buster

WORKDIR /app

COPY ./requirements.txt .
RUN pip install -r requirements.txt
RUN python -m textblob.download_corpora

COPY . /app/

EXPOSE 8000
CMD [ "main.py" ]
ENTRYPOINT [ "python" ]