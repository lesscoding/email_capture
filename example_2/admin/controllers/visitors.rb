Admin.controllers :visitors do

  get :index do
    @visitors = Visitor.all
    render 'visitors/index'
  end

  get :new do
    @visitor = Visitor.new
    render 'visitors/new'
  end

  post :create do
    @visitor = Visitor.new(params[:visitor])
    if @visitor.save
      flash[:notice] = 'Visitor was successfully created.'
      redirect url(:visitors, :edit, :id => @visitor.id)
    else
      render 'visitors/new'
    end
  end

  get :edit, :with => :id do
    @visitor = Visitor.find(params[:id])
    render 'visitors/edit'
  end

  put :update, :with => :id do
    @visitor = Visitor.find(params[:id])
    if @visitor.update_attributes(params[:visitor])
      flash[:notice] = 'Visitor was successfully updated.'
      redirect url(:visitors, :edit, :id => @visitor.id)
    else
      render 'visitors/edit'
    end
  end

  delete :destroy, :with => :id do
    visitor = Visitor.find(params[:id])
    if visitor.destroy
      flash[:notice] = 'Visitor was successfully destroyed.'
    else
      flash[:error] = 'Unable to destroy Visitor!'
    end
    redirect url(:visitors, :index)
  end
end
