require_relative '../../db/config'

class Student < ActiveRecord::Base

 validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

 validates :age, numericality: { greater_than: 5 }

 validates :email, uniqueness: true

 validates :phone, :length => { :minimum => 10, :only_integer => true}
 validates :phone, :format => {:with =>/(\(?\d{3}\)?)?(\D)*\d{3}\D*\d{4}\D*\d{4}/  }

 # validates :phone, :numericality => { :only_integer => true }

  # validates_format_of :phone, :with => /\D\d{3}\D\d{3}-\d{4}/

  def name
    name  = self[:first_name].to_s + " " + self[:last_name].to_s
    name
  end

  def age
    now = Date.today
    age = now.year - self[:birthday].year - ((now.month > self[:birthday].month || (now.month == self[:birthday].month && now.day >= self[:birthday].day)) ? 0 : 1)
  end

end