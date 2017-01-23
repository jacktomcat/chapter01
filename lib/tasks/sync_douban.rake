desc "sync data from douban"
namespace :sync_douban do


  # 执行带参数的   rake 'sync_douban:get_article[aaa,bbb,ccc]'
  desc "fetch data from article"
  task :get_article,[:first_name, :last_name] => :environment do |t,args|
    Article.all.each do |article|
      puts args   #args 显示  {:first_name=>"aaa", :last_name=>"bbb"}
    end
  end


  desc "fetch data from article"
  task :get_douban => :environment do |t|
    Article.all.each do |article|
      puts article.title
    end
  end

end
