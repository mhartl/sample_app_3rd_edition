class Micropost < ActiveRecord::Base
  has_many :my_favorites, dependent: :destroy
  has_many :favorite_users, through: :my_favorites, source: :user
  
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  mount_uploader :picture, PictureUploader
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  validate  :picture_size
  
  def favorite
    current_user.my_favorites << Micropost.find(params[:id])
  end
  
  def unfavorite
    current_user.my_favorites.find_by(micropost_id: params[:id]).destroy
  end
  
  private
  
    # Validates the size of an uploaded picture.
    def picture_size
      if picture.size > 5.megabytes
        errors.add(:picture, "should be less than 5MB")
      end
    end
end
