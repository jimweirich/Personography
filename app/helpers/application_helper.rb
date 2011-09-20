module ApplicationHelper
  def page_title
    default_title = "Personography"
    if @page_title.nil?
      default_title
    else
      "#{default_title}: #{@page_title}"
    end
  end

  def current_user
    nil
  end

  def current_year
    Time.now.strftime("%Y")
  end

  def drag_handle
    if current_user
      result = %{<span class="handle as-needed">#{image_tag('arrow_switch.png')}</span>} +
        %{<span class="handle as-unneeded">&bull;</span>}
    else
      result = %{<span class="unhandle">&bull;</span>}
    end
    result.html_safe
  end

  def add_link_to(text, url, options={})
    if current_user
      link_to_with_image("add.png", text, url, options)
    else
      "&nbsp;".html_safe
    end
  end

  def edit_link_to(url, options={})
    options ={class: "link as-needed"}.merge(options)
    if current_user
      link_to_with_image("edit.png", nil, url, options)
    else
      "&nbsp;".html_safe
    end
  end

  def delete_link_to(url, options={})
    options ={class: "link as-needed"}.merge(options)
    target = options.delete(:target)
    if target
      prompt = "You are about to delete #{target}, are you sure?"
    else
      prompt = "Are you sure?"
    end
    opts = { :confirm => prompt, :method => :delete }.merge(options)
    if current_user
      link_to_with_image("delete.png", nil, url, opts)
    else
      "&nbsp;".html_safe
    end
  end

  def link_to_with_image(image, text, url, options={})
    image = image_tag(image)
    link_text = text.blank? ? image : image + " " + text
    link_to link_text, url, options
  end
end
