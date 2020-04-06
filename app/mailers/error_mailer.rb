class ErrorMailer < ApplicationMailer
    default from: '"工場求人ナビ 適職診断テスト" <noreply@717450.com>'

    def alert_email(number)
        @number = number
        mail(to: "s-nakai@nisso.co.jp", subject: '【適職診断テスト】エラーアラート')
    end

end
