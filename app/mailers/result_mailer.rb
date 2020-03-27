class ResultMailer < ApplicationMailer
    default from: '"工場求人ナビ 適職診断テスト" <noreply@717450.com>'

    def result_email(email, age, job, wage, sex, place, dormitory, answers_text, result_title)
        @email = email
        @age = age
        @job = job
        @wage = wage
        @sex = sex
        @place = place
        @dormitory = dormitory
        @answers = answers_text
        @result_title = result_title
        mail(to: @email, subject: '工場求人ナビ')
    end
end
