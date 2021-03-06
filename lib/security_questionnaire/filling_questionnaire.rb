require_relative 'get_input_faqs.rb'
require_relative 'write_to_csv.rb'
require_relative 'csv_database_operations.rb'
require_relative 'find_answers.rb'
require_relative 'similarity_matrix.rb'

class FillingQuestionnaire
  
  def self.fill(number_of_answers)
    if number_of_answers.to_i.zero?
      number_of_answers = 4
    end
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
      FindAnswers.calculate_values_per_file(questions, number_of_answers)
      questions.each do |ques|
        WriteToCsv.write_new_qa(ques)
      end
    end
  end

end