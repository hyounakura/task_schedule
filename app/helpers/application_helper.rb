module ApplicationHelper
  def min_collect(min)
    if min < 10
      "0#{min}"
    else
      min
    end
  end
end
