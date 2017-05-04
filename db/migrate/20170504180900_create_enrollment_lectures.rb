class CreateEnrollmentLectures < ActiveRecord::Migration
  def change
    create_table :enrollment_lectures do |t|

      t.timestamps null: false
    end
  end
end
