class CsvDatabaseOperations

  def self.import_from_db
    all_data = SecurityQuestionnaire.all
    col_data = []
    all_data.each do |data|
      col_data << data.question
      col_data << data.answer
    end
    return col_data
  end
  
  def self.export_to_csv
    col_data = SecurityQuestionnaire.all
    CSV.open("/tmp/exported_data_set.csv", "a+") do |csv|
      col_data.each do |data|
        temp_arr = []
        temp_arr << data.question
        temp_arr << data.answer
        csv << temp_arr
      end
    end
  end

  def self.add_entry_to_db(question, answer)
    SecurityQuestionnaire.create(question: question, answer: answer)
  end

  def self.populate_db(filename)
    CSV.foreach(filename,"r") do |data|
      add_entry_to_db(data[0], data[1])
    end
  end

  def self.get_questions_from_db
    all_data = SecurityQuestionnaire.all
    col_data = []
    all_data.each do |data|
      col_data << data.question
    end
    return col_data
  end
end