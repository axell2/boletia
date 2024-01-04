require 'net/http'
require 'json'

class Latest < ApplicationRecord

  def self.get_latests_currencies
    url = "#{ENV['URL_CURRENCY']}latest?apikey=#{ENV['CURRENCY_API_KEY']}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)
    rate = response_obj['data']
  end

  def self.get_late_meta
    url = "#{ENV['URL_CURRENCY']}latest?apikey=#{ENV['CURRENCY_API_KEY']}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)
    rate = response_obj['meta']
  end

  def self.save_latests_currencies(item,meta)
    if self.exists?(code:item["code"])
      self.where(code: item["code"]).update(value: item["value"],timestamp:meta)
    else
      latests = self.new
        latests.code = item["code"]
        latests.value = item["value"]
        latests.timestamp = meta
      latests.save 
    end
  end

end
