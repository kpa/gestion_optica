# -*- encoding : utf-8 -*-
module ApplicationHelper
  def site_name
    "Gestión de óptica"
  end

  def link_cierre_sesion
    link_to 'Cerrar sesión', :controller => :user, :action=> :logout
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

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def nav_link(link_text, link_path)
    class_name = current_page?(link_path) ? 'active' : ''

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
