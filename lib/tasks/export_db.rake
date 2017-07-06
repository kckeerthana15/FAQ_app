require './lib/security_questionnaire/csv_database_operations.rb'
namespace :export_db do
  desc "Export database to a csv file"
  task :export => :environment do
    CsvDatabaseOperations.export_to_csv
  end
end