require 'atom'

class StaticPagesController < ApplicationController
  def about
  end

  def code
    @feed = Atom::Feed.load_feed(URI.parse('https://github.com/Plasmarobo.atom'))
  end
end
