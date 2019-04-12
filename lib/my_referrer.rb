require 'my_referrer/version'
require 'my_referrer/engine'
require 'uri'

module  MyReferrer
  def self.init(request)
    if request.referrer.present? && @my_referrer.nil?
      @my_referrer = URI(request.referrer).host
                                          .split('www.')
                                          .pop
                                          .split('/').shift
    else
      @my_referrer = 'drt'
    end
  end

  def self.load_urls(arr)
    @my_referrer_urls = arr
  end

  def self.render
    '<script>\n//<![CDATA[\nwindow.mr={};mr.referrer="'+@my_referrer+'";mr.referrer_urls=' + @my_referrer_urls.to_s + ';\n//]]>\n</script>'
  end


  def self.generate_fake_data
    @my_referrer = ['google.com', 'yandex.com', 'vk.com', 'telegram.com'].sample
  end
end