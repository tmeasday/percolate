module Util::UiComponentHelper
  #generates a large, button looking link
  def link_button(txt, url_options = {}, html_opts = {})
    url = url_for(url_options)
    
    content_tag(:a, {:href => url, :class => 'big_button'}.merge(html_opts) ) do
      content_tag(:div) + content_tag(:em, txt)
    end
  end

  def submit_button(txt, html_opts = {})
    content_tag(:button, {:type => 'submit', :class => 'big_button'}.merge(html_opts) ) do
      content_tag(:div) + content_tag(:em, txt)
    end
  end
  
  # a replaced header etc
  def replaced_tag(tag, text, img, html_opts = {})
    content_tag(tag, {:class => "replaced"}.merge(html_opts)) do
      image_tag(img, :alt => text) + text
    end
  end
end