class PaymentType < ApplicationRecord

	enum payment_method: [:DINHEIRO,  :DEBITO,  :CREDITO,  :TEF, :BOLETO, :PAGAMENTOONLINE]
	enum payment_brand: [:VISA, :VISALECTRON, :MASTERCARD, :AMEX, :ELO, :DISCOVER, :Banescard, :Sorocard, :Policard, :Valecard, :Agicard, :JCB, :CredSystem, :Cabal, :GreenCard, :Verocheque, :Avista, :Aura, :PagSeguro, :PayPal, :MercadoPago, :Moip, :iugu, :PagarMe, :Stripe, :BoletoSimples, :Vindi, :MundiPagg]


end









