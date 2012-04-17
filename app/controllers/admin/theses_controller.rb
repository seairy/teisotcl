# -*- encoding : utf-8 -*-
class Admin::ThesesController < Admin::BaseController
  
  def index
    @theses = Thesis.paginate :page => params[:page]
  end
end
