FROM python:3.10
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir --uprgade -r requirements.txt
COPY . .
CMD ["flask" , "run"]