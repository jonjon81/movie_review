class Movie < ActiveRecord::Base
  searchkick
  #for Searchkick to work on Heroku
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  belongs_to :user
  has_many  :reviews

  validates :title, :description, :movie_length, :director, :rating, :year, :image_file_name, presence: true
  validates :movie_length, numericality: {only_integer: true}

  has_attached_file :image, styles: { medium: "400x600#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
