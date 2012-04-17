# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  
  def index
    @articles = Article.available.limit(5)
  end
end
