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

  def add_link_to(text, url, options={})
    link_to_with_image("add.png", text, url, options)
  end

  def edit_link_to(url, options={})
    link_to_with_image("edit.png", nil, url, options)
  end

  def delete_link_to(url, options={})
    target = options.delete(:target)
    if target
      prompt = "You are about to delete #{target}, are you sure?"
    else
      prompt = "Are you sure?"
    end
    opts = { :confirm => prompt, :method => :delete }.merge(options)
    link_to_with_image("delete.png", nil, url, opts)
  end

  def link_to_with_image(image, text, url, options={})
    image = image_tag(image)
    link_text = text.blank? ? image : image + " " + text
    link_to link_text, url, options
  end
end
