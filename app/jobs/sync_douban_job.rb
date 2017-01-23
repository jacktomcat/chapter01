class SyncDoubanJob < ActiveJob::Base
  queue_as :default

  before_enqueue do |job|
    # do something with the job instance
    #UserMailer.welcome(@user).deliver_now
    #puts "==========="
  end
 
  around_perform do |job, block|
    # do something before perform
    #block.call
    # do something after perform
  end

  #  article = Article.find(2)
  #  现在执行：SyncDoubanJob.perform_now article
  #  当队列是空的时候执行： SyncDoubanJob.perform_later article
  #  一周后执行： SyncDoubanJob.set(wait: 1.week).perform_later(record)
  def perform(article)
    # Do something later
    #article.update(title:'jackjboss,jackjboss')
    puts "aaaa"
  end
end
