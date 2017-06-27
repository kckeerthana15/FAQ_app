require 'csv'
require './lib/security_questionnaire/find_answers.rb'
require './lib/security_questionnaire/csv_database_operations.rb'
require 'byebug'
class WriteToCsv
	def self.calculate_time
		@@timestamp = Time.now.to_s.gsub(' ', '-')
		@@timestamp = (@@timestamp.inspect).to_s
	end

	def self.write_new_qa(question)
		@@output_file = String.new
    headers = ['Original Question', 'Question 1', 'Answer 1', 'Question 2', 'Answer 2', 'Question 3', 'Answer 3', 'Question 4', 'Answer 4']
		ans = FindAnswers.print_qa
		@@timestamp = Time.now.to_s.gsub(' ', '-')
		@@output_file = @@timestamp + "_" + File.basename($input_faq_file,File.extname($input_faq_file)) + "_answered.csv"
		puts "Output file name is #{@@output_file}".colorize("light_blue")
		Dir.mkdir("/tmp/output") unless File.exists?("/tmp/output")
		temp_array = Array.new
		CSV.open("/home/kirthana/ICANTFINDTHEDAMNFILE.csv","a+") do |csv|
		#CSV.open("/tmp/output/#{@@output_file}","a+") do |csv|
			csv << headers if csv.count.eql?0
			temp_array.clear
			temp_array<<question
			ans.each do |k,v|
				ques = v.first
				ans = v.last
				temp_array<<ques
				temp_array<<ans
			end
			csv << temp_array
		end
	end

  def self.get_output_file_name
    return @@output_file
  end

end