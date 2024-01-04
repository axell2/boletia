class RequestDatum < ApplicationRecord
  def self.create_request(start,finish,code)
    request = self.new
      request.start = start
      request.duration = finish
      request.code = code
    request.save
  end
end
