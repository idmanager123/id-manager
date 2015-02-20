require 'option_constants'
class Customer < ActiveRecord::Base
  belongs_to :order
  belongs_to :referrer

  has_attached_file :photo,
    :styles => { :thumb => "x30>", :small=>"x100",:form => "79x>"}, :default_url => ""
  has_attached_file :sig,
    :styles => {:thumb => "x30>", :small=>"x100>", :form => "79x>"}, :default_url => ""

  validates_attachment_content_type :photo,
    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
  validates_attachment_content_type :sig,
    :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  def self.eye_colors
    OptionConstants::EYE_COLORS.collect {|c| [c, c]}

  end
  def self.hair_colors
    OptionConstants::HAIR_COLORS.collect {|c| [c, c]}
  end
  def self.states
    OptionConstants::STATES.collect {|c| [c,c]}
  end
  def self.genders
    OptionConstants::GENDERS.collect {|c| [c,c]}
  end
  def paid?
    if self.haspaid
      return "paid"
    else
      return "notpaid"
    end
  end

  def has_sig?
    if sig.url.empty?
      "No"
    else
      "Yes"
    end
  end

  def has_address?
    if address == ""
      "No"
    else
      "Yes"
    end
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def to_string
    <<-eof
      #{full_name} <br />
      State: #{state} <br />
      DOB: #{dob} <br />
      Gender: #{gender} <br />
      Height: #{height}<br />
      Weight: #{weight}<br />
      Hair color: #{hair_color}<br />
      Eye Color: #{eye_color}<br />
      Address: #{address}<br />
    eof
  end

end
