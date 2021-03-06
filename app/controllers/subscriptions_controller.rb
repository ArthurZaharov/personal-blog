class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    if subcribe_to_author.success?
      flash[:notice] = "Subscription created"
    else
      flash[:alert] = subcribe_to_author.message
    end

    redirect_to(author_path(params[:author_id]))
  end

  private

  def subcribe_to_author
    @subcribe_to_author ||= SubscribeToAuthor.call(
      subscription_type: params[:subscription_type],
      author_id: params[:author_id],
      current_user_id: current_user.id,
      stripe_email: params[:stripeEmail],
      stripe_token: params[:stripeToken]
    )
  end
end
