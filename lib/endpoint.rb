class Endpoint
  def self.root_url
    if Rails.env.production?
      'https://stepstreak.zajelbook.com/'
    else
      'http://192.168.0.89:3000'
    end
  end
end