class GetInputFaqs
	def self.get_from_directory
    all_files = (Dir.glob("temp/input/*.csv"))
		all_xl_files = (Dir.glob("temp/input/*.xlsx"))
    all_files.concat(all_xl_files)
    if !all_files.any? 
      puts "No input files found in input folder(/lib/security_questionnaire/temp/input). Please create a folder and add files to continue"
      abort
    end
    return all_files
	end
end