class EnrollmentViewsGenerator < Rails::Generators::Base
  source_root File.expand_path("../../../../app/views/enrollment", __FILE__)

  def views
    empty_directory 'app/views/enrollment'

    Dir.foreach File.expand_path("../../../../app/views/enrollment", __FILE__) do |file| # Searching for files in app/views
      copy_file(file, 'app/views/enrollment/' + file) if file != '.' && file != '..'
    end
  end
end
