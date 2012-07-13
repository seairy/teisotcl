# -*- encoding : utf-8 -*-
class Admin::ThesesController < Admin::BaseController
  
  def index
    @theses = Thesis.order('created_at DESC').paginate :page => params[:page]
  end
  
  def rated
    @theses = Thesis.rated.paginate :page => params[:page]
  end
  
  def unrate
    @theses = Thesis.unrate.paginate :page => params[:page]
  end
  
  def submited
    @theses = Thesis.submited.approved.paginate :page => params[:page]
  end
  
  def search
    @keyword = params[:keyword].strip
    if @keyword.blank?
      redirect_to admin_theses_path
    else
      @theses = Thesis.search(params[:keyword]).paginate :page => params[:page]
      render 'result'
    end
  end
  
  def archive
    archive_name = Thesis.archive
    send_file "#{::Rails.root.to_s}/public/archives/#{archive_name}", :filename => archive_name, :type => 'application/octet-stream'
  end
end
