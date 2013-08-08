class AddColumnsToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :contact_phone, :integer, :default => 0 
    add_column :profiles, :contact_cell_phone, :integer, :default => 0
    add_column :profiles, :contact_mail, :integer, :default => 0
  end
end
