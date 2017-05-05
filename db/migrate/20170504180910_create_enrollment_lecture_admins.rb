class CreateEnrollmentLectureAdmins < ActiveRecord::Migration
  def change
    create_table :enrollment_lecture_admins do |t|

      t.timestamps null: false
    end
  end
end
