require 'json'

class URL

  @@all_urls = []


  def self.generate_short_url
    "http://localhost:4567" + "/abc123"
  end

  def self.convert_to_json(param_url)
    new_url = {url: param_url}.to_json
    return new_url
  end
end