class Session < ActiveRecord::Base
 def self.delete_expired
   delete_all(['updated_at < ?', 3.days.ago])
 end
end
