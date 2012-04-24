# -*- encoding : utf-8 -*-
class Admin::ThesesController < Admin::BaseController
  
  def index
    @theses = Thesis.order('created_at DESC').paginate :page => params[:page]
  end
end
