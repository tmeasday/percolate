# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def layout_classes
    "c_#{controller_name.gsub('/', '_')} v_#{view_name}"
  end
  
  # I'd love to see a better way to grab these
  def controller_name
    @_first_render.base_path || 'no_controller'
  end
  
  def view_name
    @_first_render.name || 'no_view'
  end
  
end
