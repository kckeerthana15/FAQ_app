PREREQUISITES:

1. gsl 2.1.0.3
2. similarity gem

﻿STEPS TO BE FOLLOWED:

1. Place all the FAQs to be answered in the input folder (/lib/security_questionnaire/temp/input). Refer to input file specifications for details on how the file must be given as input.

2. Run the rake task to fill the questionnaire,

                rake filling_questionnaire:fill

By default, top four relevant answers will be written to the output file. If you wish to have a specific number of relevant answers, you may pass it as an argument to the rake task as follows,

                rake filling_questionnaire:fill[7]

This will fill the output csv with the top seven relevant answers for any given question.

3. The output files with the filled answers may be found in the output folder in tmp. (/tmp/output)

4. Open the output files and select the appropriate answer and place it in the second column. Delete remaining columns.

5. Move the final files to the training_folder in the temp folder (/lib/security_questionnaire/temp/training_folder)

6. Training : If answers which are not available in the database are present in the final files, they must be updated in the database for future use. To train the database, run the following rake task after conforming to the output file specifications.
        
                rake training:train

NOTE:

1. You can also download the data set from the link below (google drive link)

2. Populate the database using the following command in console,
                
		CsvDatabaseOperations.populate_db(path_to_data_set)

3. To export the database to a csv file, run the following command,

		rake export_db:export                

The file can be found in the output folder in tmp (/tmp/exported_data_set.csv)

INPUT FILE SPECIFICATIONS:

1. All input files must be either a csv or xlsx file.
2. All input files must have only questions in the first column.
3. All other columns must be blank.
4. Headers must be removed.

OUTPUT FILE SPECIFICATIONS (BEFORE TRAINING):

1. Headers may be left as is.
2. The final answer to each question must be present in the second column.
3. No other columns must be present in the file.
