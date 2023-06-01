class Profile < ApplicationRecord
    belongs_to :user
    has_many_attached :avtar
    mount_uploader :avtar, FileUploader
    # belongs_to :follow

end
