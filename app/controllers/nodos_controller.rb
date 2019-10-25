class NodosController < ApplicationController

  def show 
    respond_to do |format|
      format.json do 
        des = Nodo.find(params[:id]).users.find_by(role_id: 4).id if Nodo.find(params[:id]).users.find_by(role_id: 4) != nil
        gen = Nodo.find(params[:id]).users.find_by(role_id: 3).id if Nodo.find(params[:id]).users.find_by(role_id: 3) != nil
        render json: {
          designer: des,
          generator: gen
        } 
      end
    end
  end

  def create
    respond_to do |format|
      format.json do
        node = Nodo.new(name: params[:label], red_id: Campaign.find(params[:camp]).red_id)
        if node.save
          node.update(parent: Nodo.find(params[:parent])) if params[:parent] != false
          render json: node
        else
          render json: node.errors
        end
      end
    end
  end

  def update 
    node = Nodo.find(params[:id])
    respond_to do |format|
      format.json do
        if node.users.ids.include?(params[:designer].to_i) && node.users.ids.include?(params[:generador].to_i)
          render json: "Los usuarios ya estan registrados"
        else
          node.users << User.find(params[:designer]) if !node.users.ids.include?(params[:designer].to_i)
          node.users << User.find(params[:generador]) if !node.users.ids.include?(params[:generador].to_i)
          render json: "Empleados registrados exitosamente"
        end
      end
    end
  end

  def destroy
    node = Nodo.find(params[:id])
    respond_to do |format|
      format.json do
        if node.destroy
          render json: node
        else
          render json: node.errors
        end
      end
    end
  end

end
