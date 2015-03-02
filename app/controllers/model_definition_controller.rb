class ModelDefinitionController < ApplicationController
  def index
    @model_definitions = ModelDefinition.all
  end

  def show
    @model_definition = ModelDefinition.find(params['id'])
  end

  def new
    render :edit
  end

  def edit
    @model_definition = ModelDefinition.find(params['id'])
  end

  def create
    @model_definition = ModelDefinition.new(
      label: model_params[:label],
      name: model_params[:name],
      field_definitions: model_params[:field_definitions]
    )

    if @model_definition.save
      render json: @model_definition, status: :created
    end
  end

  def update
  end

  def destroy
    # @model_definition = ModelDefinition.find(params['id'])
    # @model_definition.destroy
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
          field_type: config['field_type'],
          field_options: config['field_options'],
          required: config['required']

        }
      end
    }
  end
end
