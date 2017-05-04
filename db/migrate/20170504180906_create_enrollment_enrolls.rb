class CreateEnrollmentEnrolls < ActiveRecord::Migration
  def change
    create_table :enrollment_enrolls do |t|

      t.timestamps null: false
    end
  end
end
