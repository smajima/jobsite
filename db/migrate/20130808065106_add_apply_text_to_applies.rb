class AddApplyTextToApplies < ActiveRecord::Migration
  def change
    add_column :applies, :apply_text, :text
  end
end
