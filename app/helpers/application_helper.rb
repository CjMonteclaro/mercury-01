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

  def create_or_edit_button_helper(f, action)
      if action == 'edit'
        text = 'Update'
      else
        text = 'Create'
        login_link = content_tag(:span, "or #{link_to 'Log in', new_session_path(:user)}".html_safe, class: 'ml-2')
      end

      (f.button :submit, "#{text} Account", class: 'btn btn-lg btn-primary') +
      (login_link if login_link)
  end

  def format_date(date)
    date.strftime('%d %B %Y') unless date.nil?
  end

  def format_currency(amount)
    number_to_currency(amount, unit: "P")
  end

end
