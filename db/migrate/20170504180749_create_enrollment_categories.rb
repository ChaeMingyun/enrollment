class CreateEnrollmentCategories < ActiveRecord::Migration
  def change
    create_table :enrollment_categories do |t|

      t.timestamps null: false
    end
  end
end
