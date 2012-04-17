# -*- encoding : utf-8 -*-
class ArticlesController < ApplicationController

  def index
    @articles = Article.available.paginate :page => params[:page], :per_page => 5
  end

  def show
    @article = Article.find(params[:id])
  end
end
