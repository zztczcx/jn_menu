# coding: utf-8
require 'csv'
require 'zip'
require 'open-uri'
class RestaurantController < ApplicationController
  def index
    #if Menu.count > 0 
      #redirect_to menus_path
    #end
  end

  def create
    csv_zip = params[:file]
    # save this file to a place
    if csv_zip
      file_name = Rails.root.join('public', 'uploads', csv_zip.original_filename)
      File.open(file_name, 'wb') do |file|
        file.write(csv_zip.read)
      end
    else
      # download from url
      file_name = Rails.root.join('public', 'uploads', 'menus.zip')
      open(file_name, 'wb') do |file|
        file << open(params[:url]).read
      end
    end

    Zip::File.open(file_name) do |zipfile|
      zipfile.each do |file|
        # do something with file
        if file.ftype == :file 
          name = file.name.split("/")[-1].split(".")[0]
          if name != ''
            @model = name.classify.constantize
            self.save_data(file.get_input_stream.read)
            Rails.logger.debug name
          end
        end
      end
    end

    redirect_to menus_path, notice: "The menus has been uploaded."
  end

  def save_data(csv_text)
    text = csv_text.force_encoding("utf-8")
    csv = CSV.parse(text, :headers => true)
    datas = csv.map { |row| row.to_hash}
    self.sql_exec(datas)
  end

  def sql_str(values)
    "INSERT INTO #{@model.table_name} ( #{@model.column_names.join(',')} ) VALUES #{values.join(',')}"
  end


  def sql_value(data)
    
    value = @model.column_names.map do |c|
      if data[c] 
        text = data[c].gsub("\"", '') 
        "\"#{text}\""
      else
        "NULL"
      end
    end
    "(#{value.join(',')})"
  end


  def sql_exec(datas) 
    step = 500
    (0..datas.length-1).step(step).each do |index|
      values = datas.slice(index, step).inject([]) do |cumulative, data|
        data['id'].to_i == 0 ? cumulative : cumulative << self.sql_value(data)
      end

      sql = self.sql_str(values)
      @model.connection.execute sql
    end
  end

end
