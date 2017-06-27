require 'csv'

class CsvDatabaseOperations

	def self.export_to_db(question, answer)
    SecurityQuestionnaire.create(question: question, answer: answer)
	end

  def self.import_from_db
    all_data = []
    all_data = SecurityQuestionnaire.all
    col_data = []
    all_data.each do |data|
      col_data << data.question
      col_data << data.answer
    end
    return col_data
  end

  def self.populate_db(filename)
    CSV.foreach(filename,"r") do |data|
      SecurityQuestionnaire.create(question: data[0], answer: data[1])
    end
  end
end