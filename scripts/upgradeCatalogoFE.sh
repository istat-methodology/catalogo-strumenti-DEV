cd /home/is2admin/git/catalogo-strumenti/
git reset --hard
git pull
kill -9 $(lsof -t -i:9071)
cd /home/is2admin/git/catalogo-strumenti/catalogo-strumenti-frontend
npm install
nohup npm run serve&  
