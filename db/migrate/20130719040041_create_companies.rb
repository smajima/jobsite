class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.date :established_date
      t.string :ceo
      t.integer :capital
      t.integer :employee_number
      t.text :works
      t.string :url
      t.string :address
      t.string :one_word
      t.text :summary
      t.integer :p_mamanger_id
      
      t.timestamps
    end
  end
end
