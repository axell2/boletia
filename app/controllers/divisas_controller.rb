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

    meta = Latest.get_late_meta
    @meta = meta["last_updated_at"]
    latests = Latest.get_latests_currencies
    latests.each do |lates|
      lates.each do |item|
        if item["code"] != nil
          Latest.save_latests_currencies(item,@meta)
        end
      end
    end
    @latest = Latest.all
  end
end