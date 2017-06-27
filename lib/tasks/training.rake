require './lib/security_questionnaire/training.rb'
namespace :training do
	desc "Train the data set with new entries"
	task :train => :environment do
		Training.train
	end
end