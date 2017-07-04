namespace :filling_questionnaire do
	desc "Fills in customer questionnaires"
	task :fill, [:number_of_answers] => :environment do |t, args|
		FillingQuestionnaire.fill(args[:number_of_answers])
	end
end