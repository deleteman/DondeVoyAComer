class PlacesController < ApplicationController

  before_filter :authenticate_user!, :except => [:search, :show]
  before_filter :check_points, :only => [:edit]

	def check_points
		if !current_user.nil? && current_user.can_edit_place?
			return true
		else
			flash[:error] = "Necesitas 1000 puntos para poder editar locales comerciales"
			redirect_to request.referer
			return false
		end
	end
  # GET /places
  # GET /places.xml
  def index
    @places = Place.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @places }
    end
  end

  # GET /places/1
  # GET /places/1.xml
  def show
    @place = Place.find(params[:id])
	@review = Review.new
	@review.place_id = @place.id
	@review.owner_user_id = current_user.id if !current_user.nil?

	

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/new
  # GET /places/new.xml
  def new
	  @current_page = "add"
    @place = Place.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @place }
    end
  end

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # POST /places
  # POST /places.xml
  def create
    @place = Place.new(params[:place])
	@place.active = true

    respond_to do |format|
      if @place.save
		current_user.points += APP_CONFIG['new_place']
		current_user.save

		act = Action.new({:owner_user_id => current_user.id, :code => :new_place})
		act.set_attributes({:place => @place})
		act.save


        format.html { redirect_to(@place, :notice => 'El local fue creado correctamente!') }
        format.xml  { render :xml => @place, :status => :created, :location => @place }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])

    respond_to do |format|
	  if !params[:working_days_names].nil?
		params[:place][:working_days] = Array.new
		params[:working_days_names].each do |wdn|
			params[:place][:working_days] << WorkingDay.find_by_name(wdn)
		end
	  end
      if @place.update_attributes(params[:place])
        format.html { redirect_to(@place, :notice => 'El local fue editado correctamente!') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end


  def search
	  @current_page = "search"
	  @search_params = params;
	  conditions = Array.new


	  if !params[:category].nil?
		#conditions << ["category_id = ?", Integer(params[:category])]
	  end

	  if !params[:place_type].blank?
		  conditions << ["place_type = ?", params[:place_type]]
	  end

	  if !params[:name].blank?
		  conditions << ["places.name like ?", "%#{params[:name]}%"]
	  end

	  if !params[:highlighted_food].blank?
		  conditions << ["highlited_food like ?", "%#{params[:highlighted_food]}%"]
	  end

	  if !params[:start_time].blank?
		  conditions << ["time(opening_time) <= ?", "#{params[:start_time]}:00"]
		  conditions << ["time(closing_time) >= ?", "#{params[:start_time]}:00"]
	  end

	  if conditions.length > 0
		  #Obtenemos todos los primeros elementos de los arrays y los joineamos en un solo string
		  all_conditions = conditions.map { |c|
			  c.first
		  }.join(" AND ")
		
		  #Obtenemos los segundos elementos de los arrays y lo dejamos como array
		  all_values = conditions.map { |c|
			  c[1..-1]
		  }

		  #Sumamos en un array, el string y todos los valores en formato array
		  conditions = [all_conditions] + all_values
	  end

	  @results = Place.where(conditions).paginate(:page => params[:page])

	  if !params[:working_days_names].nil?
		  @results = @results.joins("join places_working_days on places.id = places_working_days.place_id").joins("join working_days on working_days.id = places_working_days.working_day_id").where(:working_days => {:short_name => params[:working_days_names]}).group("places.id")
	  end


  end
end
