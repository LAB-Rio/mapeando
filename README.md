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
    
    $rake db:create && rake db:migrade
    $rails server 
    
    #For cloud9
        $rails server -b $IP -p $PORT
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
##### Referências
*[Criando Banco](http://stackoverflow.com/questions/28404482/rails-fatal-database-myapp-development-does-not-exist)
*[Criando usuario postgre](http://stackoverflow.com/questions/11919391/postgresql-error-fatal-role-username-does-not-exist)
### Como Colaborar
Você pode abrir uma [issue](https://github.com/LAB-Rio/mapeando) no repositório ou pode dar feedbacks pelo email mapeando@labrio.cc.



### Licença de uso
You're free. Você pode usar este produto da forma que quiser, mantendo a identidade do Mapeando, porém sem fins comerciais (senão, perde-se o propósito da ferramenta :).

#
![cc-by-nc-sa](http://i.imgur.com/ske74If.png)

