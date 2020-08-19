# coding: utf-8

4.times do |n|
    ValuesQuestion.create(
        title: "価値観診断テスト設問#{n + 1}",
        survey_id: 1,
        category: n + 1,
        choice1: "テストテスト#{n + 1}A",
        choice2: "テストテスト#{n + 1}B",
        choice3: "テストテスト#{n + 1}C",
        choice4: "テストテスト#{n + 1}D"
    )
end

20.times do |n|
    PersonalityQuestion.create(
        title: "性格診断テスト設問#{n + 1}",
        survey_id: 1,
        count1: rand(4),
        count2: rand(4),
        count3: rand(4),
        count4: rand(4),
        count5: rand(4),
        count6: rand(4),
        choice1: "テストテスト#{n + 1}A",
        choice2: "テストテスト#{n + 1}B"
    )
end

