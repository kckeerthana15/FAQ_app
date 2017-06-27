require 'get_input_faqs.rb'
require 'write_to_csv.rb'
require 'find_answers.rb'
require 'csv'

$test_data_set = "ori_faq1.csv"

files = GetInputFaqs.get_from_directory
puts "Files to be parsed"
puts files

$input_faq_file="questions.csv"
FindAnswers.calculate_values_per_file
CSV.foreach($input_faq_file,"r") do |row|
  ques = row[0]
  puts ques
  WriteToCsv.write_new_qa(ques)
end