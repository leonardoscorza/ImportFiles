# README

* Description:
[Import files] é um sistema para fazer o upload de relatórios de vendas via arquivo txt.
O sistema tem uma interface responsiva usando Bootstrap e permite que o usuário veja o histórico de todos os uploads e delete os relatórios desejados (também avisa quando foi o último upload e mostra o valor bruto das vendas).
O sistema conta com testes usando Rspec, FactoryGirl e Faker.


* Ruby version: 2.2.2
* Rails: 5.0.0

Instructions:
* Database creation: run "rake db:create" and "rake db:migrate"
* Instalation: Run "bundle"
* Execution: Run "rails s" (if in a localhost environment) and go to localhost:3000 in your browser
* How to run the test suite: run "bundle exec rspec"
