class MedalsController < ApplicationController
  # GET /medals
  # GET /medals.xml
  def index
    @medals = Medal.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @medals }
    end
  end

  # GET /medals/1
  # GET /medals/1.xml
  def show
    @medal = Medal.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @medal }
    end
  end

  # GET /medals/new
  # GET /medals/new.xml
  def new
    @medal = Medal.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @medal }
    end
  end

  # GET /medals/1/edit
  def edit
    @medal = Medal.find(params[:id])
  end

  # POST /medals
  # POST /medals.xml
  def create
    @medal = Medal.new(params[:medal])

    respond_to do |format|
      if @medal.save
        format.html { redirect_to(@medal, :notice => 'Medal was successfully created.') }
        format.xml  { render :xml => @medal, :status => :created, :location => @medal }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @medal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /medals/1
  # PUT /medals/1.xml
  def update
    @medal = Medal.find(params[:id])

    respond_to do |format|
      if @medal.update_attributes(params[:medal])
        format.html { redirect_to(@medal, :notice => 'Medal was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @medal.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /medals/1
  # DELETE /medals/1.xml
  def destroy
    @medal = Medal.find(params[:id])
    @medal.destroy

    respond_to do |format|
      format.html { redirect_to(medals_url) }
      format.xml  { head :ok }
    end
  end
end
