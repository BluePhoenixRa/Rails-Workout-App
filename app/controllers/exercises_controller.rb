class ExercisesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_exercise, except: [:index, :new, :create]

  def index
    @exercises = current_user.exercises.all
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

  def show

  end

  def edit
  end

  def update
    if @exercise.update(exercise_params)
      flash[:success] = "Workout has been updated successfully"
      redirect_to [current_user, @exercise]
    else
      flash[:danger] = "Workout has not been updated"
      render :edit
    end
  end

  def destroy
    @exercise.destroy
    flash[:success] = "Workout has been deleted"
    redirect_to user_exercises_path(current_user)
  end

  private

    def exercise_params
      params.require(:exercise).permit(:duration, :workout, :workout_date, :user_id)
    end

    def set_exercise
      @exercise = current_user.exercises.find(params[:id])
    end
end
