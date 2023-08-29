class CommentController < ApplicationController
  before_action :set_commet, only: %i[ show edit update destroy ]
  #load_and_authorize_resource
  
  # GET /comentarios/new
  def new
    @comment = Comment.new
  end

  # POST /comentarios or /comentarios.json
  def create
    @comment = Comment.new(comment_create_params)
    respond_to do |format|
      if @comment.save 
        format.html { redirect_to post_path(@comment.post), notice: 'Comment was successfully created.' }
        format.json { render :show, status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_create_params
      params.require(:comment).permit(:content).merge(post_id: params[:post_id], user_id: params[:user_id])
      

    end
    
  
    # Define los parámetros permitidos para actualizar un comentario
    def comentario_update_params
      params.require(:comment).permit(:content)
    end

end
