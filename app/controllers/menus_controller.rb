# coding: utf-8
require 'csv'
require 'zip'
class MenusController < ApplicationController

  def index
    if Menu.count > 0 
      @menus = Menu.page params[:page] 
    else
      # 这里应该可以不用new, 仔细看一下 form_helper 到底怎么用
      @menu = Menu.new
    end
  end

  def venue 
    @menus = Menu.where(venue: params[:venue]).page params[:page] 
  end

  def event
    @menus = Menu.where(event: params[:event]).page params[:page] 
  end

  def create
    csv_zip = params[:menu][:attachment]
    # save this file to a place
    file_name = Rails.root.join('public', 'uploads', csv_zip.original_filename)
    File.open(file_name, 'wb') do |file|
      file.write(csv_zip.read)
    end

    #Zip::File.open(file_name) do |zipfile|
      #zipfile.each do |file|
        ## do something with file
        #if file.ftype == :file 
          #name = file.name.split("/")[1].split(".")[0]
          #self.save_data(file.get_input_stream.read, name.classify.constantize)
        #end
      #end
    #end

    redirect_to menus_path, notice: "The menus has been uploaded."
  end

  def save_data(csv_text, model)
    csv = CSV.parse(csv_text.force_encoding("utf-8"), :headers => true)
    csv.each do |row|
      data = model.clean_data(row.to_hash)
      # 如何更好的清洗数据
      if data["id"].to_i !=0
        model.create(data)
      end
    end

  end

  def export
    #TODO check params 
    place = params['place']
    begin_time = DateTime.parse(params['begin_time'])
    end_time = DateTime.parse(params['end_time'])

    data = Menu.where(place: place, created_at: begin_time..end_time).to_json

    send_data data, :type => 'application/json; header=present', :disposition => "attachment; filename=menus.json"
  end

end

