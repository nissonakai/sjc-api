class ResultMailer < ApplicationMailer
    default from: '"工場求人ナビ 適職診断テスト" <noreply@717450.com>'

    def result_email(result)
        @email = result.email
        @age = result.age
        @job = result.job
        @wage = result.wage
        @sex = result.sex
        @prefecture_id = result.prefecture_id
        @dormitory = result.dormitory
        @answers = result.answers
        @result_title = result.result_title
        mail(to: @email, subject: '工場求人ナビ')
    end
end
