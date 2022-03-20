kill -9 $(lsof -t -i:8080)
cd /home/is2admin/git/catalogo-strumenti/catalogo-strumenti-frontend
npm install
nohup npm run serve&  