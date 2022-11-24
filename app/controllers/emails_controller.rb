class EmailsController < ApplicationController

    def index
        @email = Email.all
      end
    
      def create
        @newmail = Email.new(object: Faker::Lorem.sentence, body: Faker::Lorem.paragraph )

        if @newmail.save
          puts "0" * 60
            respond_to do |format|
              format.html { puts "not ok" }
              format.js { puts "ok"}
            end
          else

          end
      end

      def show
        puts "-" * 60
        @email= Email.find(params[:id])
        respond_to do |format|
          format.html { puts "not ok" }
          format.js { puts "ok"}
        end
      end

      
  def destroy
    @email = Email.find(params[:id])
    @email.destroy
    redirect_to root_path
  end
end
