class Company < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts


  def average_level_of_interest
    jobs.average(:level_of_interest).to_i
  end

  def self.top_level_interest
    sorted_companies = all.sort_by do |company|
      company.average_level_of_interest
    end
    sorted_companies.reverse.take(3)
  end
end
