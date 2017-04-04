class Job < ActiveRecord::Base
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category
  has_many :comments

  def self.sort_by_location
    order(:city).group_by(&:city)
    # group_by |job| job.city
  end

  def self.level_of_interest
    order(:level_of_interest).reverse.group_by(&:level_of_interest)
  end

end
