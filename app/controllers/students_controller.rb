class StudentsController < ApplicationController

rescue_from ActiveRecord::RecordNotFound, with: :handle_record_not_found

    def index
        students = Student.all
        byebug
        render json: students
    end

    def show
        student = Student.all.find(params[:id])

        if student
            render json: student
        else
            render json: "No student match was found"
        end
    end




    private

    def handle_record_not_found
        render json: {error: 'Record not found'}
    end

    def student_create_params
        params.permit(:name, :age, :major)
    end

end
