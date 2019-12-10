require 'json'
require 'base64'

class URL

  @@all_urls = []


  def self.generate_short_url(long_url)
    short_url = Base64.encode64(long_url)[0..6]
    hash = {short_url: short_url, url: long_url}.to_json
  end

  # def self.create_hash(long, short)
  #   url_hash = {short_url: short, url: long}
  #   @@all_urls << url_hash
  #   return url_hash.to_json
  # end
end