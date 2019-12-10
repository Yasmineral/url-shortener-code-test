require 'sinatra/base'
require './lib/url_generator'

class URLShortner < Sinatra::Base
  get '/' do
  end

  post '/' do
    url = JSON.parse(request.body.read)
    URLGenerator.generate_short_url(url['url'])
  end

  get '/:url' do
    short_url = "/#{params['short_url']}"
    if URLGenerator.all_urls.key(short_url)
      redirect_to URLGenerator.all_urls[:url], 301
    else
      return status 400
    end
  end

  run! if app_file == $PROGRAM_NAME
end
