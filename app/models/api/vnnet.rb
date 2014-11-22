module Api::Vnnet
	extend ActiveSupport::Concern

	require 'open-uri'
    require 'nokogiri'
	def self.url
		website = "http://vietnamnet.vn"
	end

	def self.crawling
		page = Nokogiri::HTML(open(self.url+"/vn/giao-duc/"))
		begin
		  article_list = page.css(".ArticleCateList")
		  articles = article_list[0].css(".ArticleCateItem")
		  articles[0..-2].each do |article|
		  	name = article.css("a")[0].attribute("title").value
		  	link = article.css("a")[0].attribute("href").value
		  	desc = article.css("h3")[0].text
		  	image = article.css("img")[0].attribute("src").value
		  	page_inside = Nokogiri::HTML(open(self.url+link))
		  	content = page_inside.css("#ArticleContent").text
		  	category = Category.first
		  	article = Post.where(:title => name).first || category.posts.new(title:"#{name}",image:"#{image}",content:"#{content}",desc:"#{desc}")
            article.save
		  	p "success clawer "+ name	
		  end
		rescue Exception => e
			p e
		end
	end
	def article_params
      params.require(:Article).permit(:name, :image, :desc, :content)
    end
end
