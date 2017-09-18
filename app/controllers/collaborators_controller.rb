class CollaboratorsController < ApplicationController
  def index
    @collaborators = @wiki.collaborators
  end

  def new
    @users = User.premium.not(current_user.id)
    @collaborator = @wiki.collaborators.new
  end

  def create
    @collaborator = @wiki.collaborators.build(collaborator_params)

    respond_to do |format|
      if @collaborator.save
        format.html { redirect_to @wiki, notice: 'Collaborator was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_collaborator
      @collaborator = Collaborator.find(params[:id])
    end

    def set_wiki
      @wiki = Wiki.friendly.find(params[:wiki_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def collaborator_params
      params.require(:collaborator).permit(:user_id, :wiki_id)
    end


end
