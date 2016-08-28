# -*- encoding : utf-8 -*-
module ApplicationHelper
  def site_name
    t("management_system").mb_chars.upcase
  end

  # Muestra una caja con mensajes para el usuario.
  def show_flash
    flash_names = [:notice, :warning, :message]
    output = ""
    for name in flash_names
      if flash[name]
        output << "<div class=\"#{name}Explanation\">"
        if flash[name].is_a?(Hash) && flash[name][:header]
          output << "<h2>#{flash[name][:header]}</h2>"
          output << "<p>#{flash[name][:body]}</p>"
        else
          output << "<p>#{flash[name]}</p>"
        end
        output << "</div>"
      end
    end
    return raw(output)
  end

  def nav_link(link_text, link_path, options = {})
    class_name = current_page?(link_path) ? 'active' : ''
    if options[:class].present?
      class_name = "#{class_name} #{options[:class]}"
    end

    content_tag(:li, :class => class_name) do
      link_to link_text, link_path
    end
  end

  # Creates a label tag.
  #   label_tag('post_title', 'Title')
  #     <label for="post_title">Title</label>
  def label_tag(name, text=nil, options = {})
    content = (text.blank? ? nil : text.to_s) || name.to_s.humanize
    content_tag('label', content, { 'for' => name }.merge(options.stringify_keys))
  end
end
