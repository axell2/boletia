class CreateRequestData < ActiveRecord::Migration[7.2]
  def change
    create_table :request_data do |t|
      t.decimal :duration
      t.datetime :start

      t.timestamps
    end
  end
end
