class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable ,
         :lockable, :timeoutable, :trackable
         
  has_many :post
  has_many :comments
 
  acts_as_messageable

  def mailboxer_name
   self.name
  end

  def mailboxer_email(default)
   self.email
  end
end