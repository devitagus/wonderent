class Photo < ActiveRecord::Base
  belongs_to :flat

    has_attached_file :image, styles: { large: "500x500>", medium: "500x500>", thumb: "100x100>" }
   validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
