class Show < ActiveRecord::Base
  has_many :characters
  belongs_to :network

  def build_network(hash)
    Network.where(hash)[0] ? Network.where(hash)[0].tap {|network| network.shows << self} : Network.create(hash).tap {|network| network.shows << self}
  end

  def actors_list
    Character.where(show: self).map{|character| character.actor.full_name}.uniq
  end
end