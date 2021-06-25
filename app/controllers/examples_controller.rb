class ExamplesController < ApplicationController
  before_action :authenticate_user

  def index
    examples = current_user.examples 
    render json: examples
  end

  def show
    example = current_user.examples.find(params[:id])
    if current_user == example.user
      render json: example
    else
      render json: { message: "This is not your page" }, status: :unauthorized
    end
  end

  def create
    example = Example.new(
      user_id: current_user.id,
      prompt_id: params[:prompt_id],
      word: params[:word],
      sentence: params[:sentence]
    )
    if example.save
      render json: { message: "New Example Created!" }, status: :created
    else
      render json: { message: "Please Login to Complete This Request" }, status: :unauthorized
    end
  end

  def update
    example = Example.find(params[:id])
    if current_user == example.user
      example.sentence = params[:sentence] || example.sentence
      if example.save
        render json: example
      else
        render json: { message: "Please Login" }, status: :unauthorized
      end
    end  
  end

  def destroy
    example = Example.find(params[:id])
    if current_user == example.user
      example.delete
      render json: {message: "Successfully destroyed!"}
    else
      render json: {}, status: :unauthorized
    end
  end



end
