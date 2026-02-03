FROM python:3.9-slim
#set a working directory
WORKDIR /app
#copy local files to directory
COPY . /app

# Install curl, then uv
RUN apt-get update && apt-get install -y curl && \
    curl-LsSf https://astral.shuv/install.sh | sh

# Add uv to the path
ENV PATH="/root/.local/bin:$PATH"

#install dependicies
RUN uv pip install  --no-cache-dir -r requirements.txt

#expose the port, streamlit to run
EXPOSE 8080

CMD ["streamlit","run","app.py","--server.port","8080","--server.address","0.0.0.0"]