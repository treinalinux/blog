# Project blog

**This README is not finished yet, it will soon be finished.**

## Create Project

```bash
rails new blog -d postgresql --skip-turbolinks
```

## Config bootstrap on Rails 6

```bash
yarn add bootstrap jquery popper.js
```

**remove folder stylesheets**

```bash
rm -rf app/assets/stylesheets
```


```bash
vim app/assets/config/manifest.js
```

**remove line:**

```javascript
//= link_directory ../stylesheets .css
```

```bash
vim config/webpack/environment.js
```

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

```bash
vim app/javascript/packs/application.js
```

```javascript
import "bootstrap"

import "../src/application.css"

```

```bash
mkdir app/javascript/src
```

```
vim app/javascript/src/application.css
```

```css
@import 'bootstrap';
```

**Change stylesheet_link_tag for stylesheet_pack_tag**

```bash
vim app/views/layouts/application.html.erb
```

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


```bash
vim config/webpacker.yml
```

```yml
# extract_css: false
extract_css: true
```

**Done, end config bootstrap on Rails 6**
---

## Config database postgresql remoto

```
vim config/database.yml
```

```yml
  default: &default
  adapter: postgresql
  encoding: unicode
  username: postgres
  host: 192.168.0.189
```

## Create database

```bash
- rails db:create

- rails generate scaffold post title:string author:string body:text

- rails generate model comment post:references author body:text

- rails db:migrate
```

