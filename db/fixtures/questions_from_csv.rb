require 'csv'

csv_personality = CSV.read('db/fixtures/fixture_personality_questions.csv')
csv_personality.each do |line|
   PersonalityQuestion.seed do |s|
    s.survey_id = Survey.find_by(selected: true).id
    s.title = line[0]
    s.choice1 = line[1]
    s.choice2 = line[2]
    s.countA = line[3]
    s.countB = line[4]
   end
end

csv_values = CSV.read('db/fixtures/fixture_values_questions.csv')
csv_values.each do |line|
   ValuesQuestion.seed do |s|
      s.survey_id = Survey.find_by(selected: true).id
      s.title = line[0]
      s.choice1 = line[1]
      s.choice2 = line[2]
      s.choice3 = line[3]
      s.choice4 = line[4]
   end
end
