require 'atom'

class StaticPagesController < ApplicationController
  def about
  end

  def code
    @feed = Atom::Feed.load_feed(URI.parse('https://github.com/Plasmarobo.atom'))
  end
  
  def clickwise
    params.require(:asset)
    #filename = '/public/Clickwise.me/#{params[:asset]}'
    constructed_path = Rails.root.to_s + "/public/Clickwise.me/"
    params[:asset].split('/').each do |seg|
      if seg == "jquery.rotate.1-1.js"
        constructed_path += seg;
        break;
      elsif /[a-zA-Z0-9]*\.(?:css|html|png|js)/.match(seg)
        constructed_path += seg;
        break
      else
        constructed_path += seg.gsub(/[^a-zA-Z0-9]/,'') + '/'
      end
    end
    if File.exists?(constructed_path)
      options = {}
      p File.extname(constructed_path)
      if File.extname(constructed_path) == ".html"
        render file: constructed_path, layout: false
      else
        case File.extname(constructed_path)
        when ".css"
          options = { type: 'text/css; charset=utf-8'}
        when ".js"
          options = {type: 'text/javascript; charset=utf-8'}
        when ".png"
          options = {type: 'image/png'}
        else
          render nothing: true, :status => 404
        end
        send_file constructed_path, options
      end
    else
      render file: '/public/Clickwise.me/404.html', layout: false, status: 404
    end
  end
  
  
end
