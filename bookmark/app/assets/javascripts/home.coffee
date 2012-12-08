$(document).ready ()->

 Search_Item=Backbone.Model.extend({
  url : '/home/search',
  
  initialize:()->
   
 })


 Search_View=Backbone.View.extend({
  initialize:() ->
   this.render()

  
  el : '#search_template' 
 
  render:() ->
   
   output="<input id='query' type='text' />&nbsp"
   output=output+"<input type='button' value='Search' />"
   output=output+"<div id='result'></div>"
   $(this.el).html output
   
   
  events :
   'click input[type=button]' : 'dosearch' 
   
  dosearch : (event) ->
    
    id=document.getElementById('query')
    items=new Search_Item({search_item:id.value})
    
    str=''
    
    items.save(items , { success :(data)-> 
     $.each(data.toJSON(),(i, val) -> 
      if i isnt 'search_item'
       str=str+val.title+"<br/>"
       str=str+val.url+"<br/>"
       str=str+val.tags+"<br/><br/>"
     )
     
     document.getElementById('result').innerHTML=str
  

    })

 })

 obj=new Search_View({})

