require 'csv'

class ReadingFromCsv
  def self.get_array_of_qa
    col_data = []
    CSV.foreach($test_data_set,"r") do |row|
      ans = row[1]
      unless ans.to_s.empty?
        temp = row[0]
        col_data << temp
        temp = row[1]
        col_data << temp
      end
    end
    return col_data
  end

end
