class ExamplesController < ApplicationController
  def index
    examples = current_user.examples 
    render json: examples
  end

  def show
    example = Example.find(params[:id])
    render json: example
  end

  def create
    examples = Example.new(
      user_id: params[:user_id],
      prompt_id: params[:prompt_id],
      word: params[:word],
      sentence: params[:sentence]
    )
    if examples.save
      render json: { message: "Heck of a Save!" }, status: :created
    else
      render json: { message: "Please Login to Complete This Request" }, status: :unauthorized
    end
  end

  def update
    examples = Example.find(params[:id])
    if current_user == examples.user
      examples.sentence = params[:sentence] || user.sentence
      if examples.save
        render json: examples
      else
        render json: { message: "Please Login" }, status: :unauthorized
      end
    end  
  end

  def destroy
    examples = Example.find(params[:id])
    if current_user == examples.user
    examples.destroy
    render json: {message: "Successfully destroyed!"}
  end



end
