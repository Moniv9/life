class HomeController < ApplicationController

 def index
 
 
 end

 def save
 
  values=params[:data]
  words=values[:tags].split(',')
  p_time=Time.new.inspect
  
  words.each do |f|
  enter=Mark.create(:item=>f.delete(' ')+"_"+p_time,:title=>values[:title],:tags=>values[:tags] ,:url=>values[:url])
  enter.save
  
  end
  
  render :text =>"Bookmark saved"
  
 end
 
 
 def search
  
  @items=Mark.where('item like ?',params[:search_item]+'%')

  render :json =>@items
 
 end
 

end
