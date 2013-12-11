sudo apt-get install nodejs npm -y &&
sudo apt-get install redis-server -y &&
sudo apt-get install libmapnik libmapnik-dev mapnik-utils python-mapnik -y

##CartoDB-SQL
git clone git://github.com/CartoDB/CartoDB-SQL-API.git
cd CartoDB-SQL-API
git checkout master
# Edit npm-shrinkwrap.json to change zipfile version from 0.3.4 to 0.4.2
sudo npm install -g node-gyp
npm install
cp config/environments/development.js.example config/environments/development.js
node app.js development

##Winshaft
export LC_ALL="en_US.UTF-8"
git clone git://github.com/CartoDB/Windshaft-cartodb.git
cd Windshaft-cartodb
git checkout master
# Edit npm-shrinkwrap.json to change mapnik version from 0.7.22 to 0.7.25
npm install
cp config/environments/development.js.example config/environments/development.js
# Edit config/environments/development.js line #31 change undefined to '2.1.1'
node app.js development
