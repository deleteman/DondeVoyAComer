class ReviewsController < ApplicationController

  	before_filter :authenticate_user!, :except => :index
	#before_filter :check_voting_capability, :on => [:vote_up, :vote_down]


	def check_voting_capability
		current_review = Review.find(params[:id])
		if current_review.user_voted_for_this? current_user
			flash[:error] = "Ya votaste por este comentario, no podes volver a hacerlo"
			redirect_to(current_review.place)
		end
	end

	

	#Cancels the vote from a user to a specific review
	def cancel_user_vote usr, review_id
		vote = UserVotes.find_by_user_id_and_review_id(usr.id,review_id)
		@review.votes += (vote.vote * -1)
		if @review.save
			vote.delete
		end
	end

	# Does the actual voting
	def do_vote what
		vote_value = 1
		vote_value *= -1 if what == :down
		
		@review.votes += vote_value
		if @review.save
			# If the user voting is not the owner of the review, then we modify the owner's points
			if current_user.id != @review.owner.id
				@review.owner.points += APP_CONFIG["#{what.to_s}voted_my_comment"]
				@review.owner.save
			end

			# Finally, we create the vote
			UserVotes.create( {:review_id => @review.id, :user_id => current_user.id, :vote => vote_value})
			act = Action.new({:owner_user_id => current_user.id, :code => "#{what}vote_comment".to_sym})
			act.set_attributes({:user2 => @review.owner, :place => @review.place})
			if act.save
				ReviewsHelper.check_for_resulting_medals act, flash
				true
			end
		end
	end

	# Handles the logic associated with a vote down
	def vote_down
		@review = Review.find(params[:id])
		msg = "Hubo un error al votar, por favor, intentalo nuevamente"
		if @review.user_voted_for_this? current_user, :down
			if cancel_user_vote current_user, params[:id]
				msg = "Tu voto fue cancelado"
			end
		elsif @review.user_voted_for_this? current_user, :up
			cancel_user_vote current_user, params[:id]
			if do_vote :down
				msg = "Gracias por tu voto!"
			end
		else
			if do_vote :down
				current_user.points += APP_CONFIG['vote_comment']
				current_user.save
				msg = "Gracias por tu voto!"
			end
		end
		
		respond_to do |format|
			flash[:notice] = msg
			format.html { redirect_to(@review.place ) }
		end
	end

	# Handles the logic associated with a vote up
	def vote_up
		@review = Review.find(params[:id])
		msg = "Hubo un error al votar, por favor, intentalo nuevamente"
		if @review.user_voted_for_this? current_user, :up
			if cancel_user_vote current_user, params[:id]
				msg = "Tu voto fue cancelado"
			end
		elsif @review.user_voted_for_this? current_user, :down
			cancel_user_vote current_user, params[:id]
			if do_vote :up
				msg = "Gracias por tu voto!"
			end
		else
			if do_vote :up
				current_user.points += APP_CONFIG['vote_comment']
				current_user.save

				msg = "Gracias por tu voto!"
			end
		end

		respond_to do |format|
			format.html { redirect_to(@review.place, :notice => msg) }
		end
	end


  # GET /reviews
  # GET /reviews.xml
  def index
    @reviews = Review.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @reviews }
    end
  end

  # GET /reviews/1
  # GET /reviews/1.xml
  def show
    @review = Review.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @review }
    end
  end

  # GET /reviews/new
  # GET /reviews/new.xml
  def new
    @review = Review.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @review }
    end
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.find(params[:id])
  end

  # POST /reviews
  # POST /reviews.xml
  def create
    @review = Review.new(params[:review])
	@review.votes = 0


    respond_to do |format|
      if @review.save
		current_user.points += APP_CONFIG['comment_place']
		current_user.save

		act = Action.new({:owner_user_id => current_user.id, :code => :comment_place})
		act.set_attributes({:place => @review.place})
		act.save

		ReviewsHelper.check_for_resulting_medals act, flash
		
        format.html { redirect_to(@review.place, :notice => 'Gracias por comentar!') }
        format.xml  { render :xml => @review, :status => :created, :location => @review }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /reviews/1
  # PUT /reviews/1.xml
  def update
    @review = Review.find(params[:id])

    respond_to do |format|
      if @review.update_attributes(params[:review])
        format.html { redirect_to(@review, :notice => 'Review was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @review.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.xml
  def destroy
    @review = Review.find(params[:id])
    @review.destroy

    respond_to do |format|
      format.html { redirect_to(reviews_url) }
      format.xml  { head :ok }
    end
  end
end
