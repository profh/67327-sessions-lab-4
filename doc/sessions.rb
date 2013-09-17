# Partial code 

module CustomSessions
  def change_session_id
    cookies.delete :session_id
    session[:level] = params[:level].to_i
    case params[:level].to_i
    when 0
      # ...
    when 1
      # ...
    when 2
      # set the session_id with some data and a timestamp; add minimal randomness
      cookies[:session_id] = "#{ActiveSupport::SecureRandom.hex(2)}#{ SOME_OTHER_VALUES WITH TIMESTAMP }"
    else
      # make the session_id mostly random, but add a bit of predictability at the end
      cookies[:session_id] = "#{ActiveSupport::SecureRandom.hex(32)}#{Base64.encode64( SOME_VALUE ).chomp}"
    end
  end
end