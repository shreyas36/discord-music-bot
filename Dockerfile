FROM ubuntu:20.04

# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip

# Create an app directory and copy the Python code into it
RUN mkdir /app
COPY . /app
WORKDIR /app

# Install Python dependencies
RUN pip3 install -r requirements.txt

RUN req.sh

# Run the Python code
CMD ["python3", "main.py"]
