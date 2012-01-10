class InternalMessagesController < ApplicationController
  # GET /internal_messages
  # GET /internal_messages.xml
  def index
    @internal_messages = InternalMessage.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @internal_messages }
    end
  end

  # GET /internal_messages/1
  # GET /internal_messages/1.xml
  def show
    @internal_message = InternalMessage.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @internal_message }
    end
  end

  # GET /internal_messages/new
  # GET /internal_messages/new.xml
  def new
    @internal_message = InternalMessage.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @internal_message }
    end
  end

  # GET /internal_messages/1/edit
  def edit
    @internal_message = InternalMessage.find(params[:id])
  end

  # POST /internal_messages
  # POST /internal_messages.xml
  def create
    @internal_message = InternalMessage.new(params[:internal_message])

    respond_to do |format|
      if @internal_message.save
        format.html { redirect_to(@internal_message, :notice => 'Internal message was successfully created.') }
        format.xml  { render :xml => @internal_message, :status => :created, :location => @internal_message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @internal_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /internal_messages/1
  # PUT /internal_messages/1.xml
  def update
    @internal_message = InternalMessage.find(params[:id])

    respond_to do |format|
      if @internal_message.update_attributes(params[:internal_message])
        format.html { redirect_to(@internal_message, :notice => 'Internal message was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @internal_message.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /internal_messages/1
  # DELETE /internal_messages/1.xml
  def destroy
    @internal_message = InternalMessage.find(params[:id])
    @internal_message.destroy

    respond_to do |format|
      format.html { redirect_to(internal_messages_url) }
      format.xml  { head :ok }
    end
  end
end
