class FindAnswers

  def self.calculate_values_per_file(questions)
    @@counter = 0
    @@col_data = CsvDatabaseOperations.import_from_db
    @@similarity_matrix = SimilarityMatrix.get_similarity_matrix(questions)
    @@documents = SimilarityMatrix.get_document_obj_from_corpus(questions)
    WriteToCsv.calculate_time
  end

  def self.similarity_hash
    mid_index = SimilarityMatrix.get_ori_doc_size
    in_index = mid_index + @@counter
    sim_hash = Hash.new
    @@documents.each_with_index do |doc1, index1|
      if index1 < in_index
         similarity = @@similarity_matrix[in_index, index1]
         sim_hash[index1]=similarity
      end
    end
    return sim_hash
  end

  def self.get_answers
    sim_hash = self.similarity_hash
    v = (sim_hash.sort_by {|k, v| v}).reverse
    return v
  end

  def self.print_qa
    v = self.get_answers
    temp_array = Array.new
    relevant_answers = Hash.new
    in_index = SimilarityMatrix.get_ori_doc_size
    i = 1
    v.each do |k,v|
      next if k >= in_index
        if (k%2==0)
          ques = @@col_data[k]
          if @@col_data[k+1].downcase.include?("see above") || @@col_data[k+1].downcase.include?("refer above") #changed eql to include paychex,66,ans 4
            ans = @@col_data[k-1]
          else
            ans = @@col_data[k+1]
          end
        end
        if (k%2==1)
          ques = @@col_data[k-1]
          ans = @@col_data[k]
        end
        temp_array << ques
        temp_array << ans
       

        # ques_arr = Array.new
        # ans_arr = Array.new
        # relevant_answers.each do |k,v|
        # #       if v.first.include?(ques) or v.last.include?(ans) 
        #         ques_arr = relevant_answers.collect {|k,v| v.first}
        #         ans_arr = relevant_answers.collect {|k,v| v.last}
        #         #puts ques_arr
        #         #puts ans_arr.class
        # end
        # if !ques_arr.any? { |s| s.include?(ques) } and !ans_arr.any? { |a| a.include?(ans)}
        #         relevant_answers[i] = [ques,ans]
        #         i = i + 1
        # end



        unless relevant_answers.has_value?(temp_array)
          relevant_answers[i]=[ques, ans]
          i = i+1  
        end
        temp_array.clear
        if i==5
          break
        end
      end
    @@counter = @@counter +  1
    return relevant_answers
  end

end