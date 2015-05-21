class Navigation < ActiveRecord::Base
        belongs_to :province	
        belongs_to :investigate	
        belongs_to :line	
        belongs_to :problem	
        mount_uploader :logo, LogoUploader
end
