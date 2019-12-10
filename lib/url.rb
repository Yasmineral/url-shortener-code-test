require 'json'
require 'base64'

class URL

  @@all_urls = []


  def self.generate_short_url(long_url)
    short_url = Base64.encode64(long_url)[0..6]
    convert_to_json(long_url, short_url)
  end

  def self.convert_to_json(long, short)
    url_hash = {short_url: short, url: long}.to_json
    @@all_urls << url_hash
    return url_hash
  end
end