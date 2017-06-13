class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :released, inclusion: {in: [true, false]}
  validates :artist_name, presence: true
  validates :title, uniqueness: true


  with_options if: :released? do |released|
  released.validates :release_year, presence: true
  released.validates :release_year, numericality: {less_than_or_equal_to: Date.current.year}
  end

  def released?
    released
  end

end
