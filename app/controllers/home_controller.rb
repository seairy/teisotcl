# -*- encoding : utf-8 -*-
class HomeController < ApplicationController
  
  def index
    @articles = Article.available.limit(8)
  end
end
