FROM python:3.9-slim

WORKDIR /app
COPY . /app

# Install curl, then install uv (fix the URL and add space)
RUN apt-get update && apt-get install -y curl && \
    curl -LsSf https://astral.sh/uv/install.sh | sh

# Add uv to PATH
ENV PATH="/root/.local/bin:$PATH"

# Install dependencies
RUN uv pip install --system --no-cache-dir -r requirements.txt  

EXPOSE 8080

CMD ["streamlit", "run", "app.py", "--server.port", "8080", "--server.address", "0.0.0.0"]   