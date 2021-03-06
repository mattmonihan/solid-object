class FieldDefinition
  include Mongoid::Document
  include Mongoid::Attributes::Dynamic

  field :name, type: String
  field :label, type: String
  field :field_type, type: String

  embedded_in :model_definition, inverse_of: :field_definitions
end
