class ResultMailer < ApplicationMailer
    default from: '"工場求人ナビ 適職診断テスト" <noreply@717450.com>'

    def result_email(result)
        @result = result
        mail(to: "s-nakai@nisso.co.jp", subject: '工場求人ナビ')
    end

    def recommend_email(result)
        @result = result
        mail(to: @result.email, subject: '適職診断テスト結果のお知らせ 工場求人ナビ')
    end
end
