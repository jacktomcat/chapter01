require "date"
require "json"

class Article < ActiveRecord::Base
    has_many :comments, dependent: :destroy  #dependent 删除关联对象
    validates :title, presence: true, length: { minimum: 5 }


end
