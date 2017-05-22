require 'rails/generators/active_record'

class EnrollmentGenerator < Rails::Generators::Base
  include Rails::Generators::Migration

  source_root File.expand_path("../../../../", __FILE__)

  def generate_enrollment
=begin
    # Controllers
    empty_directory 'app/controllers/enrollment'

    Dir.foreach File.expand_path("../../../../app/controllers/enrollment", __FILE__) do |file| # Searching for files in app/views
      copy_file(file, 'app/controllers/enrollment/' + file) if file != '.' && file != '..'
    end

    # Helpers
    empty_directory 'app/helpers/enrollment'

    Dir.foreach File.expand_path("../../../../app/helpers/enrollment", __FILE__) do |file| # Searching for files in app/views
      copy_file(file, 'app/helpers/enrollment/' + file) if file != '.' && file != '..'
    end
    # Models
    ['category','enroll','lecture_admin','lecture'].each do |dbname|
      copy_file 'app/models/enrollment/enrollment_'+dbname+'.rb', 'app/models/enrollment_'+dbname+'.rb'
    end
=end

    # Migrations
    %w(categories enrolls lecture_admins lectures).each do |db_name|
      migration_template 'db/migrate/enrollment_'+db_name+'.rb', 'db/migrate/create_enrollment_'+db_name+'.rb'
    end

    #Initializer
    copy_file 'config/initializers/enrollment.rb', 'config/initializers/enrollment.rb'
    # Routes
    #Engine works for routes

  end

  def self.next_migration_number(dir_name)
    ActiveRecord::Generators::Base.next_migration_number dir_name
  end
end
