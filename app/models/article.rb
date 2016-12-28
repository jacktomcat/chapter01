require "date"
require "json"

class Article < ActiveRecord::Base

    #Article.all  --->  下面是执行的sql
    #SELECT `articles`.* FROM `articles`  ORDER BY articles.id DESC
	default_scope { order("articles.id DESC") }   #设置默认的排序方式


    #Article.title_desc  -->  下面是执行的sql
    #SELECT `articles`.* FROM `articles`  ORDER BY articles.id DESC, articles.title desc
	scope :title_desc, ->() { order("articles.title desc") }



	#before_validation
	#before_validation_on_create
	#after_validation
	#after_validation_on_create
	before_save :send_message    #相当于保存之前做操作，拦截器相当于spring aop
	#before_create
	
	#DATABASE INSERT
	#after_create
	after_save :send_email      #相当于保存之后做操作，拦截器相当于spring aop

    has_many :comments, dependent: :destroy  #dependent 删除关联对象
    validates :title, presence: true, length: { minimum: 5 }
    

    def send_message
       #put your code
       puts '**************before_save send_message***********'
    end

    def send_email
       #put your code
       puts '*************after_save send_email**********'
    end
end
