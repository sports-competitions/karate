class Event < ActiveRecord::Base
  validates_presence_of :name , :address, :start_date, :end_date

  def team_structure
    read_attribute(:team_structure).map {|t| TeamStructure.new(t) }
  end

  def build_team_structure
    t = self.team_structure.dup
    t << TeamStructure.new({ sportsmen: 0, judges: 0, trainers: 0, delegates: 0 })
    self.team_structure = t
  end

  def team_structure_attributes=(attributes)
    team_structure = []
    attributes.each do |index, attrs|
      team_structure << attrs
    end
    write_attribute(:team_structure, team_structure)
  end

  class TeamStructure
    attr_accessor :sportsmen, :judges, :trainers, :delegates

    def initialize(hash)
      @sportsmen    = hash['sportsmen'].to_i
      @judges       = hash['judges'].to_i
      @trainers     = hash['trainers'].to_i
      @delegates    = hash['delegates'].to_i
    end

    def persisted?() false; end
    def new_record?() false; end
    def marked_for_destruction?() false; end
    def _destroy() false; end
  end
end
