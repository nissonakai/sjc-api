class ResultMailer < ApplicationMailer
    default from: '工場求人ナビ'

    def welcome_email(email, age, job, wage, sex)
        @email = email
        @age = age
        @job = job
        @wage = wage
        @sex = sex
        mail(to: @email, subject: '工場求人ナビ診断結果テスト')
    end
end
