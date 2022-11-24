class MailController < ApplicationController

  def index
    @email = Email.all
  end

  def create
    @newmail = Email.create(object: Faker::Lorem.sentence, body: Faker::Lorem.paragraph )
  end
  
end
