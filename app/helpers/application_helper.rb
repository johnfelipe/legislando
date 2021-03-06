module ApplicationHelper
  def legislative_fields_class
    if @project.legislative_processing.present? ||
      @project.legislative_chamber.present?
      "active"
    end
  end

  def facebook_share_fields_class
    if @project.facebook_share_title.present? ||
      @project.facebook_share_description.present? ||
      @project.facebook_share_image.present?
      "active"
    end
  end

  def twitter_share_fields_class
    if @project.twitter_share_message.present?
      "active"
    end
  end

  def email_fields_class
    if @project.email_to_contributor.present? ||
      @project.email_to_signer.present?
      "active"
    end
  end

  def taf_fields_class
    if @project.taf_message.present?
      "active"
    end
  end

  def accepted_field_class
    "active" if @project.accepted?
  end

  def rejected_field_class
    "active" if @project.rejected? && !@project.accepted?
  end

  def meta_title
    content_for(:meta_title) || t("meta.title")
  end

  def meta_description
    content_for(:meta_description) || t("meta.description")
  end

  def meta_image
    content_for(:meta_image) || image_url("legislando.png")
  end

  def user_path user
    "#{ENV['MEURIO_HOST']}/users/#{user.id}"
  end

  def project_status project
    if project.accepted?
      "Agora é lei!"
    elsif project.rejected?
      "Rejeitado"
    elsif project.processing?
      "Em tramitação"
    elsif project.adopted?
      "Adotado"
    elsif !project.open?
      "Edição encerrada"
    else
      "Em edição"
    end
  end

  def user_path user
    "#{ENV['MEURIO_HOST']}/users/#{user.id}"
  end

  def users_list users, verb
    if users.size < 4
      "<span>#{users.map{|u| link_to u.name, u}.to_sentence}</span> #{t("." + verb, count: users.size)}"
    else
      "<span>#{users[0..2].map{|u| link_to u.name, u}.join(', ')}</span> e mais #{users.size - 3} #{t("." + verb, count: users.size)}"
    end
  end

  def step_bubble_class project
    if @project.finished?
      "StepsList-stepBubble--finished"
    elsif @project.processing?
      "StepsList-stepBubble--processing"
    elsif @project.adopted?
      "StepsList-stepBubble--adopted"
    end
  end
end
