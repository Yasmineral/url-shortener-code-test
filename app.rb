require 'sinatra/base'
require './lib/url_generator'

class URLShortner < Sinatra::Base
  get '/' do
    File.read('index.html')
  end

  post '/' do
    url = JSON.parse(request.body.read)
    URLGenerator.generate_short_url(url['url'])
  end

  get '/:url' do
    short_url = "/#{params['short_url']}"
    long_url = URLGenerator.retrieve_url(short_url)
      if long_url 
        redirect long_url, 301
      else
        return status 400
      end
  end

  run! if app_file == $PROGRAM_NAME
end
