class CreateEnrollmentEnrolls < ActiveRecord::Migration[4.2]
  def change
    create_table :enrollment_enrolls do |t|
      t.integer :user_id
      t.integer :lecture_id

      t.timestamps null: false
    end
  end
end
