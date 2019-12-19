require 'url_generator'

long_url = 'http://www.farmdrop.com'
short_url = '/aHR0cDo'

describe URLGenerator do

  describe '.save_urls' do
    it 'shortened urls are stored in a hash as key value pairs with their original long URL reference' do
      URLGenerator.save_urls(long_url, short_url)
      expect(URLGenerator.all_urls).to include ({ short_url: "/aHR0cDo", url: "http://www.farmdrop.com" })
    end
    it 'a JSON object containing both the long & short URLs is returned' do
      expect(URLGenerator.save_urls(long_url, short_url)).to eq '{"short_url":"/aHR0cDo","url":"http://www.farmdrop.com"}'
    end
    it 'can store multiple hashes with long & short url references' do
      URLGenerator.all_urls = []
      URLGenerator.save_urls(long_url, short_url)
      URLGenerator.save_urls('http://www.google.com', "/qwRt9Va")
      expect(URLGenerator.all_urls).to eq [{short_url: "/aHR0cDo", url: "http://www.farmdrop.com" }, {short_url: "/qwRt9Va", url: "http://www.google.com"}]
    end
  end

  describe '.retrieve_url' do
    it 'returns the corresponding long url' do
      URLGenerator.save_urls(long_url, short_url)
      expect(URLGenerator.retrieve_url(short_url)).to eq ('http://www.farmdrop.com')
    end
  end
end


