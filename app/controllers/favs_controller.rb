class FavsController < ApplicationController

  require 'will_paginate/array'


  # GET /favs
  # GET /favs.json
  def index
    @pagina = params[:page]
    @favs = Fav.all.paginate(:page => params[:page], :per_page => 2)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @favs }
    end
  end

  # GET /favs/1
  # GET /favs/1.json
  def show
    @fav = Fav.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fav }
    end
  end

  # GET /favs/new
  # GET /favs/new.json
  def new
    @fav = Fav.new
    titulo =@fav.title
    if @fav.title?
    @fav.slug = titulo.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
    end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fav }
    end
  end

  # GET /favs/1/edit
  def edit
    @fav = Fav.find(params[:id])
  end

  # POST /favs
  # POST /favs.json
  def create
    @fav = Fav.new(params[:fav])

    respond_to do |format|
      if @fav.save
        format.html { redirect_to @fav, notice: 'Fav was successfully created.' }
        format.json { render json: @fav, status: :created, location: @fav }
      else
        format.html { render action: "new" }
        format.json { render json: @fav.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /favs/1
  # PUT /favs/1.json
  def update
    @fav = Fav.find(params[:id])
    titulo =@fav.title
    if @fav.title?
    @fav.slug = titulo.downcase.gsub(/[^a-z1-9]+/, '-').chomp('-')
    end
    respond_to do |format|
      if @fav.update_attributes(params[:fav])
        format.html { redirect_to @fav, notice: 'Fav was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @fav.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /favs/1
  # DELETE /favs/1.json
  def destroy
    @fav = Fav.find(params[:id])
    @fav.destroy

    respond_to do |format|
      format.html { redirect_to favs_url }
      format.json { head :ok }
    end
  end
end
