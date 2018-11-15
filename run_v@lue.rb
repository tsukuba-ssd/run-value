require 'csv'

#csvのデータを読み込む
csv_data = CSV.read('gamedata.csv', headers: true)

#score,occurはhash(keyを24パターン　valueを0とする)をpatternは配列を作る
score = {"0000" => 0, "1000" => 0, "2000" => 0, "0001" => 0, "1001" => 0, "2001" => 0, "0010" => 0, "1010" => 0, "2010" => 0, "0100" => 0, "1100" => 0, "2100" => 0, "0011" => 0, "1011" => 0, "2011" => 0, "0110" => 0, "1110" => 0, "2110" => 0, "0101" => 0, "1101" => 0, "2101" => 0, "0111" => 0, "1111" => 0, "2111" => 0 }

occur = {"0000" => 0, "1000" => 0, "2000" => 0, "0001" => 0, "1001" => 0, "2001" => 0, "0010" => 0, "1010" => 0, "2010" => 0, "0100" => 0, "1100" => 0, "2100" => 0, "0011" => 0, "1011" => 0, "2011" => 0, "0110" => 0, "1110" => 0, "2110" => 0, "0101" => 0, "1101" => 0, "2101" => 0, "0111" => 0, "1111" => 0, "2111" => 0 }

pattern = []
#pattern配列に0000を追加する
pattern.push("0000")

#状況が変化したかどうかの判断材料にするためnow,prevとし定義する
now = "0000"
prev = "0000"
#csvのファイルを読み込みデータを回す
csv_data.each do |data|
	#それぞれのデータと照合して数値を代入する
	if data['out'] == '0'
			out = 0
	elsif data['out'] == '1'
			out = 1
	elsif data['out'] == '2'
			out = 2
	end

	if data['一走状況'] == '0'
		runners1 = 0
	else
		runners1 = 1
	end

	if data['二走状況'] == '0'
		runners2 = 0
	else
		runners2 = 1
	end

	if data['三走状況'] == '0'
		runners3 = 0
	else
		runners3 = 1
	end

	#数値に置き換えたものを文字列として順に並べる
 	now = out.to_s + runners3.to_s + runners2.to_s + runners1.to_s

#状況が変わった場合
	if now != prev

