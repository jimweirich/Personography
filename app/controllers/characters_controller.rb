class CharactersController < ApplicationController
  assume(:character) { Character.find(params[:id]) }

  # GET /characters
  # GET /characters.xml
  def index
    @characters = Character.order("name").all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @characters }
    end
  end

  # GET /characters/1
  # GET /characters/1.xml
  def show
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => character }
    end
  end

  # GET /characters/new
  # GET /characters/new.xml
  def new
    self.character = Character.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => character }
    end
  end

  # GET /characters/1/edit
  def edit

  end

  # POST /characters
  # POST /characters.xml
  def create
    self.character = Character.new(params[:character])

    respond_to do |format|
      if character.save
        format.html { redirect_to(character, :notice => 'Character was successfully created.') }
        format.xml  { render :xml => character, :status => :created, :location => character }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /characters/1
  # PUT /characters/1.xml
  def update
    respond_to do |format|
      if character.update_attributes(params[:character])
        format.html { redirect_to(character, :notice => 'Character was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => character.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /characters/1
  # DELETE /characters/1.xml
  def destroy
    character.destroy

    respond_to do |format|
      format.html { redirect_to(characters_url) }
      format.xml  { head :ok }
    end
  end
end
