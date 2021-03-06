# -*- encoding : utf-8 -*-
module ApplicationHelper
  def title_tag
    raw '<title>第十一届国际汉语教学研讨会</title>'
  end

  def participant_signined?
    session[:participant_id]
  end

  def expert_signined?
    session[:expert_id]
  end
  
  def generic_submenu_tag
    raw "<div id=\"submenu\">
      <h3>#{image_tag 'title_important_time.png'}</h3>
      <ul>
        <li class=\"title\">网上报名：</li>
        <li>4月18日 至 5月18日（延至5月28日）</li>
        <li class=\"title\">公布参会名单：</li>
        <li>5月28日（延至5月31日） </li>
        <li class=\"title\">论文全文提交：</li>
        <li>6月1日 至 7月18日</li>
        <li class=\"title\">大会报到：</li>
        <li>8月15日</li>
      </ul>
      <h3>#{image_tag 'title_organization.png'}</h3>
      <ul>
        <li class=\"title\">主办单位：</li>
        <li>#{link_to '世界汉语教学学会', 'http://www.shihan.org.cn', :target => '_blank'}</li>
        <li>#{link_to '国家汉办/孔子学院总部', 'http://www.hanban.org', :target => '_blank'}</li>
        </ul>
    </div>"
  end

  def participant_submenu_tag
    case session[:participant_attend_as]
    when Participant::AttendAsThesisAuthor
      raw "<div id=\"submenu\">
        <h3>#{image_tag 'title_information.png'}</h3>
        <ul>
          <li>#{link_to '修改密码', edit_password_participants_path}</li>
          <li>#{link_to '修改信息', edit_participant_path(Participant.find(session[:participant_id]))}</li>
          <li>#{link_to '打印邀请函', invitation_participants_path}</li>
        </ul>
        <h3>#{image_tag 'title_thesis.png'}</h3>
        <ul>
          <li>#{link_to '查看论文', show_thesis_participant_path(Participant.find(session[:participant_id]))}</li>
          <li>#{link_to '修改论文', edit_thesis_participant_path(Participant.find(session[:participant_id]))}</li>
        </ul>
        <h3>#{image_tag 'title_hotel.png'}</h3>
        <ul>
          <li>#{link_to '酒店预定', new_booking_path}</li>
        </ul>
        <h3>#{image_tag 'title_system.png'}</h3>
        <ul>
          <li>#{link_to '注销', participant_signout_path}</li>
        </ul>
      </div>"
    when Participant::AttendAsNonvoting
      raw "<div id=\"submenu\">
        <h3>#{image_tag 'title_information.png'}</h3>
        <ul>
          <li>#{link_to '修改密码', edit_password_participants_path}</li>
          <li>#{link_to '修改信息', edit_participant_path(Participant.find(session[:participant_id]))}</li>
        </ul>
        <h3>#{image_tag 'title_hotel.png'}</h3>
        <ul>
          <li>#{link_to '酒店预定', new_booking_path}</li>
        </ul>
        <h3>#{image_tag 'title_system.png'}</h3>
        <ul>
          <li>#{link_to '注销', participant_signout_path}</li>
        </ul>
      </div>"
   end
  end
  
  def expert_submenu_tag
    raw "<div id=\"submenu\">
      <h3>#{image_tag 'title_information.png'}</h3>
      <ul>
        <li>#{link_to '修改密码', edit_password_experts_path}</li>
      </ul>
      <h3>#{image_tag 'title_review.png'}</h3>
      <ul>
        <li>#{link_to '未处理论文', unrate_expert_ratings_path(Expert.find(session[:expert_id]))}</li>
        <li>#{link_to '已处理论文', rated_expert_ratings_path(Expert.find(session[:expert_id]))}</li>
        <li>#{link_to '论文评审标准', standard_expert_ratings_path(Expert.find(session[:expert_id]))}</li>
      </ul>
      <h3>#{image_tag 'title_system.png'}</h3>
      <ul>
        <li>#{link_to '注销', expert_signout_path}</li>
      </ul>
    </div>"
  end
  
  def human_review_way_tag review
    review.marking? ? '打分' : '判断'
  end
  
  def human_grade_tag grade
    case grade
    when Rating::GradeApproved
      '<span class="cgreen">通过</span>'
    when Rating::GradeFailure
      '<span class="cred">未通过</span>'
    when Rating::GradeReserved
      '<span class="cblue">保留</span>'
    end
  end
  
  def human_participant_type_options
    [['旁听代表', Participant::AttendAsNonvoting]]
  end
  
  def all_hotels
    Hotel.all
  end
  
  def human_room_price_and_unit_tag room
    if room.bed_amount > 1
      "#{room.price / room.bed_amount}元/床"
    else
      "#{room.price}元/间"
    end
  end
  
  def human_room_discount_price_and_unit_tag room
    if room.bed_amount > 1
      "#{room.discount_price / room.bed_amount}元/床"
    else
      "#{room.discount_price}元/间"
    end
  end
end
