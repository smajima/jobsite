class CreateJobHistories < ActiveRecord::Migration
  def change
    create_table :job_histories do |t|
      t.integer :resume_id
      t.integer :number
      t.datetime :start_month
      t.datetime :end_month
      t.string :company_name
      t.string :hiring_type
      t.text :detail

      t.timestamps
    end
  end
end
