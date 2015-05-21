class Backend::StationsController < Backend::BaseController
def index
    @title = '类别列表'
    @stations = Station.order("created_at desc").all.paginate(page:params[:page],per_page:10)
end

def new
    @title = '添加类别'
    @stations = Station.new
end

def create
    @stations = Station.new(station_params)
    if @stations.save
      flash[:success] = '添加成功'
      redirect_to backend_stations_path
    else
      flash[:errors] = @stations.errors
      render :new
    end
end

def edit
    @station = Station.find(params[:id])
end

def update
    station = Station.find(params[:id])
    respond_to do |format|
      if station.update_attributes(station_params)
        format.html { redirect_to backend_stations_path, notice: '更新成功' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: station.errors, status: :unprocessable_entity }
      end
    end
end

def destroy
    station = Station.find(params[:id])
    station.destroy
    redirect_to backend_stations_path
end 

private
    def station_params
      params.require(:station).permit(:name, :url)
    end
end