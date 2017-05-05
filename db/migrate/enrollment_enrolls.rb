class CreateEnrollmentEnrolls < ActiveRecord::Migration
  def change
    create_table :enrollment_enrolls do |t|
      t.integer :enrollment_lecture_id, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
