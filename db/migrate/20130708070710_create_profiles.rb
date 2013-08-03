class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :kana_first_name
      t.string :kana_last_name
      t.datetime  :birthday
      t.string  :zip
      t.integer :pref_code
      t.string :address0
      t.string :address1
      t.string :address2
      t.string :phone
      t.string :cell_phone
      t.string :contact_method
      t.integer :user_id

      t.timestamps
    end
  end
end
