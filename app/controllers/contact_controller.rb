# encoding: utf-8
class ContactController < ApplicationController

  before_filter :tag_cloud, :only => [:new]
  before_filter :most_recent_posts
  def new
    @search = Post.published.search(params[:search])
    @message = Message.new
  end

  def create
    @message = Message.new(params[:message])
    if @message.valid?
      NotificationsMailer.new_message(@message).deliver
      redirect_to(root_path, :notice => 'Сообщение отправлено.')
    else
      flash.now.alert = 'Заполните все поля'
      render "new"
    end
  end

  def most_recent_posts
    @most_recent_posts ||= Post.published.limit(5)
  end
end
