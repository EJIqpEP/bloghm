# encoding: utf-8
class PagesController < ApplicationController

  before_filter :published, :only => [:show]
  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new

  end

  def edit
    @page = Page.find(params[:id])
  end

  def create
    @page = Page.new(params[:page])

    if @page.save
      redirect_to edit_page_path(@page.slug), notice: 'Page was successfully created.'
    else
      render action: "new"
    end
  end

  def update
    @page = Page.find(params[:id])

    if @page.update_attributes(params[:page])
      redirect_to edit_page_path(@page.slug), notice: 'Page was successfully updated.'
    else
      render action: "edit"
    end
  end

  def destroy
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to pages_path, :notice => "Страница удалена"
  end

  def published
    page = Page.find(params[:id])
    redirect_to(root_path) unless (page.published == true and page.published_at <= Time.zone.now) or (signed_in?)
  end
end
