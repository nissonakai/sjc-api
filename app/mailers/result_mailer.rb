class ResultMailer < ApplicationMailer
    default from: 'test@example.com'

    def welcome_email(email, age, job, wage)
        @email = email
        @age = age
        @job = job
        @wage = wage
        mail(to: @email, subject: 'result_test')
    end
end
