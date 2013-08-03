class CreateMails < ActiveRecord::Migration
  def change
    create_table :mails do |t|
      t.string :title
      t.text :text
      t.string :direction
      t.string :status
      t.integer :apply_id
      
      t.timestamps
    end
    add_index :mails, :apply_id
  end
end
