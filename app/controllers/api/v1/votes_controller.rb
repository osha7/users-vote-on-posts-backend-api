class Api::V1::VotesController < ApplicationController
    skip_before_action :require_login

    def index
        votes = Vote.all
        render json: {votes: VoteSerializer.new(votes)}
    end

    def show
        # not necessary
    end

    def create
        p = Vote.all.where(post_id: params["post_id"]).where(user_id: params["user_id"])

        if p.empty? 
            vote = Vote.new
            vote.user_id = params["user_id"]
            vote.post_id = params["post_id"]
            vote.like = params["like"]
            vote.dislike = params["dislike"]

            if vote.save 
                render json: {
                    success: "You have liked or disliked this article!"
                }
            else
                render json: {
                    failure: "Unable To Vote At This Time."
                }
            end
        else
            p = p.first
            p.like = params["like"]
            p.dislike = params["dislike"]
            
            if p.save
                render json: {
                    success: "You have changed your vote."
                }
            end
        end
    end

    private

    def votes_params
        params.require(:vote).permit(:id, :like, :dislike, :user_id, :post_id)
    end

end
