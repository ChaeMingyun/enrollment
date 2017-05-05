class CreateEnrollmentLectureAdmins < ActiveRecord::Migration
  def change
    create_table :enrollment_lecture_admins do |t|
      t.integer :enrollment_lecture_id, foreign_key: true
      t.integer :user_id

      t.timestamps
    end
  end
end
