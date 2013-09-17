module Levels
  module Medium
    def login(session_id, username, password)
      username, password = "'#{username}'", "'#{password}'"
      User.find_by_sql("SELECT * FROM users WHERE session_id = '#{session_id}' AND username = #{username} AND password = #{password}").first
    end
    
    # remove all occurrences of </?script>
    def sanitize(review)
      xss_filter(review)
    end
    
    # remove ../ to "prevent" path traversal :)
    def filter_filename(filename)
      filename.gsub(/(\.\.\/)/, '')
    end
    
    def filter_search(search)
      xss_filter(search)
    end
    
    def filter_email(email)
      email.gsub(/\;(.*)/)
    end
    
    private
    def xss_filter(text)
      text.gsub(/(<script.*?>)|(<\/script>)|(\")/, '')
    end
  end
end