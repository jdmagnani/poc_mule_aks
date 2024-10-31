
mvn clean package

docker build -t mulelatest .

docker run -it --rm -p 8083:8083 mulelatest 
