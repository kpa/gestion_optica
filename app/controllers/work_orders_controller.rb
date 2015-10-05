# -*- encoding : utf-8 -*-
class WorkOrdersController < ApplicationController

  before_filter :find_client

  # GET /work_orders
  # GET /work_orders.xml
  def index
    @work_orders = @client.work_orders.search params[:search], params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @work_orders }
    end
  end

  # GET /work_orders/1
  # GET /work_orders/1.xml
  def show
    @work_order = WorkOrder.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @work_order }
    end
  end

  # GET /work_orders/new
  # GET /work_orders/new.xml
  def new
    @work_order = WorkOrder.new
    @work_order.client = @client

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @work_order }
    end
  end

  # GET /work_orders/1/edit
  def edit
    @work_order = WorkOrder.find(params[:id])
  end

  # POST /work_orders
  # POST /work_orders.xml
  def create
    @work_order = WorkOrder.new(params[:work_order])
    @work_order.client = @client
     
    respond_to do |format|
      if @work_order.save
        flash[:notice] = 'La órden de trabajo ha sido creada con éxito.'
        format.html { redirect_to([@client, @work_order]) }
        format.xml  { render :xml => @work_order, :status => :created, :location => @work_order }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /work_orders/1
  # PUT /work_orders/1.xml
  def update
    @work_order = WorkOrder.find(params[:id])
    @work_order.client = @client

    respond_to do |format|
      if @work_order.update_attributes(params[:work_order])
        flash[:notice] = 'La órden de trabajo ha sido editada con éxito.'
        format.html { redirect_to([@client, @work_order]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @work_order.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /work_orders/1
  # DELETE /work_orders/1.xml
  def destroy
    @work_order = @client.work_orders.find(params[:id])
    @work_order.destroy

    respond_to do |format|
      format.html { redirect_to(work_orders_url) }
      format.xml  { head :ok }
    end
  end

  def find_items
    @work_orders = @client.work_orders.search params[:search], params[:page]
    render :partial => 'search'
  end

  def find_client
    @client = Client.first(:conditions => ['id  = ?', params[:client_id]])
    redirect_to clients_url unless @client
  end

  def import_file
    fichero = params[:import_file]
    if fichero.blank?
      flash[:warning] = 'Debe seleccionar un fichero'
      redirect_to :back
      return
    end
    csv_data = fichero.read
    grid = CSV::Reader.parse(csv_data, ',').to_a[1..-1]
    total_cargadas = 0
    total_ignoradas = 0
    errores = Array.new

    grid.each_with_index do |current_row, numero_fila|
      errores_fila = Array.new
      if current_row[0].blank?
        errores_fila << 'Debe especificar un client'
        errores << {:fila => numero_fila + 1, :mensajes => errores_fila}
        total_ignoradas += 1
        next
      end
      client = Client.first(
          :conditions => {
              :name => current_row[0],
              :surname => current_row[1],
              :phone_number => current_row[40]
          }
      )
      if client.blank?
        client = Client.new(
            :name => current_row[0],
            :surname => current_row[1],
            :phone_number => current_row[40]
        )
        if client.valid?
          client.save
        else
          errores << {:fila => numero_fila + 1, :mensajes => client.errors.full_messages.collect {|i| 'Client: ' + i}}
          total_ignoradas += 1
          next
        end
      end

      date = current_row[2].to_date rescue nil
      date += 2000.years if !date.nil? && date.year < 2000

      delivery_date = current_row[3].to_date rescue nil
      delivery_date += 2000.years if !delivery_date.nil? && delivery_date.year < 2000

      prescription_date = current_row[41].to_date rescue nil
      prescription_date += 2000.years if !prescription_date.nil? && prescription_date.year < 2000

      work_order = client.work_orders.build(
          :description => current_row[1],
          :date => date,
          :delivery_date => delivery_date,
          :distance_right_sph => current_row[4],
          :distance_right_cyl => current_row[5],
          :distance_right_axis => current_row[6],
          :distance_left_sph => current_row[7],
          :distance_left_cyl => current_row[8],
          :distance_left_axis => current_row[9],
          :distance_lens_color => current_row[10],
          :distance_frame => current_row[11],
          :distance_lens_type => current_row[12],
          :distance_ipd => current_row[13],
          :intermediate_right_sph => current_row[14],
          :intermediate_right_cyl => current_row[15],
          :intermediate_right_axis => current_row[16],
          :intermediate_left_sph => current_row[17],
          :intermediate_left_cyl => current_row[18],
          :intermediate_left_axis => current_row[19],
          :intermediate_lens_color => current_row[20],
          :intermediate_frame => current_row[21],
          :intermediate_lens_type => current_row[22],
          :intermediate_ipd => current_row[23],
          :near_right_sph => current_row[24],
          :near_right_cyl => current_row[25],
          :near_right_axis => current_row[26],
          :near_left_sph => current_row[27],
          :near_left_cyl => current_row[28],
          :near_left_axis => current_row[29],
          :near_lens_color => current_row[30],
          :near_frame => current_row[31],
          :near_lens_type => current_row[32],
          :near_ipd => current_row[33],
          :bifocal => current_row[34],
          :height => current_row[35],
          :comments => current_row[36],
          :doctor_name => current_row[37],
          :invoice => current_row[38],
          :payment_on_account => current_row[39],
          :prescription_date => prescription_date
      )
      if work_order.valid?
        work_order.save
        total_cargadas += 1
      else
        errores << {:fila => numero_fila + 1, :mensajes => work_order.errors.full_messages}
        total_ignoradas += 1
      end
    end

    if errores.blank?
      flash[:notice] =  "Los datos se han importado con éxito.<br>Se han cargado #{total_cargadas} entradas.<br>Se han ignorado #{total_ignoradas} entradas."
    else
      mensaje = "Algunos datos no se han podido cargar debido a errores.<br>"
      mensaje += "Se han cargado #{total_cargadas} entradas.<br>Se han ignorado #{total_ignoradas} entradas.<br>"
      mensaje += "#{errores.size} entradas no se han podido cargar debido a errores.<br>Los errores son los siguientes:<br>"
      mensaje += '<ul>' + errores.collect {|i| "<li>En la fila #{i[:fila]}:</li>" + '<ul>' + i[:mensajes].collect{|j| '<li>' + j + '</li>'}.join + '</ul>'}.join + '</ul>'
      flash[:warning] =  mensaje
    end
    redirect_to :controller => :main
  end
end
