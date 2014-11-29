module Api::Vnnet
	extend ActiveSupport::Concern

	require 'open-uri'
	require 'nokogiri'
	def self.crawling
# ==============================Vietnamnet=========================
t = Tobao.where(:name => "Vietnamnet").first||Tobao.new
t.name = "Vietnamnet"
t.save
website = "http://vietnamnet.vn"
#======================Giao Duc=======================================
		page = Nokogiri::HTML(open(website+"/vn/giao-duc/"))
		begin
		  post_list = page.css(".ArticleCateList")
		  posts = post_list[0].css(".ArticleCateItem")
		  posts[0..-2].each do |post|
		  	begin
		  		name = post.css("a")[0].attribute("title").value
		  	link = post.css("a")[0].attribute("href").value
		  	desc = post.css("h3")[0].text
		  	image = post.css("img")[0].attribute("src").value
		  	page_inside = Nokogiri::HTML(open(website+link))
		  	content = page_inside.css(".ArticleDetail").inner_html
		  	category  = Category.where(:name => "Giao Duc").first||Category.new
		  	category.name = "Giao Duc"
		  	category.save
		  	post = Post.where(:image => image).first || category.posts.new(title:"#{name}",image:"#{image}",content:"#{content}",desc:"#{desc}",tobao: t)
            post.save
		  	p "success clawer bao vietnamnet : "+ name	
		  	rescue Exception => e
		  		p e
		  	end

		  end
		rescue Exception => e
			p e
		end
#======================Chinh Tri=======================================	
		page = Nokogiri::HTML(open(website+"/vn/chinh-tri/"))
		begin
		  post_list = page.css(".ArticleCateList")
		  posts = post_list[0].css(".ArticleCateItem")
		  posts[0..-2].each do |post|
		  	begin
		  	name = post.css("a")[0].attribute("title").value
		  	link = post.css("a")[0].attribute("href").value
		  	desc = post.css("h3")[0].text
		  	image = post.css("img")[0].attribute("src").value
		  	page_inside = Nokogiri::HTML(open(website+link))
		  	content = page_inside.css(".ArticleDetail").inner_html
		  	category  = Category.where(:name => "Chinh Tri").first||Category.new
		  	category.name = "Chinh Tri"
		  	category.save
		  	post = Post.where(:image => image).first || category.posts.new(title:"#{name}",image:"#{image}",content:"#{content}",desc:"#{desc}",tobao:t)
            post.save
		  	p "success clawer bao vietnamnet : "+ name	
		  	rescue Exception => e
		  		p e
		  	end

		  end
		rescue Exception => e
			p e
		end
#======================Kinh Te =======================================	
		page = Nokogiri::HTML(open(website+"/vn/kinh-te/"))
		begin
		  post_list = page.css(".ArticleCateList")
		  posts = post_list[0].css(".ArticleCateItem")
		  posts[0..-2].each do |post|
		  	begin
		  		name = post.css("a")[0].attribute("title").value
			  	link = post.css("a")[0].attribute("href").value
			  	desc = post.css("h3")[0].text
			  	image = post.css("img")[0].attribute("src").value
			  	page_inside = Nokogiri::HTML(open(website+link))
			  	content = page_inside.css(".ArticleDetail").inner_html
			  	category  = Category.where(:name => "Kinh Te").first||Category.new
			  	category.name = "Kinh Te"
			  	category.save
			  	post = Post.where(:image => image).first || category.posts.new(title:"#{name}",image:"#{image}",content:"#{content}",desc:"#{desc}",tobao:t)
	            post.save
			  	p "success clawer bao vietnamnet :  "+ name	
		  	rescue Exception => e
		  		p e
		  	end
		  end
		rescue Exception => e
			p e
		end
#=============================Dan Tri=======================================
t = Tobao.where(:name => "Dan Tri").first||Tobao.new
t.name = "Dan Tri"
t.save!
website = "http://dantri.com.vn"
#=============================Giao Duc=======================================
page = Nokogiri::HTML(open(website+"/giao-duc-khuyen-hoc.htm"))
begin
	post_list = page.css(".fl")
	posts = post_list[0].css("div")
	i = 0
	posts[0..-2].each do |post|
		if i % 4 == 0
			begin
				name = post.css("a")[0].attribute("title").value
				link = post.css("a")[0].attribute("href").value
				desc = post.css("div")[0].text
				image = post.css("img")[0].attribute("src").value
				page_inside = Nokogiri::HTML(open(website+link))
				content = page_inside.css("#ctl00_IDContent_ctl00_divContent").inner_html
				category  = Category.where(:name => "Giao Duc").first||Category.new
				category.name = "Giao Duc"
				category.save
				post = Post.where(:image => image).first || category.posts.new(title:"#{name}",image:"#{image}",content:"#{content}",desc:"#{desc}",tobao: t)
				post.save
				p "success clawer bao dan tri : "+ name	
			rescue Exception => e
				p e
			end
		end
		i+=1
	end
rescue Exception => e
end
#=============================Su Kien=======================================
page = Nokogiri::HTML(open(website+"/su-kien.htm"))
begin
	post_list = page.css(".fl")
	posts = post_list[0].css("div")
	i = 0
	posts[0..-2].each do |post|
		if i % 4 == 0
			begin
				name = post.css("a")[0].attribute("title").value
				link = post.css("a")[0].attribute("href").value
				desc = post.css("div")[0].text
				image = post.css("img")[0].attribute("src").value
				page_inside = Nokogiri::HTML(open(website+link))
				content = page_inside.css("#ctl00_IDContent_ctl00_divContent").inner_html
				category  = Category.where(:name => "Su Kien").first||Category.new
				category.name = "Su Kien"
				category.save
				post = Post.where(:image => image).first || category.posts.new(title:"#{name}",image:"#{image}",content:"#{content}",desc:"#{desc}",tobao: t)
				post.save
				p "success clawer bao dan tri : "+ name	
			rescue Exception => e
				p e
			end
		end
		i+=1
	end
rescue Exception => e
end
#==============================END==========================================

end
def post_params
	params.require(:Post).permit(:name, :image, :desc, :content)
end
end
