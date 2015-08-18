module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    css_class = (column == sort_column) ? "current #{sort_direction}" : nil
    arrow = (css_class == nil) ? "" : (sort_direction == "asc") ? "↑" : "↓"
    link_to "#{title} #{arrow}" , {:sort => column, :direction => direction}, {:class => css_class}
  end
end
