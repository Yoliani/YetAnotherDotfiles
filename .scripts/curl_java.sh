echo $1 
echo $2

curl -X POST -H "Content-Type:application/json" -d $1 http://localhost:8080/'{$2}'


