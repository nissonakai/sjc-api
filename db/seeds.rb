# coding: utf-8

Survey.create!(name: "テストアンケート1", selected: true)
Survey.create(name: "テストアンケート2")
Survey.create(name: "テストアンケート3")
Question.create(title: "title1", red: "test1", blue: "test2", survey_id: 1)
Question.create(title: "title2", red: "test3", blue: "test4", survey_id: 1)
Question.create(title: "title3", red: "test5", blue: "test6", survey_id: 1)
Question.create(title: "title4", red: "test7", blue: "test8", survey_id: 1)