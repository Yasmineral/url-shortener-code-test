require 'sinatra/base'

class URLShortner < Sinatra::Base
  
  get '/' do
    File.read('index.html')
  end


  post '/' do
    "Your url is #{params['url']}"
  end


  run! if app_file == $0
end