class Profile < ActiveRecord::Base
  validates_uniqueness_of :company_name
  belongs_to :user

  before_save :company_name_transliterate, :to_param

  

  

  def to_param
    if company_name == "" || company_name == company_name.nil?
      id
    else
      url
    end
  end
  
  private

  def company_name_transliterate
    if company_name?
      self.url = company_name.to_slug.transliterate(:russian).normalize.to_s
    else
      self.url = ""
    end
  end
  
end
