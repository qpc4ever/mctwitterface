class TweetTag < ApplicationRecord

	belongs_to :tweet
    belongs_to :tag


        def link_check
      check = false
      if self.message.include? "http://" 
         check = true
      elsif self.message.include? "https://"
         check = true
      else
           check = false
      end	
    
      if check == true
    	arr = self.message.split
    	index = arr.map{ |x| x.include? "http"}.index(true)
        self.link = arr[index]
        if arr[index].length > 23
    	    arr[index] = "#{arr[index][0..20]}..."	
        end
    				
        self.message = arr.join(" ")
      end
     end	
end
