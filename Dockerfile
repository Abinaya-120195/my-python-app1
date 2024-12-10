ROM python:3.9-slim
WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt
EXPOSE 8000
COPY . .

# Run the application (replace 'your_script.py' with your main application file)
CMD ["python", "app.py"]


