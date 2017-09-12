class User < ActiveRecord::Base

  has_many :wikis

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_save { self.role ||= :standard }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

#  after_initialize :init

#  def init
#    self.number  ||= 0.0           #will set the default value only if it's nil
#    self.address ||= build_address #let's you set a default association
#  end

  enum role: [:standard, :premium, :admin]

end
