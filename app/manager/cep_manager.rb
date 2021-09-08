class CepManager
  require 'correios-cep'

  def initialize(cep_number)
    @cep = remove_special_caracters cep_number
  end

  def process
    return false if @cep.nil?
    
    finder = Correios::CEP::AddressFinder.new
    address = finder.get(@cep)

    return address
  end

  private
  
  def remove_special_caracters string
    string&.tr(' ', '')&.tr('.', '')&.tr('-', '')&.tr('    ', '')
  end
end