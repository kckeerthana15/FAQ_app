class Training

	def self.train(test_data_set)
    if test_data_set.to_s.empty?
      test_data_set = "/home/kirthana/OriginalTestDataSet_Ori_faq1.csv"
    end
    all_files = (Dir.glob("/tmp/output/*.csv"))
    data_ques = Array.new
    #test_data_set = "/home/kirthana/OriginalTestDataSet_Ori_faq1.csv" #data set
    CSV.foreach(test_data_set, "r") do |row|
      data_ques << row[0]
    end  
    ques_ans = Hash.new 
    i = 0
    all_files.each do |output_file| #output files 
      #CSV.foreach("/home/kirthana/ICANTFINDTHEDAMNFILE.csv") do |row| # output file
      CSV.foreach("#{output_file}", "r") do |row|
        if !data_ques.include?row[0] and  row[0]!="Original Question"
           ques = row[0]
           ans = row[1]
           i = i +1
           ques_ans[i] = [ques, ans]
        end
      end
    end
    CSV.open(test_data_set, "a+") do |csv|
      ques_ans.each do |k,v|
        csv<<[v[0],v[1]]
      end
    end
  end

end