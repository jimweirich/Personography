class TagsController < ApplicationController
  assume(:character) { Character.find(params[:character_id]) }
  assume(:tagg) { character.tags.find(params[:id]) }

  # GET /tags
  # GET /tags.xml
  def index
    tags = Tag.sorted

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => tags }
    end
  end

  # GET /tags/1
  # GET /tags/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => tagg }
    end
  end

  # GET /tags/new
  # GET /tags/new.xml
  def new
    self.tagg = Tag.new(:character => character)
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => tagg }
    end
  end

  # GET /tags/1/edit
  def edit

  end

  # POST /tags
  # POST /tags.xml
  def create
    self.tagg = Tag.new(params[:tag])

    respond_to do |format|
      if tagg.save
        format.html { redirect_to(character_path(character), :notice => 'Tag was successfully created.') }
        format.xml  { render :xml => tagg, :status => :created, :location => tagg }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => tagg.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tags/1
  # PUT /tags/1.xml
  def update
    respond_to do |format|
      if tagg.update_attributes(params[:tag])
        format.html { redirect_to(character_path(character), :notice => 'Tag was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => tagg.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.xml
  def destroy
    tagg.destroy

    respond_to do |format|
      format.html { redirect_to character_url(character), notice: "Tag has been deleted." }
      format.xml  { head :ok }
    end
  end
end
