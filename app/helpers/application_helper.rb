module ApplicationHelper
  #require 'pygments'
  #def markdown(text)
    #renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    #options = {
        #autolink: true,
        #no_intra_emphasis: true,
        #fenced_code_blocks: true,
        #lax_html_blocks: true,
        #strikethrough: true,
        #superscript: true,
        #space_after_headers: true
    #}
    #Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  #end
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, :lexer => language)
    end
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(:hard_wrap => true)
    options = {
      :fenced_code_blocks => true,
      :no_intra_emphasis => true,
      :autolink => true,
      :strikethrough => true,
      :lax_html_blocks => true,
      :superscript => true
    }
    Redcarpet::Markdown.new(renderer, options).render(text).html_safe
  end
  def gravatar_for(email)
    gravatar_id = Digest::MD5::hexdigest(email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=46"
    image_tag(gravatar_url, class: "avatar", alt: "")
  end
end
