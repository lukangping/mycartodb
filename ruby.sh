curl -sSL https://get.rvm.io | bash -s stable --ruby
source /home/ubuntu/.rvm/scripts/rvt
rvm install 1.9.2 --default

export LC_ALL="en_US.UTF-8"
export SUBDOMAIN=development
git clone --recursive https://github.com/CartoDB/cartodb20.git


