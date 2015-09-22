# -*- encoding : utf-8 -*-
class OrdenesTrabajoController < ApplicationController

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
              :nombre => current_row[0],
              :apellidos => current_row[1],
              :telefono => current_row[40]
          }
      )
      if client.blank?
        client = Client.new(
            :nombre => current_row[0],
            :apellidos => current_row[1],
            :telefono => current_row[40]
        )
        if client.valid?
          client.save
        else
          errores << {:fila => numero_fila + 1, :mensajes => client.errors.full_messages.collect {|i| 'Client: ' + i}}
          total_ignoradas += 1
          next
        end
      end

      fecha = current_row[2].to_date rescue nil
      fecha += 2000.years if !fecha.nil? && fecha.year < 2000

      fecha_entrega = current_row[3].to_date rescue nil
      fecha_entrega += 2000.years if !fecha_entrega.nil? && fecha_entrega.year < 2000

      fecha_receta = current_row[41].to_date rescue nil
      fecha_receta += 2000.years if !fecha_receta.nil? && fecha_receta.year < 2000

      work_order = client.work_orders.build(
          :descripcion => current_row[1],
          :fecha => fecha,
          :fecha_entrega => fecha_entrega,
          :lejos_od_esferico => current_row[4],
          :lejos_od_cilindrico => current_row[5],
          :lejos_od_grados => current_row[6],
          :lejos_oi_esferico => current_row[7],
          :lejos_oi_cilindrico => current_row[8],
          :lejos_oi_grados => current_row[9],
          :lejos_color => current_row[10],
          :lejos_armazon => current_row[11],
          :lejos_tipo_lente => current_row[12],
          :lejos_distancia_interpupilar => current_row[13],
          :intermedio_od_esferico => current_row[14],
          :intermedio_od_cilindrico => current_row[15],
          :intermedio_od_grados => current_row[16],
          :intermedio_oi_esferico => current_row[17],
          :intermedio_oi_cilindrico => current_row[18],
          :intermedio_oi_grados => current_row[19],
          :intermedio_color => current_row[20],
          :intermedio_armazon => current_row[21],
          :intermedio_tipo_lente => current_row[22],
          :intermedio_distancia_interpupilar => current_row[23],
          :cerca_od_esferico => current_row[24],
          :cerca_od_cilindrico => current_row[25],
          :cerca_od_grados => current_row[26],
          :cerca_oi_esferico => current_row[27],
          :cerca_oi_cilindrico => current_row[28],
          :cerca_oi_grados => current_row[29],
          :cerca_color => current_row[30],
          :cerca_armazon => current_row[31],
          :cerca_tipo_lente => current_row[32],
          :cerca_distancia_interpupilar => current_row[33],
          :bifocal => current_row[34],
          :altura => current_row[35],
          :observaciones => current_row[36],
          :nombre_doctor => current_row[37],
          :total => current_row[38],
          :senya => current_row[39],
          :fecha_receta => fecha_receta
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
