class ExamplesController < ApplicationController
  def index
    examples = current_user.examples 
    render json: examples
  end
end
