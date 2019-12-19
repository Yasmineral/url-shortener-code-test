require 'json'
require 'base64'

class URLGenerator
  @@all_urls = [{}]

  def self.all_urls
    @@all_urls
  end

  def self.all_urls=(arg)
    @@all_urls = arg
  end

  def self.generate_short_url(long_url)
    short_url = '/' + Base64.encode64(long_url)[0..6]
    save_urls(long_url, short_url)
  end

  def self.save_urls(long_url, short_url)
    all_urls << { short_url: short_url, url: long_url }
    { short_url: short_url, url: long_url }.to_json
  end

  def self.retrieve_url(url)
    hash = all_urls.find {|hash| hash[:short_url] == url}
    if hash 
      url = hash[:url]
    else
      return false
    end
  end
end
