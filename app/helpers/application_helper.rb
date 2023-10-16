module ApplicationHelper
  include Pagy::Frontend

  def sort_direction(column)
    if params[:sort] == column && params[:direction] == "asc"
      "desc"
    else
      "asc"
    end
  end
end
