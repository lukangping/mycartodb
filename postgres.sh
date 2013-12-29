sudo apt-get install postgresql-9.1 postgresql-client-9.1 postgresql-contrib-9.1 postgresql-server-dev-9.1 -y &&
sudo apt-get install postgresql-plpython-9.1 -y &&

wget http://download.osgeo.org/geos/geos-3.4.2.tar.bz2
tar xf geos-3.4.2.tar.bz2
cd geos-3.4.2
.configure
make
sudo make install


wget http://download.osgeo.org/postgis/source/postgis-2.0.2.tar.gz
tar xf postgis-2.0.2.tar.gz
cd postgis-2.0.2
./configure --with-raster --with-topology
make
sudo make install


##初始化数据库
export PATH=/usr/lib/postgresql/9.1/bin:$PATH
sudo -u postgres psql
ALTER USER postgres WITH PASSWORD 'postgres';

sudo mkdir -p /var/lib/pgsql/data
cd /var/lib/pgsql/
sudo chown postgres.postgres data
export PATH=/usr/lib/postgresql/9.1/bin:$PATH
initdb -E UTF-8 -D /var/lib/pgsql/data --locale=en_US.UTF-8 -U postgres -W

##修改配置
cd /etc/postgresql/9.1/main
sudo vim postgresql.conf
---
listen_addresses = '*'     //监听所有ip的连接，默认是本机
---

sudo vim pg_hba.conf
---
local   all             postgres                                md5

# TYPE  DATABASE        USER            ADDRESS                 METHOD

# "local" is for Unix domain socket connections only
local   all             all                                     trust
# IPv4 local connections:
host    all             all             127.0.0.1/32            trust
# IPv6 local connections:
host    all             all             ::1/128                 trust
---

##重启数据库
sudo service postgresql restart



sudo su postgres
export POSTGIS_SQL_PATH=`pg_config --sharedir`/contrib/postgis-2.0
createdb -E UTF8 template_postgis
createlang -d template_postgis plpgsql
psql -d postgres -c "UPDATE pg_database SET datistemplate='true' WHERE datname='template_postgis'"
psql -d template_postgis -f $POSTGIS_SQL_PATH/postgis.sql
psql -d template_postgis -f $POSTGIS_SQL_PATH/spatial_ref_sys.sql
psql -d template_postgis -f $POSTGIS_SQL_PATH/legacy.sql
psql -d template_postgis -f $POSTGIS_SQL_PATH/rtpostgis.sql
psql -d template_postgis -f $POSTGIS_SQL_PATH/topology.sql
psql -d template_postgis -c "GRANT ALL ON geometry_columns TO PUBLIC;"
psql -d template_postgis -c "GRANT ALL ON spatial_ref_sys TO PUBLIC;"
