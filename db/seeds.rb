# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
btc = Asset.find_or_create_by(symbol: 'BTC', currency: 'USD')
petr4 = Asset.find_or_create_by(symbol: 'PETR4', currency: 'BRL')
aapl = Asset.find_or_create_by(symbol: 'AAPL', currency: 'USD')
vale3 = Asset.find_or_create_by(symbol: 'VALE3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'ABEV3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'ALPA4', currency: 'BRL')
Asset.find_or_create_by(symbol: 'AZUL4', currency: 'BRL')
Asset.find_or_create_by(symbol: 'BBAS3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'BEEF3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'CASH3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'CIEL3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'DXCO3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'ELET3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'FLRY3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'GOLL4', currency: 'BRL')
Asset.find_or_create_by(symbol: 'HAPV3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'HYPE3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'ITUB4', currency: 'BRL')
Asset.find_or_create_by(symbol: 'MGLU3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'MULT3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'PETZ3', currency: 'BRL')
Asset.find_or_create_by(symbol: 'RAIL3', currency: 'BRL')

quote_btc_1 = Quote.find_or_create_by(asset: btc, price: 4_600_000)
quote_btc_2 = Quote.find_or_create_by(asset: btc, price: 5_000_000)
quote_btc_3 = Quote.find_or_create_by(asset: btc, price: 4_650_000, current: true)

quote_petr4_1 = Quote.find_or_create_by(asset: petr4, price: 3_300)
quote_petr4_2 = Quote.find_or_create_by(asset: petr4, price: 3_200)
quote_petr4_3 = Quote.find_or_create_by(asset: petr4, price: 3_500, current: true)
quote_vale3 = Quote.find_or_create_by(asset: vale3, price: 666, current: true)

quote_aapl_1 = Quote.find_or_create_by(asset: aapl, price: 17_400)
quote_aapl_2 = Quote.find_or_create_by(asset: aapl, price: 16_000)
quote_aapl_3 = Quote.find_or_create_by(asset: aapl, price: 15_300, current: true)

Alert.find_or_create_by(message: "#{btc.symbol} is going down to #{Money.from_cents(quote_btc_1.price, btc.currency).format}")
Alert.find_or_create_by(message: "#{btc.symbol} is going up to #{Money.from_cents(quote_btc_2.price, btc.currency).format}")
Alert.find_or_create_by(message: "#{btc.symbol} is going down to #{Money.from_cents(quote_btc_3.price, btc.currency).format}")

Alert.find_or_create_by(message: "#{petr4.symbol} is going up to #{Money.from_cents(quote_petr4_1.price, petr4.currency).format}")
Alert.find_or_create_by(message: "#{petr4.symbol} is going down to #{Money.from_cents(quote_petr4_2.price, petr4.currency).format}")
Alert.find_or_create_by(message: "#{petr4.symbol} is going up to #{Money.from_cents(quote_petr4_3.price, petr4.currency).format}")

Alert.find_or_create_by(message: "#{vale3.symbol} is CREATED VIA SEED #{Money.from_cents(quote_vale3.price, vale3.currency).format}")

Alert.find_or_create_by(message: "#{aapl.symbol} is going down to #{Money.from_cents(quote_aapl_1.price, aapl.currency).format}")
Alert.find_or_create_by(message: "#{aapl.symbol} is going down to #{Money.from_cents(quote_aapl_2.price, aapl.currency).format}")
Alert.find_or_create_by(message: "#{aapl.symbol} is going down to #{Money.from_cents(quote_aapl_3.price, aapl.currency).format}")
