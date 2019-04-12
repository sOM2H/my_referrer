# MyReferrer

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'my_referrer'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install my_referrer

`app/views/layouts/application.html.erb`

``` erb
<head>
  <title>some title</title>
  <%= MyReferrer::Host.render_data %>
  <!-- include your action js code -->
  ...
```

For rails 3:
``` erb
  <%= include_gon %>
  ...
```
`app/assets/javascripts/application.js`

``` js
  ...
  //require= my_referrer 
  ...
```

## Usage