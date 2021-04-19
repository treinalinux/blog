# README

Create Project blog

- rails new blog -d postgresql --skip-turbolinks

Config bootstrap
- yarn add bootstrap jquery popper.js
- rm -rf app/assets/stylesheets

- vim app/assets/config/manifest.js 
    remove line:
    //= link_directory ../stylesheets .css 

- vim config/webpack/environment.js

```javascript
const { environment } = require('@rails/webpacker')
const webpack = require('webpack')

// Add an additional plugin of your choosing : ProvidePlugin
environment.plugins.prepend(
  'Provide',
  new webpack.ProvidePlugin({
    $: 'jquery',
    jQuery: 'jquery',
    jquery: 'jquery',
    'window.Tether': 'tether',
    Popper: ['popper.js', 'default']
  })
)

module.exports = environment
```

- vim app/javascript/packs/application.js

```javascript
import "bootstrap"

import "../src/application.css"

```

- mkdir app/javascript/src

- vim app/javascript/src/application.css
```css
@import 'bootstrap';
```

- vim app/views/pages/index.html.erb 
```ruby
# Change:
<%= stylesheet_link_tag 'application', media: 'all' %>                        
# For:
<%= stylesheet_pack_tag 'application', media: 'all' %> 

# Create div container and insert yield
    <div class='container'>
      <%= yield %>
    </div>
```
- vim config/webpacker.yml

```yml
# extract_css: false                                                          
extract_css: true 
```

- vim config/database.yml

```yml
  default: &default
  adapter: postgresql
  encoding: unicode
  username: postgres
  host: 192.168.0.189
```
- rails db:create 
- rails generate scaffold post title:string author:string body:text
- rails generate model comment post:references author body:text
- rails db:migrate 


This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
