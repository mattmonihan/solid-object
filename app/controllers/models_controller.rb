class ModelsController < ApplicationController
  def new
  end

  def create
    model = ModelDefinition.new(
      label: model_params['model_name'],
      name: model_params['model_name'],
      field_definitions: model_params['field_definitions']
    )

    valid? = model.save
  end

  # Sanitize data sent from the client
  def model_params
    {
      model_name: params['modelName'].to_underscore,
      field_definitions: params['fields'].map do |config|
        {
          label: config['label'],
          name: config['label'].to_underscore,
          field_type: config['field_type']
        }
      end
    }
  end
end
