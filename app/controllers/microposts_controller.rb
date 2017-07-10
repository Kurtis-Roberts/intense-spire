class MicropostsController < ApplicationController
    before_action :correct_user,   only: :destroy
    def index
        @microposts = Micropost.all.paginate(page: params[:page], per_page: 10)
        @micropost = current_user.microposts.build 
    end

    def create
        @micropost = current_user.microposts.build(micropost_params)
        @micropost.user.elo = Micropost.get_elo(@micropost.user.api_membership_id )
        @micropost.user.save!
        if @micropost.save
            respond_to do |format|
                # if the response fomat is html, redirect as usual
                format.html { redirect_to microposts_path }

                # if the response format is javascript, do something else...
                format.js { }
            end
        else
         render microposts_path
        end
    end

    def destroy
        @micropost.destroy
        
        respond_to do |format|
            format.html { request.referrer || root_url }
            format.js { }
        end
        
    end

    def get_stats
        begin
            PlayerStat.get_stats(@micropost.user.display_name, @micropost.user.api_membership_type )
        rescue NoMethodError => e 
            # redirect_to request.referrer || root_url
            redirect_to root_url
            flash[:error] = "Error: #{e}"
        end
    end
    helper_method :get_stats


    private

    def micropost_params
      params.require(:micropost).permit(:content)
    end
    
    def correct_user
      @micropost = current_user.microposts.find_by(id: params[:id])
      redirect_to root_url if @micropost.nil?
    end
end
