module ApplicationHelper
  def format_date(date)
    date.strftime('%B %d, %Y') unless date.nil?
  end

  def format_currency(amount)
    number_to_currency(amount, unit: "")
  end
end
