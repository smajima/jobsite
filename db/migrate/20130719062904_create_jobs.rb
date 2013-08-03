class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.string :job_id
      t.string :title
      t.string :occupation
      t.text :background
      t.text :detail
      t.string :hiring_type
      t.text :credentials
      t.string :work_place
      t.string :work_time
      t.text :salary
      t.text :compensation
      t.text :holidays
      t.datetime :posting_start
      t.datetime :posting_end
      t.integer :job_category
      t.integer :company_id

      t.timestamps
    end
  end
end
