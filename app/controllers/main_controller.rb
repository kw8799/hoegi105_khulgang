class MainController < ApplicationController
    before_action :require_login, except: [:login, :index]
    
    def home
        @recent_review = Review.where.not(review_content: nil)
        render :layout => 'landscape'
    end
    
    def best_list
        @best_review = Review.where.not(review_content: nil)
        render :layout => 'landscape'
    end
    
    def major_lecture
        @useremail = current_user.email
        @major_code = params[:major_pc]
        if params[:major_pc] == nil
            @lecture = nil
        else
            @lecture = ClassofhotsMajor.where(:major_id => @major_code)
        end
        
        render :layout => 'landscape'
    end
    
    def search_lecture
        render :layout => 'landscape'
    end
    
    def result_lecture
        @lecture = Classofhot.where("lecture_title LIKE ?", "%" + params[:title] + "%")

        render :layout => 'landscape'
    end
    
    def lecture_review
        @useremail = current_user.email
        @lecture = Classofhot.find(params[:id]) #변수 lecture는 Classofhot(db)의 특정 id를 받은 값과 같다.
        @mylecturerevw = Review.find_by(:classofhot_id => params[:id], :review_writer => @useremail)
        if Review.where.not(eval_star: nil).exists?(:classofhot_id => params[:id], :review_writer => @useremail, :review_content => nil)
            @mycontent = Review.find_by(:classofhot_id => params[:id], :review_writer => @useremail).eval_star
            @mycontent_id = Review.find_by(:classofhot_id => params[:id], :review_writer => @useremail).id
        elsif Review.where.not(eval_star: nil).exists?(:classofhot_id => params[:id], :review_writer => @useremail)
            @mycontent = Review.find_by(:classofhot_id => params[:id], :review_writer => @useremail).eval_star
            @mycontent_id = Review.find_by(:classofhot_id => params[:id], :review_writer => @useremail).id
            @mycontent_review = Review.find_by(:classofhot_id => params[:id], :review_writer => @useremail).review_content
        end
        # 별점 평균
        sumofrvwsG = @lecture.reviews.all.sum :eval_star
        if sumofrvwsG == 0
            @averagecomft_grade = 0.to_i
        else
            @averagecomft_grade = sumofrvwsG / @lecture.reviews.count
        end
        
        # 학점 잘 주니
        sumofgrade = @lecture.reviews.all.sum :eval_grade
        if sumofgrade == 0
            @representgrade = nil
        else
            @representgrade = sumofgrade / @lecture.reviews.count
        end
        # 편한하니
        sumofeasy = @lecture.reviews.all.sum :eval_easy
        if sumofeasy == 0
            @representeasy = nil
        else
            @representeasy = sumofeasy / @lecture.reviews.count
        end
        # 배우는게 있니
        sumofacademic = @lecture.reviews.all.sum :eval_academic
        if sumofacademic == 0
            @representacademic = nil
        else
            @representacademic = sumofacademic / @lecture.reviews.count
        end
        
        render :layout => 'landscape'
    end
    
    def login
        if user_signed_in?
          redirect_to "/main/home"
        end
    end
    
    def index
        render :layout => 'whitepage'
    end
    
    def detector
        render :layout => 'whitepage' 
    end
    
    def myreview
        @my_review = Review.where({ review_writer: current_user.email })
        render :layout => 'landscape'
    end
    
    def chart_test
        render :layout => 'landscape'
    end
end
