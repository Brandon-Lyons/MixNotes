class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  has_many :permissions, :dependent => :destroy
  has_many :mixes, :through => :permissions
  has_many :comments
  has_many :replies

  MODELS = [:mixes, :permissions, :comments, :replies]

  def associated_models
    models = []
    MODELS.each { |model| models.concat self.send(model) }
    models.sort! { |a, b| b.created_at <=> a.created_at }
  end

  def self.find_by_email email
    where(:email => email).first
  end

end
