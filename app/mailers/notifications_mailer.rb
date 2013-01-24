# encoding: utf-8
class NotificationsMailer < ActionMailer::Base
  helper :application

  default :from => "noreply@elconding.ru"
  default :to =>   "ejiqpep@gmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "#{message.subject}")
  end

  #def new_comment(comment)
    #@comment = comment
    #mail(:subject => "Новый комментарий")
  #end

end
