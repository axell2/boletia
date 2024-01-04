class DivisasController <  ApplicationController

  def get_divisas
    currencies = Divisa.get_currencies
    currencies.each do |currency|
      currency.each do |item|
        if item["name"] != nil 
          Divisa.save_currency(item)
        end
      end
    end
    @currencies_in_database = Divisa.all
  end
  
  def get_latest

    Latest.response_data
    @latest = Latest.all
  end

  def request_data
    @requests = RequestDatum.all
  end

end