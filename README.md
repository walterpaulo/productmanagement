# README

# Prodct Management - MVC

#### Requerimentos/Conhecimentos e Tecnologias utilizadas
- Ruby 2.7 [(https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released)](https://www.ruby-lang.org/en/news/2019/12/25/ruby-2-7-0-released);
- Rails 6.1.4.4 [https://guides.rubyonrails.org/6_1_release_notes.html](https://guides.rubyonrails.org/6_1_release_notes.html);
- BotStrap 5.1.3 [https://getbootstrap.com/docs/5.1/getting-started/introduction](https://getbootstrap.com/docs/5.1/getting-started/introduction);

### System dependencies 

### Configuration

- Download the project and enter the directory
```
git clone https://github.com/walterpaulo/productmanagement.git

cd productmanagement/

yarn

bunble

```

#### Database creation
```
rails migrate
```
#### Install webpacker
```
bundle exec rails webpacker:install
```
#### Start Project
```
rails server
```

### Testing Rails Applications [https://guides.rubyonrails.org/v6.1/testing.html](https://guides.rubyonrails.org/v6.1/testing.html)

**Model Product** ([test/models/product_test.rb](test/models/product_test.rb))
```
rails test test/models/product_test.rb
```


* validates product creation;

* Create and validate fields;

* update product;

* delete product;

**Model User** ([test/models/user_test.rb](test/models/user_test.rb))
```
rails test test/models/user_test.rb
```


* validates user creation;

* Create and validate fields;

* update user;

* delete user;

**Controller Users** ([test/controllers/users_controller_test.rb](test/controllers/users_controller_test.rb))
```
rails test test/controllers/users_controller_test.rb
```
* should get index
* should get new
* should create user
* should show user
* should get edit
* should update user
* should destroy user

**Controller Products** ([test/controllers/products_controller_test.rb](test/controllers/products_controller_test.rb))
```
rails test test/controllers/users_controller_test.rb
```
* should get index
* should get new
* should create product
* should show product
* should get edit
* should update product
* should destroy product




