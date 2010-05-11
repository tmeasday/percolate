class DefaultController < ApplicationController
  def index
    path = params[:path].to_s
    
    if template_exists?(s_path = 'static/' + path)
      render :template => s_path
    else
      raise ::ActionController::RoutingError,
            "Recognition failed for #{request.path.inspect}"
    end
  end
  
  private    
    # HACK: figure out a way not to have to do this dodgy shite
    # Define template_exists? for Rails 2.3 (cause it's deprecated)
    unless ActionController::Base.private_instance_methods.include? 'template_exists?'
      def template_exists?(path)
        self.view_paths.find_template(path, response.template.template_format)
      rescue ActionView::MissingTemplate
        false
      end
    end
end