# MyReferrer

Outbound referrer hidden link gem for monolith projects.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gon'
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
  <%= Gon::Base.render_data %>
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

Load you`r data in application controller:

```ruby
gon.referrer = MyReferrer.referrer(request)
gon.referrer_urls = ['example.com', 'someshit.ru']
```

Or use custom referrer moderation.

Example:
```ruby
require 'uri'

before_action :get_session_referrer 
before_action :referrer_urls

...

def get_session_referrer
  unless request.referrer.nil?
    if gon.referrer.nil? &&  URI(request.referrer).host != "mirpokera.com"
      s_referrer = URI(request.referrer).host
      s_referrer_host = s_referrer.split(".")
      if s_referrer.eql?("www.yandex.ru") || s_referrer.eql?("yandex.ru")
        session['referrer'] = "seyr"
      elsif s_referrer.eql?("www.google.ru") || s_referrer.eql?("google.ru")
        session['referrer'] = "segr"
      elsif s_referrer.include?("google")
        session['referrer'] = "seg"
      elsif s_referrer.include?("yandex")
        session['referrer'] = "sey"
      else
        session['referrer'] = s_referrer.split("www.").pop
      end
    end
  else 
    session['referrer'] = "drt"
  end
  gon.referrer = session['referrer']
end

def referrer_urls
  gon.referrer_urls = Array.new()
  SourceLink.all.each{|sl| gon.referrer_urls.push(sl.link)}
end

...

```

It's my realization:
```ruby
if @my_referrer.nil?
  if request.referrer.present?
    @my_referrer = URI(request.referrer).host
                                        .split('www.')
                                        .pop
                                        .split('/').shift
  else
    @my_referrer = 'drt'
  end
end
@my_referrer

```
## License

The MIT License

## Contributing

1. Fork it ( https://github.com/sOM2H/my_referrer/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request