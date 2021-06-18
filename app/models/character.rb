class Character < ActiveRecord::Base
  belongs_to :actor
  belongs_to :show
  belongs_to :network

  def say_that_thing_you_say
    "#{self.name} always says: #{self.catchphrase}"
  end

  def build_show(hash)
      Show.where(hash)[0] ? Show.where(hash)[0].tap {|show| show.characters << self} : Show.create(hash).tap {|show| show.characters << self}
  end

  def build_network(hash)
    Network.where(hash)[0] ? Network.where(hash)[0].characters << self : Network.create(hash).characters << self
  end

end