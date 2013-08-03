class CreateApplies < ActiveRecord::Migration
  def change
    create_table :applies do |t|
      t.integer :user_id
      t.integer :job_id
      t.boolean :result, :default => true

      t.timestamps
    end
    add_index :applies, :user_id
    add_index :applies, :job_id
  end
end
