require 'json'
require 'base64'

  class URLGenerator

    @@all_urls = []
  
    def self.all_urls
      @@all_urls
    end
  
    def self.generate_short_url(long_url)
      short_url = "/" + Base64.encode64(long_url)[0..6]
      self.save_urls(long_url, short_url)
    end
  
    def self.save_urls(long_url, short_url)
      hash = {short_url: short_url, url: long_url}
      @@all_urls << hash
      hash.to_json
    end
  end