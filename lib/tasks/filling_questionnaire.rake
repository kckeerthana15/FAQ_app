require './lib/security_questionnaire/filling_questionnaire.rb'
namespace :filling_questionnaire do
	desc "Fills in customer questionnaires"
	task :fill => :environment do
		FillingQuestionnaire.fill
	end
end