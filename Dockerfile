FROM python:3.9-slim
WORKDIR /app

COPY . .

RUN apt-get update && apt-get install ffmpeg libsm6 libxext6  -y

RUN pip install -r requirements.txt

RUN pip install gunicorn

CMD ["gunicorn", "--bind", "0.0.0.0:5000", "wsgi:app"]
