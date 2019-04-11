require 'my_referrer/version'
require 'uri'

module MyReferrer
  extend self 
  def my_referrer
    session['my_referrer'] = 'drt' unless request.referrer.present?
    session['my_referrer'] = URI(request.referrer).host
                                                  .split('www.')
                                                  .pop
                                                  .split('/').shift
    gon.referrer = session['my_referrer']
  end

  def load_outbound_links(arr)
    gon.referrer_urls = arr
  end
end
