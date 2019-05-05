require 'my_referrer/version'
require 'my_referrer/engine'
require 'uri'

module  MyReferrer
  def self.referrer(request)
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
  end
end
