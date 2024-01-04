class CreateDivisas < ActiveRecord::Migration[7.2]
  def change
    create_table :divisas do |t|
      t.string :symbol
      t.string :name
      t.string :symbol_native
      t.string :decimal_digits
      t.string :rounding
      t.string :code
      t.string :name_plural
      t.string :countries

      t.timestamps
    end
  end
end
