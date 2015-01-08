class ModelDefinitionController < ApplicationController
  def index
  end

  def show
    @model_definition = ModelDefinition.find(params['id'])
  end

  def new
  end

  def edit
  end

  def create
    @model_definition = ModelDefinition.new(
      label: model_params[:label],
      name: model_params[:name],
      field_definitions: model_params[:field_definitions]
    )

    if @model_definition.save
      render action: 'show', status: :created, location: @model_definition
    end
  end

  def update
  end

  def destroy
  end

  private

  # Sanitize data sent from the client
  def model_params
    {
      label: params['modelName'],
      name: params['modelName'].to_underscore,
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