class CreateLatests < ActiveRecord::Migration[7.2]
  def change
    create_table :latests do |t|
      t.string :code
      t.decimal :value

      t.timestamps
    end
  end
end
