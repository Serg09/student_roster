class Student < ActiveRecord::Base
  # validates :first_name, :last_name, :email, :cell_phone, presence: true
  with_options if: :first_name do |name|
    name.validates :first_name, length: { minimum: 2 },
      format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" },
      presence: true
    name.validates :last_name, length: { minimum: 2 },
      format: { with: /\A[a-zA-Z]+\z/, message: "only allows letters" }, presence: true
    name.validates :email,
      format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i},
      presence: true
    name.validates :cell_phone, length: { is: 14 },
      format: { with: /\((\w{3})\)\s+(\w{3})-(\w{4})/,
        message: 'must have (xxx) xxx-xxxx format'},
        allow_blank: true
    name.validates :home_phone, length: { is: 14 },
      format: { with: /\((\w{3})\)\s+(\w{3})-(\w{4})/,
        message: 'must have (xxx) xxx-xxxx format'},
        allow_blank: true
    name.validates :work_phone, length: { is: 14 },
      format: { with: /\((\w{3})\)\s+(\w{3})-(\w{4})/,
        message: 'must have (xxx) xxx-xxxx format'},
        allow_blank: true
  end
    validates :cell_phone,
      format: { with: /\A[^a-zA-Z]+\z/,
      message: "only allows numbers" }
    validates :home_phone,
      format: { with: /\A[^a-zA-Z]+\z/,
      message: "only allows numbers" }
    validates :work_phone,
      format: { with: /\A[^a-zA-Z]+\z/,
      message: "only allows numbers" }
    validates_each :first_name, :last_name do |record, attr, value|
      record.errors.add(attr, "must start with Upper case") if
      value =~ /\A[[:lower:]]/
  end
end


