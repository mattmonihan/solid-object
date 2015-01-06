class ModelDefinition
  include Mongoid::Document

  field :name, type: String
  field :label, type: String

  embeds_many :field_definitions
end
