module ApplicationHelper
  def check(bol)
    if bol
      "<i class='fa fa-check' aria-hidden='true'></i>".html_safe
    else
      "<i class='fa fa-times' aria-hidden='true'></i>".html_safe
    end
  end
end
