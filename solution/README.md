# Part I

## Commands Executed

```bash
docker run -d --name csvserver infracloudio/csvserver:latest
docker ps -a
docker logs csvserver
nano gencsv.sh


chmod +x gencsv.sh
./gencsv.sh 2 8
docker run -d --name csvserver -v $(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
docker exec -it csvserver /bin/sh
netstat -tuln
docker run -d --name csvserver -p 9393:9300 -e CSVSERVER_BORDER=Orange -v $(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
curl http://localhost:9393

## Part II

### Commands Executed

docker rm -f csvserver
nano docker-compose.yaml
nano csvserver.env
docker-compose up -d

## Part II

### Commands Executed

docker-compose down
nano docker-compose.yaml
nano prometheus.yml
docker-compose up -d
curl http://localhost:9090
