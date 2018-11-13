require 'csv'

#csvのデータを読み込む
csv_data = CSV.read('gamedata.csv', headers: true)
puts "start..."

#score,occurはhash(keyを24パターン　valueを0とする)をpatternは配列を作る
score = {"0000" => 0, "1000" => 0, "2000" => 0, "0001" => 0, "1001" => 0, "2001" => 0, "0010" => 0, "1010" => 0, "2010" => 0, "0100" => 0, "1100" => 0, "2100" => 0, "0011" => 0, "1011" => 0, "2011" => 0, "0110" => 0, "1110" => 0, "2110" => 0, "0101" => 0, "1101" => 0, "2101" => 0, "0111" => 0, "1111" => 0, "2111" => 0 }

occur = {"0000" => 0, "1000" => 0, "2000" => 0, "0001" => 0, "1001" => 0, "2001" => 0, "0010" => 0, "1010" => 0, "2010" => 0, "0100" => 0, "1100" => 0, "2100" => 0, "0011" => 0, "1011" => 0, "2011" => 0, "0110" => 0, "1110" => 0, "2110" => 0, "0101" => 0, "1101" => 0, "2101" => 0, "0111" => 0, "1111" => 0, "2111" => 0 }

pattern = [0000]

#状況が変化したかどうかの判断材料にするためnow,prevとし定義する
now = '0000'
prev = '0000'

#csvのファイルを読み込みデータを回す
csv_data.each do |data|

#それぞれのデータと照合して数値を代入する
	  out　= data["out"]

		if data["一走打順"] == "0"
			runners1 = 0
		else
			runners1 = 1
		end

		if data["二走打順"] == "0"
			runners2 = 0
		else
			runners2 = 1
		end

		if data["三走打順"] == "0"
			runners3 = 0
		else
			runners3 = 1
		end

#数値に置き換えたものを順に並べる
    now = out + runners3.to_s + runners2.to_s + runners1.to_s

#状況が変わった場合
	if now != prev

#得点が入った場合
		if data["一走状況"] == "1" || data["二走状況"] == "1" || data["三走状況"] == "1"
			#一塁ランナーが得点した場合
			if data["一走状況"] == "1"
				#配列patternの中に0000がある場合
				if pattern == "0000"
					#hash_scoreのkey0000のvalueに1足す
					 score.store("0000", +1)
				end
			end
			if data["二走状況"] == "1"
				if pattern == "0000"
						score.store("0000", +1)
				end
			end
			if data["三走状況"] == "1"
				if pattern == "0000"
						score.store("0000", +1)
				end
			end
			#patternをリセットする
			pattern = []
#回が継続していた場合
		elsif
			#nowが0000か比較する
			if now == 00000
			#occure_hashのkey0000のvalueに1足す
			occure.store("0000", +1)
			#pattern配列に0000を追加する
			pattern.push("0000")
			end
#回が終了していた場合
		else
			pattern = []

		end

	end
end
