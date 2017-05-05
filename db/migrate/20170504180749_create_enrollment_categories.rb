class CreateEnrollmentCategories < ActiveRecord::Migration[4.2]
  def change
    create_table :enrollment_categories do |t|
      t.string :name
      #t.string   :route_name
      t.text :info

      t.timestamps null: false
    end
  end
end
