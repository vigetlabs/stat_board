class Post < ActiveRecord::Base
  attr_accessible :body, :title, :created_at
end