#得点が入った場合
			#一塁ランナーが得点した場合
			if data["一走状況"] == "本進"
				#配列patternの中に0000がある場合
				if pattern.select { |n| n == "0000"}
					#hash_scoreのkey0000のvalueに1足す
					 score.store("0000", score["0000"] + 1)
				end
				#配列patternの中に1000がある場合
				if pattern.select { |n| n == "1000"}
					#hash_scoreのkey1000のvalueに1足す
					 score.store("1000", score["1000"] + 1)
				end
				#配列patternの中に2000がある場合
				if pattern.select { |n| n == "2000"}
					#hash_scoreのkey2000のvalueに1足す
					 score.store("2000", score["2000"] + 1)
				end
				#配列patternの中に0001がある場合
				if pattern.select { |n| n == "0001"}
					#hash_scoreのkey0000のvalueに1足す
					 score.store("0001", score["0001"] + 1)
				end
				#配列patternの中に1001がある場合
				if pattern.select { |n| n == "1001"}
					#hash_scoreのkey1001のvalueに1足す
					 score.store("1001", score["1001"] + 1)
				end
				#配列patternの中に2001がある場合
				if pattern.select { |n| n == "2001"}
					#hash_scoreのkey2001のvalueに1足す
					 score.store("2001", score["2001"] + 1)
				end
				#配列patternの中に0010がある場合
				if pattern.select { |n| n == "0010"}
					#hash_scoreのkey0010のvalueに1足す
					 score.store("0010", score["0010"] + 1)
				end
				#配列patternの中に1010がある場合
				if pattern.select { |n| n == "1010"}
					#hash_scoreのkey1010のvalueに1足す
					 score.store("1010", score["1010"] + 1)
				end
				#配列patternの中に2010がある場合
				if pattern.select { |n| n == "2010"}
					#hash_scoreのkey2010のvalueに1足す
					 score.store("2010", score["2010"] + 1)
				end
				#配列patternの中に0100がある場合
				if pattern.select { |n| n == "0100"}
					#hash_scoreのkey0100のvalueに1足す
					 score.store("0100", score["0100"] + 1)
				end
				#配列patternの中に1100がある場合
				if pattern.select { |n| n == "1100"}
					#hash_scoreのkey1100のvalueに1足す
					 score.store("1100", score["1100"] + 1)
				end
				#配列patternの中に2100がある場合
				if pattern.select { |n| n == "2100"}
					#hash_scoreのkey2100のvalueに1足す
					 score.store("2100", score["2100"] + 1)
				end
				#配列patternの中に0011がある場合
				if pattern.select { |n| n == "0011"}
					#hash_scoreのkey0011のvalueに1足す
					 score.store("0011", score["0011"] + 1)
				end
				#配列patternの中に1011がある場合
				if pattern.select { |n| n == "1011"}
					#hash_scoreのkey1011のvalueに1足す
					 score.store("1011", score["1011"] + 1)
				end
				#配列patternの中に2011がある場合
				if pattern.select { |n| n == "2011"}
					#hash_scoreのkey2011のvalueに1足す
					 score.store("2011", score["2011"] + 1)
				end
				#配列patternの中に0110がある場合
				if pattern.select { |n| n == "0110"}
					#hash_scoreのkey0110のvalueに1足す
					 score.store("0110", score["0110"] + 1)
				end
				#配列patternの中に1110がある場合
				if pattern.select { |n| n == "1110"}
					#hash_scoreのkey1110のvalueに1足す
					 score.store("1110", score["1110"] + 1)
				end
				#配列patternの中に2110がある場合
				if pattern.select { |n| n == "2110"}
					#hash_scoreのkey2110のvalueに1足す
					 score.store("2110", score["2110"] + 1)
				end
				#配列patternの中に0101がある場合
				if pattern.select { |n| n == "0101"}
					#hash_scoreのkey0101のvalueに1足す
					 score.store("0101", score["0101"] + 1)
				end
				#配列patternの中に1101がある場合
				if pattern.select { |n| n == "1101"}
					#hash_scoreのkey1101のvalueに1足す
					 score.store("1101", score["1101"] + 1)
				end
				#配列patternの中に2101がある場合
				if pattern.select { |n| n == "2101"}
					#hash_scoreのkey2101のvalueに1足す
					 score.store("2101", score["2101"] + 1)
				end
				#配列patternの中に0111がある場合
				if pattern.select { |n| n == "0111"}
					#hash_scoreのkey0111のvalueに1足す
					 score.store("0111", score["0111"] + 1)
				end
				#配列patternの中に1111がある場合
				if pattern.select { |n| n == "1111"}
					#hash_scoreのkey1111のvalueに1足す
					 score.store("1111", score["1111"] + 1)
				end
				#配列patternの中に2111がある場合
				if pattern.select { |n| n == "2111"}
					#hash_scoreのkey2111のvalueに1足す
					 score.store("2111", score["2111"] + 1)
				end
			end
			#二塁ランナーが得点した場合
			if data["二走状況"] == "本進"
				#配列patternの中に0000がある場合
				if pattern.select { |n| n == "0000"}
					#hash_scoreのkey0000のvalueに1足す
					 score.store("0000", score["0000"] + 1)
				end
				#配列patternの中に1000がある場合
				if pattern.select { |n| n == "1000"}
					#hash_scoreのkey1000のvalueに1足す
					 score.store("1000", score["1000"] + 1)
				end
				#配列patternの中に2000がある場合
				if pattern.select { |n| n == "2000"}
					#hash_scoreのkey2000のvalueに1足す
					 score.store("2000", score["2000"] + 1)
				end
				#配列patternの中に0001がある場合
				if pattern.select { |n| n == "0001"}
					#hash_scoreのkey0000のvalueに1足す
					 score.store("0001", score["0001"] + 1)
				end
				#配列patternの中に1001がある場合
				if pattern.select { |n| n == "1001"}
					#hash_scoreのkey1001のvalueに1足す
					 score.store("1001", score["1001"] + 1)
				end
				#配列patternの中に2001がある場合
				if pattern.select { |n| n == "2001"}
					#hash_scoreのkey2001のvalueに1足す
					 score.store("2001", score["2001"] + 1)
				end
				#配列patternの中に0010がある場合
				if pattern.select { |n| n == "0010"}
					#hash_scoreのkey0010のvalueに1足す
					 score.store("0010", score["0010"] + 1)
				end
				#配列patternの中に1010がある場合
				if pattern.select { |n| n == "1010"}
					#hash_scoreのkey1010のvalueに1足す
					 score.store("1010", score["1010"] + 1)
				end
				#配列patternの中に2010がある場合
				if pattern.select { |n| n == "2010"}
					#hash_scoreのkey2010のvalueに1足す
					 score.store("2010", score["2010"] + 1)
				end
				#配列patternの中に0100がある場合
				if pattern.select { |n| n == "0100"}
					#hash_scoreのkey0100のvalueに1足す
					 score.store("0100", score["0100"] + 1)
				end
				#配列patternの中に1100がある場合
				if pattern.select { |n| n == "1100"}
					#hash_scoreのkey1100のvalueに1足す
					 score.store("1100", score["1100"] + 1)
				end
				#配列patternの中に2100がある場合
				if pattern.select { |n| n == "2100"}
					#hash_scoreのkey2100のvalueに1足す
					 score.store("2100", score["2100"] + 1)
				end
				#配列patternの中に0011がある場合
				if pattern.select { |n| n == "0011"}
					#hash_scoreのkey0011のvalueに1足す
					 score.store("0011", score["0011"] + 1)
				end
				#配列patternの中に1011がある場合
				if pattern.select { |n| n == "1011"}
					#hash_scoreのkey1011のvalueに1足す
					 score.store("1011", score["1011"] + 1)
				end
				#配列patternの中に2011がある場合
				if pattern.select { |n| n == "2011"}
					#hash_scoreのkey2011のvalueに1足す
					 score.store("2011", score["2011"] + 1)
				end
				#配列patternの中に0110がある場合
				if pattern.select { |n| n == "0110"}
					#hash_scoreのkey0110のvalueに1足す
					 score.store("0110", score["0110"] + 1)
				end
				#配列patternの中に1110がある場合
				if pattern.select { |n| n == "1110"}
					#hash_scoreのkey1110のvalueに1足す
					 score.store("1110", score["1110"] + 1)
				end
				#配列patternの中に2110がある場合
				if pattern.select { |n| n == "2110"}
					#hash_scoreのkey2110のvalueに1足す
					 score.store("2110", score["2110"] + 1)
				end
				#配列patternの中に0101がある場合
				if pattern.select { |n| n == "0101"}
					#hash_scoreのkey0101のvalueに1足す
					 score.store("0101", score["0101"] + 1)
				end
				#配列patternの中に1101がある場合
				if pattern.select { |n| n == "1101"}
					#hash_scoreのkey1101のvalueに1足す
					 score.store("1101", score["1101"] + 1)
				end
				#配列patternの中に2101がある場合
				if pattern.select { |n| n == "2101"}
					#hash_scoreのkey2101のvalueに1足す
					 score.store("2101", score["2101"] + 1)
				end
				#配列patternの中に0111がある場合
				if pattern.select { |n| n == "0111"}
					#hash_scoreのkey0111のvalueに1足す
					 score.store("0111", score["0111"] + 1)
				end
				#配列patternの中に1111がある場合
				if pattern.select { |n| n == "1111"}
					#hash_scoreのkey1111のvalueに1足す
					 score.store("1111", score["1111"] + 1)
				end
				#配列patternの中に2111がある場合
				if pattern.select { |n| n == "2111"}
					#hash_scoreのkey2111のvalueに1足す
					 score.store("2111", score["2111"] + 1)
				end
			end
			#三塁ランナーが得点した場合
			if data["三走状況"] == "本進"
				#配列patternの中に0000がある場合
				if pattern.select { |n| n == "0000"}
					#hash_scoreのkey0000のvalueに1足す
					 score.store("0000", score["0000"] + 1)
				end
				#配列patternの中に1000がある場合
				if pattern.select { |n| n == "1000"}
					#hash_scoreのkey1000のvalueに1足す
					 score.store("1000", score["1000"] + 1)
				end
				#配列patternの中に2000がある場合
				if pattern.select { |n| n == "2000"}
					#hash_scoreのkey2000のvalueに1足す
					 score.store("2000", score["2000"] + 1)
				end
				#配列patternの中に0001がある場合
				if pattern.select { |n| n == "0001"}
					#hash_scoreのkey0000のvalueに1足す
					 score.store("0001", score["0001"] + 1)
				end
				#配列patternの中に1001がある場合
				if pattern.select { |n| n == "1001"}
					#hash_scoreのkey1001のvalueに1足す
					 score.store("1001", score["1001"] + 1)
				end
				#配列patternの中に2001がある場合
				if pattern.select { |n| n == "2001"}
					#hash_scoreのkey2001のvalueに1足す
					 score.store("2001", score["2001"] + 1)
				end
				#配列patternの中に0010がある場合
				if pattern.select { |n| n == "0010"}
					#hash_scoreのkey0010のvalueに1足す
					 score.store("0010", score["0010"] + 1)
				end
				#配列patternの中に1010がある場合
				if pattern.select { |n| n == "1010"}
					#hash_scoreのkey1010のvalueに1足す
					 score.store("1010", score["1010"] + 1)
				end
				#配列patternの中に2010がある場合
				if pattern.select { |n| n == "2010"}
					#hash_scoreのkey2010のvalueに1足す
					 score.store("2010", score["2010"] + 1)
				end
				#配列patternの中に0100がある場合
				if pattern.select { |n| n == "0100"}
					#hash_scoreのkey0100のvalueに1足す
					 score.store("0100", score["0100"] + 1)
				end
				#配列patternの中に1100がある場合
				if pattern.select { |n| n == "1100"}
					#hash_scoreのkey1100のvalueに1足す
					 score.store("1100", score["1100"] + 1)
				end
				#配列patternの中に2100がある場合
				if pattern.select { |n| n == "2100"}
					#hash_scoreのkey2100のvalueに1足す
					 score.store("2100", score["2100"] + 1)
				end
				#配列patternの中に0011がある場合
				if pattern.select { |n| n == "0011"}
					#hash_scoreのkey0011のvalueに1足す
					 score.store("0011", score["0011"] + 1)
				end
				#配列patternの中に1011がある場合
				if pattern.select { |n| n == "1011"}
					#hash_scoreのkey1011のvalueに1足す
					 score.store("1011", score["1011"] + 1)
				end
				#配列patternの中に2011がある場合
				if pattern.select { |n| n == "2011"}
					#hash_scoreのkey2011のvalueに1足す
					 score.store("2011", score["2011"] + 1)
				end
				#配列patternの中に0110がある場合
				if pattern.select { |n| n == "0110"}
					#hash_scoreのkey0110のvalueに1足す
					 score.store("0110", score["0110"] + 1)
				end
				#配列patternの中に1110がある場合
				if pattern.select { |n| n == "1110"}
					#hash_scoreのkey1110のvalueに1足す
					 score.store("1110", score["1110"] + 1)
				end
				#配列patternの中に2110がある場合
				if pattern.select { |n| n == "2110"}
					#hash_scoreのkey2110のvalueに1足す
					 score.store("2110", score["2110"] + 1)
				end
				#配列patternの中に0101がある場合
				if pattern.select { |n| n == "0101"}
					#hash_scoreのkey0101のvalueに1足す
					 score.store("0101", score["0101"] + 1)
				end
				#配列patternの中に1101がある場合
				if pattern.select { |n| n == "1101"}
					#hash_scoreのkey1101のvalueに1足す
					 score.store("1101", score["1101"] + 1)
				end
				#配列patternの中に2101がある場合
				if pattern.select { |n| n == "2101"}
					#hash_scoreのkey2101のvalueに1足す
					 score.store("2101", score["2101"] + 1)
				end
				#配列patternの中に0111がある場合
				if pattern.select { |n| n == "0111"}
					#hash_scoreのkey0111のvalueに1足す
					 score.store("0111", score["0111"] + 1)
				end
				#配列patternの中に1111がある場合
				if pattern.select { |n| n == "1111"}
					#hash_scoreのkey1111のvalueに1足す
					 score.store("1111", score["1111"] + 1)
				end
				#配列patternの中に2111がある場合
				if pattern.select { |n| n == "2111"}
					#hash_scoreのkey2111のvalueに1足す
					 score.store("2111", score["2111"] + 1)
				end
			end
			#本塁打を打った時
			if data["打者状況"] == "本進"
				#配列patternの中に0000がある場合
				if pattern.select { |n| n == "0000"}
					#hash_scoreのkey0000のvalueに1足す
					 score.store("0000", score["0000"] + 1)
				end
				#配列patternの中に1000がある場合
				if pattern.select { |n| n == "1000"}
					#hash_scoreのkey1000のvalueに1足す
					 score.store("1000", score["1000"] + 1)
				end
				#配列patternの中に2000がある場合
				if pattern.select { |n| n == "2000"}
					#hash_scoreのkey2000のvalueに1足す
					 score.store("2000", score["2000"] + 1)
				end
				#配列patternの中に0001がある場合
				if pattern.select { |n| n == "0001"}
					#hash_scoreのkey0000のvalueに1足す
					 score.store("0001", score["0001"] + 1)
				end
				#配列patternの中に1001がある場合
				if pattern.select { |n| n == "1001"}
					#hash_scoreのkey1001のvalueに1足す
					 score.store("1001", score["1001"] + 1)
				end
				#配列patternの中に2001がある場合
				if pattern.select { |n| n == "2001"}
					#hash_scoreのkey2001のvalueに1足す
					 score.store("2001", score["2001"] + 1)
				end
				#配列patternの中に0010がある場合
				if pattern.select { |n| n == "0010"}
					#hash_scoreのkey0010のvalueに1足す
					 score.store("0010", score["0010"] + 1)
				end
				#配列patternの中に1010がある場合
				if pattern.select { |n| n == "1010"}
					#hash_scoreのkey1010のvalueに1足す
					 score.store("1010", score["1010"] + 1)
				end
				#配列patternの中に2010がある場合
				if pattern.select { |n| n == "2010"}
					#hash_scoreのkey2010のvalueに1足す
					 score.store("2010", score["2010"] + 1)
				end
				#配列patternの中に0100がある場合
				if pattern.select { |n| n == "0100"}
					#hash_scoreのkey0100のvalueに1足す
					 score.store("0100", score["0100"] + 1)
				end
				#配列patternの中に1100がある場合
				if pattern.select { |n| n == "1100"}
					#hash_scoreのkey1100のvalueに1足す
					 score.store("1100", score["1100"] + 1)
				end
				#配列patternの中に2100がある場合
				if pattern.select { |n| n == "2100"}
					#hash_scoreのkey2100のvalueに1足す
					 score.store("2100", score["2100"] + 1)
				end
				#配列patternの中に0011がある場合
				if pattern.select { |n| n == "0011"}
					#hash_scoreのkey0011のvalueに1足す
					 score.store("0011", score["0011"] + 1)
				end
				#配列patternの中に1011がある場合
				if pattern.select { |n| n == "1011"}
					#hash_scoreのkey1011のvalueに1足す
					 score.store("1011", score["1011"] + 1)
				end
				#配列patternの中に2011がある場合
				if pattern.select { |n| n == "2011"}
					#hash_scoreのkey2011のvalueに1足す
					 score.store("2011", score["2011"] + 1)
				end
				#配列patternの中に0110がある場合
				if pattern.select { |n| n == "0110"}
					#hash_scoreのkey0110のvalueに1足す
					 score.store("0110", score["0110"] + 1)
				end
				#配列patternの中に1110がある場合
				if pattern.select { |n| n == "1110"}
					#hash_scoreのkey1110のvalueに1足す
					 score.store("1110", score["1110"] + 1)
				end
				#配列patternの中に2110がある場合
				if pattern.select { |n| n == "2110"}
					#hash_scoreのkey2110のvalueに1足す
					 score.store("2110", score["2110"] + 1)
				end
				#配列patternの中に0101がある場合
				if pattern.select { |n| n == "0101"}
					#hash_scoreのkey0101のvalueに1足す
					 score.store("0101", score["0101"] + 1)
				end
				#配列patternの中に1101がある場合
				if pattern.select { |n| n == "1101"}
					#hash_scoreのkey1101のvalueに1足す
					 score.store("1101", score["1101"] + 1)
				end
				#配列patternの中に2101がある場合
				if pattern.select { |n| n == "2101"}
					#hash_scoreのkey2101のvalueに1足す
					 score.store("2101", score["2101"] + 1)
				end
				#配列patternの中に0111がある場合
				if pattern.select { |n| n == "0111"}
					#hash_scoreのkey0111のvalueに1足す
					 score.store("0111", score["0111"] + 1)
				end
				#配列patternの中に1111がある場合
				if pattern.select { |n| n == "1111"}
					#hash_scoreのkey1111のvalueに1足す
					 score.store("1111", score["1111"] + 1)
				end
				#配列patternの中に2111がある場合
				if pattern.select { |n| n == "2111"}
					#hash_scoreのkey2111のvalueに1足す
					 score.store("2111", score["2111"] + 1)
				end
				#patternをリセットする
				pattern = []
			end
	#回が継続していた場合 #nowが0000か比較する
		if now == "0000"
			#イニングが始まるのでランナー状況を0000に戻す
	 		now = "0000"
	 		prev = "0000"
	 		pattern = []
	 		#occure_hashのkey0000のvalueに1足す
	 		occur.store("0000", occur["0000"] + 1)
	 		#pattern配列に0000を追加する
	 		pattern.push("0000")
	 #回が継続していた場合 #nowが1000か比較する
	 	elsif now == "1000"
	 		#occure_hashのkey1000のvalueに1足す
	 		occur.store("1000", occur["1000"] + 1)
	 		#pattern配列に0001を追加する
	 		pattern.push("1000")
	 		#変化した状況を更新する
	 		prev = now
	 #回が継続していた場合 #nowが2000か比較する
	 	elsif now == "2000"
	 		#occure_hashのkey2000のvalueに1足す
	 		occur.store("2000", occur["2000"] + 1)
	 		#pattern配列に2000を追加する
	 		pattern.push("2000")
	 		#変化した状況を更新する
	 		prev = now
	 #回が継続していた場合 #nowが0001か比較する
	 	elsif now == "0001"
	 		#occure_hashのkey0001のvalueに1足す
	 		occur.store("0001", occur["0001"] + 1)
	 		#pattern配列に0001を追加する
	 		pattern.push("0001")
	 		#変化した状況を更新する
	 		prev = now
	 #回が継続していた場合 #nowが1001か比較する
	 	elsif now == "1001"
	 		#occure_hashのkey1001のvalueに1足す
	 		occur.store("1001", occur["1001"] + 1)
	 		#pattern配列に1001を追加する
	 		pattern.push("1001")
	 		#変化した状況を更新する
	 		prev = now
	 #回が継続していた場合 #nowが2001か比較する
	 	elsif now == "2001"
	 		#occure_hashのkey2001のvalueに1足す
	 		occur.store("2001", occur["2001"] + 1)
	 		#pattern配列に2001を追加する
	 		pattern.push("2001")
	 		#変化した状況を更新する
	 		prev = now
	 #回が継続していた場合 #nowが0010か比較する
	 	elsif now == "0010"
	 		#occure_hashのkey0010のvalueに1足す
	 		occur.store("0010", occur["0010"] + 1)
	 		#pattern配列に0010を追加する
	 		pattern.push("0010")
	 		#変化した状況を更新する
	 		prev = now
	 #回が継続していた場合 #nowが1010か比較する
	 	elsif now == "1010"
	 		#occure_hashのkey1010のvalueに1足す
	 		occur.store("1010", occur["1010"] + 1)
	 		#pattern配列に1010を追加する
	 		pattern.push("1010")
	 		#変化した状況を更新する
 			prev = now
	 #回が継続していた場合 #nowが2010か比較する
	 	elsif now == "2010"
	 		#occure_hashのkey2010のvalueに1足す
	 		occur.store("2010", occur["2010"] + 1)
	 		#pattern配列に2010を追加する
	 		pattern.push("2010")
	 		#変化した状況を更新する
	 		prev = now
	 #回が継続していた場合 #nowが0100か比較する
	 	elsif now == "0100"
	 		#occure_hashのkey0100のvalueに1足す
	 		occur.store("0100", occur["0100"] + 1)
	 		#pattern配列に0100を追加する
	 		pattern.push("0100")
	 		#変化した状況を更新する
	 		prev = now
	 #回が継続していた場合 #nowが1100か比較する
	 	elsif now == "1100"
	 		#occure_hashのkey1100のvalueに1足す
	 		occur.store("1100", occur["1100"] + 1)
	 		#pattern配列に1100を追加する
	 		pattern.push("1100")
	 		#変化した状況を更新する
	 		prev = now
	#回が継続していた場合 #nowが2100か比較する
		elsif now == "2100"
			#occure_hashのkey2100のvalueに1足す
	 		occur.store("2100", occur["2100"] + 1)
	 		#pattern配列に2100を追加する
	 		pattern.push("2100")
	 		#変化した状況を更新する
	 		prev = now
	#回が継続していた場合 #nowが0011か比較する
		elsif now == "0011"
			#occure_hashのkey0011のvalueに1足す
			occur.store("0011", occur["0011"] + 1)
			#pattern配列に0011を追加する
			pattern.push("0011")
			#変化した状況を更新する
			prev = now
			#回が継続していた場合 #nowが1011か比較する
		elsif now == "1011"
			#occure_hashのkey1011のvalueに1足す
			occur.store("1011", occur["1011"] + 1)
			#pattern配列に1011を追加する
			pattern.push("1011")
			#変化した状況を更新する
			prev = now
	#回が継続していた場合 #nowが2011か比較する
		elsif now == "2011"
			#occure_hashのkey2011のvalueに1足す
			occur.store("2011", occur["2011"] + 1)
			#pattern配列に2011を追加する
			pattern.push("2011")
			#変化した状況を更新する
			prev = now
	#回が継続していた場合 #nowが0110か比較する
		elsif now == "0110"
			#occure_hashのkey0110のvalueに1足す
			occur.store("0110", occur["0110"] + 1)
			#pattern配列に0110を追加する
			pattern.push("0110")
			#変化した状況を更新する
			prev = now
	#回が継続していた場合 #nowが1110か比較する
		elsif now == "1110"
			#occure_hashのkey1110のvalueに1足す
			occur.store("1110", occur["1110"] + 1)
			#pattern配列に1110を追加する
			pattern.push("1110")
			#変化した状況を更新する
			prev = now
	#回が継続していた場合 #nowが2110か比較する
		elsif now == "2110"
			#occure_hashのkey2110のvalueに1足す
			occur.store("2110", occur["2110"] + 1)
			#pattern配列に2110を追加する
			pattern.push("2110")
			#変化した状況を更新する
			prev = now
	#回が継続していた場合 #nowが0101か比較する
		elsif now == "0101"
			#occure_hashのkey0101のvalueに1足す
			occur.store("0101", occur["0101"] + 1)
			#pattern配列に0101を追加する
			pattern.push("0101")
			#変化した状況を更新する
			prev = now
	#回が継続していた場合 #nowが1101か比較する
		elsif now == "1101"
			#occure_hashのkey1101のvalueに1足す
			occur.store("1101", occur["1101"] + 1)
			#pattern配列に1101を追加する
			pattern.push("1101")
			#変化した状況を更新する
			prev = now
	#回が継続していた場合 #nowが2101か比較する
		elsif now == "2101"
			#occure_hashのkey2101のvalueに1足す
			occur.store("2101", occur["2101"] + 1)
			#pattern配列に2101を追加する
			pattern.push("2101")
			#変化した状況を更新する
			prev = now
	#回が継続していた場合 #nowが0111か比較する
		elsif now == "0111"
			#occure_hashのkey0111のvalueに1足す
			occur.store("0111", occur["0111"] + 1)
			#pattern配列に0111を追加する
			pattern.push("0111")
			#変化した状況を更新する
			prev = now
	#回が継続していた場合 #nowが1111か比較する
		elsif now == "1111"
			#occure_hashのkey1111のvalueに1足す
			occur.store("1111", occur["1111"] + 1)
			#pattern配列に1111を追加する
			pattern.push("1111")
			#変化した状況を更新する
			prev = now
	#回が継続していた場合 #nowが2111か比較する
		elsif now == "2111"
			#occure_hashのkey2111のvalueに1足す
			occur.store("2111", occur["2111"] + 1)
			#pattern配列に2111を追加する
			pattern.push("2111")
			#変化した状況を更新する
			prev = now
		end

	end

end

p score
