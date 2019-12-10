require 'sinatra/base'
require './lib/url'
require 'base64'


class URLShortner < Sinatra::Base
  
  get '/' do
    File.read('index.html')
  end


  post '/' do
    URL.generate_short_url(params[:url])
  end

  get '/:url' do
    "Your url is #{url}"
  end

  run! if app_file == $0
end