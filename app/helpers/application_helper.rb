module ApplicationHelper
  def full_title(page_title)
    base_title = "Shaun TM"
    if page_title.empty?
      base_title
    else
      [base_title, page_title].join(" | ")
    end
  end

  def date_form(time)
    time.try(:strftime, "%Y-%m-%d")
  end

  def time_form(time)
    time.try(:strftime, "%Y-%m-%dT%H:%M:00")
  end

  def time_display(time)
    time.try(:strftime, "%Y-%m-%d %I:%M%P")
  end

  def just_time(time)
    time.try(:strftime, "%I:%M%P")
  end

  def add_icon
    content_tag :span, "", class: "glyphicon glyphicon-plus-sign"
  end

  def remove_icon
    content_tag :span, "", class: "glyphicon glyphicon-remove-sign"
  end

  def md_render(content)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, tables: true)
    markdown.render(content).html_safe
  end

  def ransack_params(q)
    return unless q
    q.permit!.to_h.each_with_object([]) do |hash, obj|
      next if hash[1].empty?
      obj << hash[0]
      obj << hash[1]
    end.join("-").parameterize
  end
end

