require 'my_referrer/version'
require 'uri'

module  MyReferrer
  def self.init(request, standart = 'drt')
    if request.referrer.present? && @my_referrer.nil?
      @my_referrer = URI(request.referrer).host
                                          .split('www.')
                                          .pop
                                          .split('/').shift
    else
      @my_referrer = standart
    end
  end

  def self.load_urls(gon, arr)
    gon.referrer = @my_referrer
    gon.referrer_urls = arr
    gon
  end
end