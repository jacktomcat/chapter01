module Tools
   class DateUtils < Base
       
      #private 
	  def calculate_interval(d1,d2)
	     Date.parse(d1).mjd-Date.parse(d2).mjd
	  end

   end

end