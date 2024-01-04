require 'net/http'
require 'json'

class Divisa < ApplicationRecord

  validates :name, presence: true
  validates :name,uniqueness: true

  def self.get_currencies
    url = "#{ENV['URL_CURRENCY']}currencies?apikey=#{ENV['CURRENCY_API_KEY']}"
    uri = URI(url)
    response = Net::HTTP.get(uri)
    response_obj = JSON.parse(response)
    rate = response_obj['data']
  end

  def self.save_currency(item)
    divisa = self.new
      divisa.symbol = item["symbol"]
      divisa.name = item["name"]
      divisa.symbol_native =item["symbol_native"]
      divisa.decimal_digits= item["decimal_digits"]
      divisa.rounding= item["rounding"]
      divisa.code=item["code"]
      divisa.name_plural=item["name_plural"]
      divisa.countries=item["countries"]
    divisa.save
  end

end
