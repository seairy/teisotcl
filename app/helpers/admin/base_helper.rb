# -*- encoding : utf-8 -*-
module Admin::BaseHelper
  
  def edit_tag target
    link_to raw("#{image_tag 'admin/edit.gif'} 编辑"), url_for([:admin, target]) + '/edit'
  end

  def destroy_tag target
    link_to raw("#{image_tag 'admin/destroy.gif'} 删除"), [:admin, target], confirm: '确定要删除吗？', method: :delete
  end

  def shortcut_tag

  end

  def flash_tag
    if flash[:alert]
      content_tag 'p', h(flash[:alert]), :class => 'notice alert'
    elsif flash[:notice]
      content_tag 'p', h(flash[:notice]), :class => 'notice'
    end
  end

  def human_boolean_tag value
    raw(value ? '<span class="cgreen">是</span>' : '<span class="cred">否</span>')
  end

  def human_date_tag value
    value.blank? ? '无' : value.strftime('%Y-%m-%d')
  end

  def human_datetime_tag value
    value.blank? ? '无' : value.strftime('%Y-%m-%d %H:%M')
  end

  def human_text_tag value
    raw(RedCloth.new(value).to_html) unless value.blank?
  end
  
  def human_gender_tag gender
    case gender
    when 1 then '男'
    when 2 then '女'
    end
  end

  def human_user_role_tag user_role
    case user_role
    when User::RoleAdmin then '管理员'
    when User::RoleLeader then '领导'
    when User::RoleEditor then '编辑'
    end
  end
  
  def user_role_options
    [['管理员', User::RoleAdmin], ['领导', User::RoleLeader], ['编辑', User::RoleEditor]]
  end
  
  def human_participant_type_tag participant_attend_as
    case participant_attend_as
    when Participant::AttendAsThesisAuthor then '论文参会'
    end
  end
  
  def participant_type_options
    [['论文参会', Participant::AttendAsThesisAuthor]]
  end
  
  def human_thesis_document_tag document
    raw !document.file? ? '尚未提交' : "#{link_to('点击下载', document.url, :target => '_blank')} （最后更新于#{Time.at(document.updated_at).strftime('%Y-%m-%d %H:%M')}）"
  end
  
  def thesis_review_tag thesis, review
    output = '<ul>'
    if thesis.ratings.for_review(review).blank?
      output += '<li><label>评审专家：</label>无</li>'
    else
      thesis.ratings.for_review(review).each do |rating|
        output += "<li><label>#{rating.expert.name}：</label>"
        if rating.rated_at.blank?
          output += "<span class=\"cred\">尚未评审</span> #{link_to '[删除]', admin_participant_thesis_rating_url(thesis.participant, rating), confirm: '确定要删除吗？', method: :delete}</li>"
        else
          if review.marking?
            output += "#{rating.points}</li>"
          else
            output += "#{human_approved_tag rating.approved?}</li>"
          end
          output += "<li><label>评审意见：</label>#{rating.opinion}</li>"
        end
      end
    end
    raw output += '</ul>'
  end
  
  def all_continents
    Continent.all
  end
  
  def all_reviews
    Review.all
  end
  
  def available_experts_for thesis
    Expert.available_for(thesis).all
  end
end