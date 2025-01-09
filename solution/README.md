# Part I

## Commands Executed

```bash
docker run -d --name csvserver infracloudio/csvserver:latest
docker ps -a
docker logs csvserver
nano gencsv.sh

# Contents of gencsv.sh
#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Usage: $0 start_index end_index"
    exit 1
fi
start_index=$1
end_index=$2

> inputFile

for ((i=start_index; i<=end_index; i++))
do
    echo "$i, $RANDOM" >> inputFile
done 

chmod +x gencsv.sh
./gencsv.sh 2 8
docker run -d --name csvserver -v $(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
docker exec -it csvserver /bin/sh
netstat -tuln
docker run -d --name csvserver -p 9393:9300 -e CSVSERVER_BORDER=Orange -v $(pwd)/inputFile:/csvserver/inputdata infracloudio/csvserver:latest
curl http://localhost:9393
