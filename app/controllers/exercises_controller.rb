class ExercisesController < ApplicationController
  before_action :set_exercise, except: [:index, :new, :create]

  def index

  end

  def new
    @exercise = current_user.exercises.new
  end

  def create
    @exercise = current_user.exercises.new(exercise_params)

    if @exercise.save
      flash[:success] = "Workout added successfully!"
      redirect_to [current_user, @exercise]
    else
      flash[:danger] = "Failed to add new workout"
      render :new
    end
  end

  private

    def exercise_params
      params.require(:exercise).permit(:duration, :workout, :workout_date, :user_id)
    end
end