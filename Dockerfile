FROM ubuntu:24.04

RUN apt-get update && apt-get install -y \
	postgresql \    
    && rm -rf /var/lib/apt/lists/*

WORKDIR /sql-demo

COPY . /sql-demo

RUN chmod +x /sql-demo/setup.sh

CMD ["/bin/bash", "-c", "/sql-demo/setup.sh && exec su - postgres"]
