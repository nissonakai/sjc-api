# coding: utf-8

20.times do |n|
    Question.create(
        title: "test設問#{n + 1}",
        survey_id: 1,
        personality_attributes:{
            type1: 0,
            type2: 0,
            type3: 0,
            type4: 0,
            type5: 0,
            type6: 0
        }
    )
end