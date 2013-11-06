class OrdenesTrabajoController < ApplicationController

  before_filter :find_cliente

  # GET /ordenes_trabajo
  # GET /ordenes_trabajo.xml
  def index
    @ordenes_trabajo = @cliente.ordenes_trabajo.search params[:search], params[:page]

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ordenes_trabajo }
    end
  end

  # GET /ordenes_trabajo/1
  # GET /ordenes_trabajo/1.xml
  def show
    @orden_trabajo = OrdenTrabajo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @orden_trabajo }
    end
  end

  # GET /ordenes_trabajo/new
  # GET /ordenes_trabajo/new.xml
  def new
    @orden_trabajo = OrdenTrabajo.new
    @orden_trabajo.cliente = @cliente

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @orden_trabajo }
    end
  end

  # GET /ordenes_trabajo/1/edit
  def edit
    @orden_trabajo = OrdenTrabajo.find(params[:id])
  end

  # POST /ordenes_trabajo
  # POST /ordenes_trabajo.xml
  def create
    @orden_trabajo = OrdenTrabajo.new(params[:orden_trabajo])
    @orden_trabajo.cliente = @cliente
     
    respond_to do |format|
      if @orden_trabajo.save
        flash[:notice] = 'La órden de trabajo ha sido creada con éxito.'
        format.html { redirect_to([@cliente, @orden_trabajo]) }
        format.xml  { render :xml => @orden_trabajo, :status => :created, :location => @orden_trabajo }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @orden_trabajo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ordenes_trabajo/1
  # PUT /ordenes_trabajo/1.xml
  def update
    @orden_trabajo = OrdenTrabajo.find(params[:id])
    @orden_trabajo.cliente = @cliente

    respond_to do |format|
      if @orden_trabajo.update_attributes(params[:orden_trabajo])
        flash[:notice] = 'La órden de trabajo ha sido editada con éxito.'
        format.html { redirect_to([@cliente, @orden_trabajo]) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @orden_trabajo.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ordenes_trabajo/1
  # DELETE /ordenes_trabajo/1.xml
  def destroy
    @orden_trabajo = @cliente.ordenes_trabajo.find(params[:id])
    @orden_trabajo.destroy

    respond_to do |format|
      format.html { redirect_to(ordenes_trabajo_url) }
      format.xml  { head :ok }
    end
  end

  def find_items
    @ordenes_trabajo = @cliente.ordenes_trabajo.search params[:search], params[:page]
    render :partial => 'search'
  end

  def find_cliente
    @cliente = Cliente.first(:conditions => ['id  = ?', params[:cliente_id]])
    redirect_to clientes_url unless @cliente
  end
end
