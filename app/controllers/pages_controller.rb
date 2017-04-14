class PagesController < ApplicationController

  def home
  end

  def sms
    account_sid = "AC977749c87e41e5b93a8ca833a36baeba" 
    auth_token = "3e09bfce702b24835af9aa85eba2f675" 
    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create(:body => params[:text],
        :to => '+1'+params[:number],    # Replace with your phone number
        :from => "+15005550006")  # Replace with your Twilio number
    puts message.sid
  end
  
private
  
  def message_param
    params.require(:message).permit(:text,:number)
  end   
  
end