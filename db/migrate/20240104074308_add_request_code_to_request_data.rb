class AddRequestCodeToRequestData < ActiveRecord::Migration[7.2]
  def change
    add_column :request_data, :code, :string
  end
end
