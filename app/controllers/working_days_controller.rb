class WorkingDaysController < ApplicationController
  # GET /working_days
  # GET /working_days.xml
  def index
    @working_days = WorkingDay.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @working_days }
    end
  end

  # GET /working_days/1
  # GET /working_days/1.xml
  def show
    @working_day = WorkingDay.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @working_day }
    end
  end

  # GET /working_days/new
  # GET /working_days/new.xml
  def new
    @working_day = WorkingDay.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @working_day }
    end
  end

  # GET /working_days/1/edit
  def edit
    @working_day = WorkingDay.find(params[:id])
  end

  # POST /working_days
  # POST /working_days.xml
  def create
    @working_day = WorkingDay.new(params[:working_day])

    respond_to do |format|
      if @working_day.save
        format.html { redirect_to(@working_day, :notice => 'Working day was successfully created.') }
        format.xml  { render :xml => @working_day, :status => :created, :location => @working_day }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @working_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /working_days/1
  # PUT /working_days/1.xml
  def update
    @working_day = WorkingDay.find(params[:id])

    respond_to do |format|
      if @working_day.update_attributes(params[:working_day])
        format.html { redirect_to(@working_day, :notice => 'Working day was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @working_day.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /working_days/1
  # DELETE /working_days/1.xml
  def destroy
    @working_day = WorkingDay.find(params[:id])
    @working_day.destroy

    respond_to do |format|
      format.html { redirect_to(working_days_url) }
      format.xml  { head :ok }
    end
  end
end
