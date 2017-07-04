class WriteToCsv

  def self.calculate_time
    @@timestamp = Time.now.to_s.gsub(' ', '-')
  end

  def self.fill_headers(number_of_answers)
    i = 1
    Dir.mkdir("/tmp/output") unless File.exists?("/tmp/output")
    @@output_file = String.new
    @@output_file = @@timestamp + "_" + File.basename($input_faq_file,File.extname($input_faq_file)) + "_answered.csv"
    headers = Array.new
    headers << "Original Question"
    while i <= number_of_answers.to_i
      headers << "Question #{i}"
      headers << "Answer #{i}"
      i = i + 1
    end
    CSV.open("/tmp/output/#{@@output_file}","a+") do |csv|
      csv << headers if csv.count.eql?0
    end
  end 

  def self.write_new_qa(question)
    ans = FindAnswers.print_qa
    temp_array = Array.new
    CSV.open("/tmp/output/#{@@output_file}","a+") do |csv|
      temp_array.clear
      temp_array << question
      ans.each do |k,v|
        temp_array << v.first
        temp_array << v.last
      end
      csv << temp_array
    end
  end

end