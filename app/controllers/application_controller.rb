class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'rufus-scheduler'
  
  scheduler = Rufus::Scheduler.new
  scheduler.every '5m' do
  	Api::Vnnet.crawling
  end

  scheduler.every '12h' do
    @posts = Post.all
    @posts.each do |post|
      number= (Time.now-post.created_at.to_time)/1.day
      if number>2
        post.destroy
      end
    end
  end
end
