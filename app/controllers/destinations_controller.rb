class DestinationsController < ApplicationController
    
    get '/destinations' do 
        @destinations = Destination.all 
        erb :'destinations/index'
    end

    get '/destinations/new' do
        @destination = Destination.new
        erb :'destinations/new'
    end

    post '/destinations' do 
        @destination = Destination.new(params[:destination])
        if @destination.save
            redirect '/destinations'
        else
            erb :'destinations/new'
        end
    end
###Dynamic Route###

    get 'destinations/:id/edit' do
        set_destination
        erb :'destinations/edit'
    end

    get '/destinations/:id' do
        set_destination
        if @destination
            erb :'destinations/show'
        else
            redirect '/destinations'
        end
    end

    patch '/destinations/:id' do
       set_destination
       if @destination.update(
            title: params[:destination][:title],
        
                )
            redirect "/destinations/#{@destination.id}"
       else
        erb :'destinations/edit'
       end
    end

    delete '/destinations/:id' do 
        set_destination
        @destination.destroy
        redirect "/destinations"
    end

    private
        def set_destination
            @destination = Destination.find_by_id(params[:id])
        end
end