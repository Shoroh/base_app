class Profile < ActiveRecord::Base
  validates_uniqueness_of :company_name
  belongs_to :user

  before_save :company_name_transliterate, :to_param

  

  

  def to_param
    if url == "" || url == url.nil?
      id
    else
      url
    end
  end
  
  private

  def company_name_transliterate
    if !company_name.nil?
      self.url = company_name.to_slug.transliterate(:russian).normalize.to_s
    else
      self.url = ""
    end
  end
  
end
