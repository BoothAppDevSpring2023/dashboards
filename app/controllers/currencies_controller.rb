class CurrenciesController < ApplicationController
  def first_currency

    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys
    render({ :template => "currency_templates/step_one.html.erb"})

  end

  def second_currency
    @raw_data = open("https://api.exchangerate.host/symbols").read
    @parsed_data = JSON.parse(@raw_data)
    @symbols_hash = @parsed_data.fetch("symbols")

    @array_of_symbols = @symbols_hash.keys

    @from_symbol = params.fetch("from_currency")
    render({ :template => "currency_templates/step_two.html.erb"})

  end


  #def output
   # @raw_data_output = open("https://api.exchangerate.host/convert?from=USD&to=EUR").read
    #@parsed_data = JSON.parse(@raw_data_output)
    #@symbols_hash = @parsed_data.fetch("convert")

    #@array_of_symbols = @symbols_hash.keys

    #@from_symbol = params.fetch("to_currency")
    #render({ :template => "currency_templates/output.html.erb"})

  #end

end
