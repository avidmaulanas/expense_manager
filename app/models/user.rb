class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :username, uniqueness: {case_sensitive: false}

  attr_accessor :signin

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if signin = conditions.delete(:signin)
      where(conditions.to_h).where(["lower(username) = :value OR lower(email) = :value", { :value => signin.downcase }]).first
    else
      conditions[:email].downcase! if conditions[:email]
      where(conditions.to_h).first
    end
  end
end