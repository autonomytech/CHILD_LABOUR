class Attachment < ActiveRecord::Base
  belongs_to :raid
  belongs_to :child
  belongs_to :employer

  has_attached_file :file,
    :path => ":rails_root/public/system/files/:id/:filename",
    :url  => "/system/files/:id/:filename"

  do_not_validate_attachment_file_type :file
end
