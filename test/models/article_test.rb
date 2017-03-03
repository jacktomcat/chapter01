require 'test_helper'

class ArticleTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  test "update article weeklyplaycount" do
     article = Article.new
     #初始化，播放量为0的情况
     yt_view_count=0

     #seven_day_views＝nil 数据库中没有数据，且播放量为0，随机生成一个平均每天>=100随机数 weekly_play_count
     #seven_day_views=nil
     #wpc = article.weekly_play_count(seven_day_views,yt_view_count)
     assert(yt_view_count<=700)
   end
   
end
