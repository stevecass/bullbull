module ApplicationHelper
  def format_date(d)
    return "" unless d
    d.strftime('%b %e %l:%M %p')
  end
end
