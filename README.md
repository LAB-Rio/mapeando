# Mapeando

Mapa colaborativo de demandas para cidades. 
Você pode ver a plataforma online no endereço http://mapeando.rio.gov.br.

Acompanhe o desenvolvimento do Mapeando em todas as cidades do Brasil: https://trello.com/b/LgPNEE4W/mapeando

![Mapeando](http://cl.ly/image/2H0028220e2u/Image%202015-08-03%20at%206.53.17%20PM.png)




### Para copiar a aplicação para o seu próprio servidor
Clique no botão abaixo e faça uma conta no Heroku (serviço de hospedagem gratuito). Em seguida você terá ou escolherá um endereço para a plataforma.

[![Deploy](http://i.imgur.com/UCel2Wf.png)](https://heroku.com/deploy)

### Como Rodar o Projeto 
```
    $ rvm use 2.2.0
    $ bundle install 
    $ sudo service postgresql start
    
    $ rake db:create && rake db:migrade
    $ rails server 
    
    #For cloud9
        $ rails server -b $IP -p $PORT
        sudo su - postgres
        
        Or the more modern form:

        sudo -u postgres -i
        
        Or
        sudo -u postgres createuser owning_use 
        sudo -u postgres createuser ubuntu(if cloud9) 
        
```
### PostgreSQL
```
rake db:create RAILS_ENV=development
rake db:migrate RAILS_ENV=development
```


Create a new username and password for postgresql on cloud9:
```
$ sudo service postgresql start
$ sudo sudo -u postgres psql
postgres=# CREATE USER username SUPERUSER PASSWORD 'password';
postgres=# \q
Create ENV variables on cloud9:

$ echo "export USERNAME=username" >> ~/.profile
$ echo "export PASSWORD=password" >> ~/.profile
$ source ~/.profile
My database.yml for rails 4.2.0 on cloud9:

default: &default
  adapter: postgresql
  encoding: unicode
  pool: 5
  username: <%= ENV['USERNAME'] %>
  password: <%= ENV['PASSWORD'] %>
  host:     <%= ENV['IP'] %>

development:
  <<: *default
  database: sample_app_development

test:
  <<: *default
  database: sample_app_test

production:
  <<: *default
  database: sample_app_production
Include the gem pg in Gemfile and install:

gem 'pg', '~> 0.18.2'
$ bundle install

```
Update template1 postgresql for database.yml on cloud9:

```
postgres=# UPDATE pg_database SET datistemplate = FALSE WHERE datname = 'template1';
postgres=# DROP DATABASE template1;
postgres=# CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UNICODE';
postgres=# UPDATE pg_database SET datistemplate = TRUE WHERE datname = 'template1';
postgres=# \c template1
postgres=# VACUUM FREEZE;
postgres=# \q
```
From command line run:

```
bundle exec rake db:create
```






##### Referências
*[Criando Banco](http://stackoverflow.com/questions/28404482/rails-fatal-database-myapp-development-does-not-exist)
*[Criando usuario postgre](http://stackoverflow.com/questions/11919391/postgresql-error-fatal-role-username-does-not-exist)
### Como Colaborar
Você pode abrir uma [issue](https://github.com/LAB-Rio/mapeando) no repositório ou pode dar feedbacks pelo email mapeando@labrio.cc.



### Licença de uso
You're free. Você pode usar este produto da forma que quiser, mantendo a identidade do Mapeando, porém sem fins comerciais (senão, perde-se o propósito da ferramenta :).

#
![cc-by-nc-sa](http://i.imgur.com/ske74If.png)

username SUPERUSER PASSWORD 'password';