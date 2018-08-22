module ApplicationHelper

   def nav_link(text, page, klass=nil)
    content_tag :li, (link_to text, page, class: "nav-link #{current?(page)} #{klass}"), class: 'nav-item'
  end

  def drop_link(text, page)
    link_to text, page, class: "dropdown-item"
  end

  def current?(page_name)
    "active" if current_page? page_name
  end


end
