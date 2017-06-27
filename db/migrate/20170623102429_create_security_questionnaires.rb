class CreateSecurityQuestionnaires < ActiveRecord::Migration
  def up
      create_table :security_questionnaires do |t|
        t.text :question, null: false 
        t.text :answer, null: false 
        t.timestamps null: false	
      end
  end

  def down
    drop_table :security_questionnaires
  end
end
