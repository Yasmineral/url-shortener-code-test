require 'url_generator'

long_url = "http://www.farmdrop.com"
short_url = "/aHR0cDo" 

describe URLGenerator do
  it 'shortened urls are stored in a hash as a JSON object with their original long URL reference' do
    URLGenerator.save_urls(long_url, short_url)
    expect(URLGenerator.all_urls).to include ({short_url: "/aHR0cDo", url: "http://www.farmdrop.com"})
  end
end