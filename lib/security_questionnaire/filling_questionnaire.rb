require './lib/security_questionnaire/get_input_faqs.rb'
require './lib/security_questionnaire/write_to_csv.rb'
require './lib/security_questionnaire/csv_database_operations.rb'
require './lib/security_questionnaire/find_answers.rb'
require './lib/security_questionnaire/similarity_matrix.rb'

class FillingQuestionnaire
  
  def self.fill
    Dir.chdir("lib/security_questionnaire")
    #CsvDatabaseOperations.populate_db("OriginalTestDataSet_Ori_faq1.csv")
    files = GetInputFaqs.get_from_directory
    files.each do |file|
      if file.include?".xlsx"
        xlsx = Roo::Spreadsheet.open(file)
        xlsx.to_csv(file)
      end
      $input_faq_file = file
      questions = Array.new
      CSV.foreach($input_faq_file) do |row|
       next if row[0].nil?
       questions << row[0]
      end
      FindAnswers.calculate_values_per_file(questions)
      questions.each do |ques|
        WriteToCsv.write_new_qa(ques)
      end
    end
  end

end