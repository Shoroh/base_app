class Profile < ActiveRecord::Base
  validates_uniqueness_of :company_name
  belongs_to :user

  def to_param
    if company_name == "" || company_name.nil?
      id
    else
      company_name.to_slug.transliterate(:russian).normalize.to_s
    end
  end

  before_save do
    if company_name?
      self.url = company_name.to_slug.transliterate(:russian).normalize.to_s
    else
      self.url = ""
    end
  end
  
end
