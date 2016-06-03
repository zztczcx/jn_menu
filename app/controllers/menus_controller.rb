# coding: utf-8
class MenusController < ApplicationController

  def index
    @menus = Menu.where.not(place: [nil, '']).page params[:page] 
  end

  def venue 
    @menus = Menu.where(venue: params[:venue]).page params[:page] 
  end

  def event
    @menus = Menu.where(event: params[:event]).page params[:page] 
  end

  def export
    #TODO check params 
    #TODO 去掉time,只要date
    place = params['place']
    begin_time = DateTime.parse(params['begin_time'])
    end_time = DateTime.parse(params['end_time'])

    data = Menu.where(place: place, date: begin_time..end_time).to_json

    send_data data, :type => 'application/json; header=present', :disposition => "attachment; filename=menus.json"
  end

end

