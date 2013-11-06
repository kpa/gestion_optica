# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

  def site_name
    "Óptica"
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
        unless flash[name][:header].blank?
          output << "<h2>#{flash[name][:header]}</h2>"
          output << "<p>#{flash[name][:body]}</p>"
        else
          output << "<p>#{flash[name]}</p>"
        end
        output << "</div>"
      end
    end
    return output
  end
  def current_user
    #User.find(:first, :conditions => ['id = ?', session[:user_id]])
  end
  
  # Creates a label tag.
  #   label_tag('post_title', 'Title')
  #     <label for="post_title">Title</label>
  def label_tag(name, text=nil, options = {})
    content = (text.blank? ? nil : text.to_s) || name.to_s.humanize
    content_tag('label', content, { 'for' => name }.merge(options.stringify_keys))
  end
end
