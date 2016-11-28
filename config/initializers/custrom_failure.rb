class CustomFailure < Devise::FailureApp
   def redirect_url
     '/main/index'
   end
   def respond
     if http_auth?
       http_auth
     else
       redirect
     end
   end
 end