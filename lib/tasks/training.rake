require './lib/security_questionnaire/training.rb'
namespace :training do
	desc "Train the data set with new entries"
	task :train, [:test_data_set] => :environment do |t, args|
		# test_data_set = args.test_data_set
    args.with_default(:test_data_set => "/home/kirthana/OriginalTestDataSet_Ori_faq1.csv")
    Training.train(args[:test_data_set])
	end
end