printf 'Type version: '
read -r version

printf 'Type container name: '
read -r containerName

printf 'Type port: '
read -r port

echo "Version:" $version
echo "Container:" $containerName

docker stop -t 0 $containerName && docker container rm $containerName

mvn clean package -Dmaven.test.skip=true

docker build -t $containerName:$version .

docker run -d --restart always --name $containerName -p $port:8080 $containerName:$version