require 'uri_validation'

class User < ActiveRecord::Base
  include URI_Validation
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships
  has_many :rsvps
  has_many :events, :through => :rsvps

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :first_name, :last_name, :url, :street, :city, :state, :zip, :phone, :label, :url, :logo, :joined_on
  attr_accessible :twitter, :facebook, :linkedin, :foursquare, :volunteer_title, :is_admin

  validates :first_name, :presence => true
  validates :last_name, :presence => true
  validates :url, :url => true

  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, :presence   => true,
	                  :format     => { :with => email_regex },
	                  :uniqueness => true
  
  scope :active, joins(:memberships).where('memberships.year = ?', Date.current.year.to_s)
  scope :visible, where("label != ''")
  scope :volunteers, where("volunteer_title != ''")
  default_scope order("last_name, first_name")
  
  class << self
    def before_create
      joined_on ||= DateTime.current
    end

    # should probably be a scope...
    def current_sponsors
      User.all.each {|u| u.memberships.present? ? configatron.premium_memberships.include?(u.memberships.current.first.mtype) : nil}
    end
  end

  def name
    first_name + ' ' + last_name
  end
  
  def to_s
    name
  end
  
  def m_logo
    logo.starts_with?('http') ? logo : 'users/'+logo
  end
  
  def has_logo?
    !logo.blank?
  end
  
  def admin?
    is_admin
  end
  
  def volunteer?
    !volunteer_title.blank?
  end

  protected
  def password_required?
    !persisted? || password.present? || password_confirmation.present?
  end
end
