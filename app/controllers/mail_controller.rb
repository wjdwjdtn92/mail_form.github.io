class MailController < ApplicationController
  def mail_form
  end
  
  def send_mail
    @email   = params[:input_email]
    @title   = params[:input_title]
    @content = params[:input_content]
    @name    = params[:input_name]
    
    if (@email.size == 0 || @title.size == 0 || @content.size == 0 || @name.size == 0)
    else
      mg_client = Mailgun::Client.new("key-675c93a6b4727346c12fc113087370ed")
  
      message_params =  {
                           from:    @email,
                           to:      'wjdwjdtn92@likelion.org',
                           subject: "[" + @name + "]" + @title,
                           text:    @content
                        }
      
      result = mg_client.send_message('sandboxafa42c3cf0994d79a18c9e45b7808cdf.mailgun.org', message_params).to_h!
    end
    redirect_to "/mail/mail_form"
  end
end
