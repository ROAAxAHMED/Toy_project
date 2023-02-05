FROM python:3.7 
MAINTAINER Roaa

WORKDIR /app

COPY . .

RUN python -m venv exvenv
# Activate virtual environment
ENV source exvenv/bin/activate
RUN pip install -r requirements.txt

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "src/hello.py"]



