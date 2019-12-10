require 'sinatra/base'
require './lib/url'


class URLShortner < Sinatra::Base
  
  get '/' do
    File.read('index.html')
  end


  post '/' do
    "Your long url is #{URL.convert_to_json(params['url'])}"
  end


  run! if app_file == $0
end