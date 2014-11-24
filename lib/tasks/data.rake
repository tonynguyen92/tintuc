namespace :data do
  desc "TODO"
  task crawler: :environment do
  	Api::Vnnet.crawling 
  end

  desc "TODO"
  task taotaikhoan: :environment do
  end

end
