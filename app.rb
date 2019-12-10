require 'sinatra/base'
require './lib/url'


class URLShortner < Sinatra::Base
  
  get '/' do
    File.read('index.html')
  end

  post '/' do
    url = JSON.parse(request.body.read)
    URL.generate_short_url(url['url'])
  end

  get '/:url' do
    "Your url is #{url}"
  end

  run! if app_file == $0
end