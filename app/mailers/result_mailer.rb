class ResultMailer < ApplicationMailer
    default from: '"工場求人ナビ プチ自分発見診断" <noreply@717450.com>'

    def result_email(result)
        @result = result
        mail(to: "nlabo@kk-navi.com", subject: 'プチ自分発見診断 CVしました。')
    end

    def recommend_email(result)
        @result = result
        mail(to: @result.email, subject: 'プチ自分発見診断結果のお知らせ 工場求人ナビ')
    end
end
