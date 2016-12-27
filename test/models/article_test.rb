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
     seven_day_views=nil
     wpc = article.weekly_play_count(seven_day_views,yt_view_count)
     assert(wpc>=700)

     #seven_day_views＝{"20161221":20} 数据库中仅有一个数据，且播放量为0，随机生成一个平均每天>=100随机数 weekly_play_count
     seven_day_views=JSON.parse('{"20161221":20}')
     wpc = article.weekly_play_count(seven_day_views,yt_view_count)
     assert(wpc>=700)

     #seven_day_views＝{"20161221":20,"20161224":100} 数据库中大于一个数据，且播放量为0，(100-20)*7/(日期直接的day)＝80*7/3
     seven_day_views=JSON.parse('{"20161221":20,"20161224":100}')
     wpc = article.weekly_play_count(seven_day_views,yt_view_count)
     assert(wpc=182)


     #初始化播放量大于0的情况
     yt_view_count=200

     #seven_day_views＝nil 数据库中没有数据，且播放量为200，随机生成一个平均每天>=100随机数 weekly_play_count
     seven_day_views=nil
     wpc = article.weekly_play_count(seven_day_views,yt_view_count)
     assert(wpc>=700)

     #seven_day_views＝{"20161221":20,"20161224":100} 数据库中有数据，且播放量为200，意味着当天比如：20161225:200
     #(200-20)*7/(日期直接的day)＝180*7/(20161225-20161221)
     seven_day_views=JSON.parse('{"20161221":20,"20161224":100}')
     wpc = article.weekly_play_count(seven_day_views,yt_view_count)
     assert(wpc=315)

   end
   
end
