class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :url, :street, :city, :state, :zip, :phone, :label, :url, :logo, :joined_on
  attr_accessible :twitter, :facebook, :linkedin, :foursquare, :volunteer_title

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :email, :email => true
  validates :url, :uri => { :schemes => [:http] }
  
  scope :active, joins(:memberships).where(:memberships => {:year => Date.current.year.to_s})
  scope :active_sponsors, joins(:memberships).where(:memberships => {:year => Date.current.year.to_s, :mtype => configatron.premium_memberships})
  scope :visible, where("label != ''")
  scope :volunteers, where("volunteer_title != ''")
  default_scope order("last_name, first_name")
  
  def self.before_create
    joined_on ||= DateTime.current
  end
  
  def name
    first_name + ' ' + last_name
  end
  
  def to_s
    name
  end
  
  def m_logo
    if logo.starts_with?('http')
      return logo
    else
      return 'users/'+logo
    end
  end
  
  def has_logo?
    !logo.blank?
  end
  
  def is_admin?
    self.is_admin?
  end

  def is_volunteer?
    !volunteer_title.blank?
  end

  protected
  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end
end
