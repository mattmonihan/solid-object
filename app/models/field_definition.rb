class FieldDefinition
  include Mongoid::Document

  field :name, type: String
  field :label, type: String
  field :field_type, type: String
end