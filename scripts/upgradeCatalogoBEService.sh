cd /home/is2admin/git/catalogo-strumenti/
git reset --hard
git pull
kill -9 $(lsof -t -i:9081)
cd /home/is2admin/git/catalogo-strumenti/catalogo-strumenti-backend/catalogo-backend-service
mvn clean install
nohup mvn spring-boot:run&
