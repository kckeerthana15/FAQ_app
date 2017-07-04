require './lib/security_questionnaire/csv_database_operations.rb'

class Training

	def self.train
    all_files = (Dir.glob(File.dirname(__FILE__) + "/temp/training_folder/*.csv"))

    if all_files.empty?
      abort "No files in output folder(/lib/security_questionnaire/temp/training_folder) to be trained."
    end 

    all_files = (Dir.glob(File.dirname(__FILE__) + "/temp/training_folder/*.csv"))
    data_ques = CsvDatabaseOperations.get_questions_from_db

    all_files.each do |output_file| 
      CSV.foreach("#{output_file}", "r") do |row|
        if !data_ques.include?row[0] and row[0] != "Original Question"
          CsvDatabaseOperations.add_entry_to_db(row[0], row[1])
        end
      end
    end
  end
end