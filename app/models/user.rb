class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event_members, dependent: :destroy
  has_many :events, through: :event_members

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :location, presence: true
  validates :role, presence: true
  enum role: { staff: "staff", organizer: "organizer", artist: "artist", security: "security" }
end