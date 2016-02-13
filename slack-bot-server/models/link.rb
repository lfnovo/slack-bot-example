class ChatLink
  include Mongoid::Document
  include Mongoid::Timestamps


#todo: como fazer o doucmento link pertencer ao documento Team?

  SORT_ORDERS = ['created_at', '-created_at', 'updated_at', '-updated_at']

  field :team_id, type: String
  field :title, type: String
  field :uri, type: String
  field :author, type: String
  field :channel, type: String
  field :description, type: String
  field :active, type: Boolean, default: true



  scope :active, -> { where(active: true) }

  #validates_uniqueness_of :token, message: 'has already been used'
#  validates_presence_of :team_id, :link_id, :uri, :author, :channel

  def deactivate!
    update_attributes!(active: false)
  end

  def activate!
    update_attributes!(active: true)
  end

  def to_s
    {
      title: title,
      uri: uri,
      team_id: team_id,
      id: link_id
    }.map do |k, v|
      "#{k}=#{v}" if v
    end.compact.join(', ')
  end

end
