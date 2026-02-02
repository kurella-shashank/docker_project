FROM python:3.9-slim
#set a working directory
WORKDIR /app
#copy local files to directory
COPY ./app

#install dependicies
RUN uv pip install  --no-cache-dir-r requirements.txt

#expose the port, streamlit to run
EXPOSE 8501

CMD["streamlit","run","app.py","--server.port","8080","--server.address","0.0.0.0"]