class EnrollmentViewsGenerator < Rails::Generators::Base
  source_root File.expand_path("../../../../app/views/enrollment", __FILE__)

  def views
    empty_directory 'app/views/enrollment'

    Dir.foreach File.expand_path("../../../../app/views/enrollment", __FILE__) do |file1| # Searching for files in app/views
      Dir.foreach File.expand_path("../../../../app/views/enrollment/"+file1, __FILE__) do |file2|
        copy_file(file1+"/"+file2, 'app/views/enrollment/' + file1+"/"+file2) if file1 != '.' && file1 != '..' && file2 != '.' && file2 != '..' && file1 != 'layouts'
      end
    end
    
  end

end
