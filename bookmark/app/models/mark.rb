class Mark < ActiveRecord::Base
  
  validates :item , :presence=>true
  validates :tags , :presence=>true
  validates :url , :presence=>true
  
  attr_accessible :item, :tags, :title, :url
  
end
