class DefaultController < ApplicationController
  #list any automatically generated files here (they cannot be cached)
  NO_CACHE = []
  
  #http redirects
  #REDIRECTS = [{:orig => 'orig.html', :rewrite_as => '/new.html'}]
  REDIRECTS = []
  
  def index
    path = params[:path].to_s
    
    if redirect = REDIRECTS.find {|r| path.include?(r[:orig]) }
      redirect_to redirect[:rewrite_as]
    elsif template_exists? s_path = 'static/' + path
      render_cached s_path
    else
      raise ::ActionController::RoutingError,
            "Recognition failed for #{request.path.inspect}"
    end
  end
  
  private
    def render_cached(path)
      if NO_CACHE.find {|nc| path.include?(nc) }
        render :template => path
      else
        key = path.gsub('/', '-')
        unless content = read_fragment(key)
          content = render_to_string :template => path, :layout => false
          write_fragment(key, content)
        end
        render :text => content, :layout => true
      end
    end
    
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