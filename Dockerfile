FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive
# Install Python and pip
RUN apt-get update && apt-get install -y python3 python3-pip 
RUN apt-get install -y ffmpeg
# Create an app directory and copy the Python code into it
RUN mkdir /app
COPY main.py /app
COPY requirements.txt /app
COPY help_cog.py /app
COPY music_cog.py /app
COPY token.ini /app
WORKDIR /app

# Install Python dependencies
RUN pip3 install -r requirements.txt

# RUN wget https://www.gyan.dev/ffmpeg/builds/packages/ffmpeg-2022-11-21-git-459527108a-full_build.7z

# RUN 7z x ffmpeg-2022-11-21-git-459527108a-full_build.7z -o/app/ffmpeg

# ENV PATH="${PATH}:/app/ffmpeg/bin"
# Run the Python code
CMD ["python3", "main.py"]
