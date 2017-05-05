class CreateEnrollmentLectures < ActiveRecord::Migration
  def change
    create_table :enrollment_lectures do |t|
      t.string :name
      t.string :info
      t.string :url
      t.text :content
      t.datetime :time_limit_start
      t.datetime :time_limit_end
      t.integer :personnel_limit
      t.string :limit_on_ruby
      t.integer :admin_id
      t.integer :category_id

      t.timestamps null: false
    end
  end
end
