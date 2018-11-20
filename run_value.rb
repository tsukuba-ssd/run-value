require 'csv'

#csvのデータを読み込む
csv_data = CSV.read('gamedata.run_value.csv', headers: true)

#24パターンの得点期待値
ex = {"0000" => 0.310, "1000" => 0.164, "2000" => 0.062, "0001" => 0.579, "1001" => 0.337, "2001" => 0.149, "0010" => 0.804, "1010" => 0.532, "2010" => 0.276, "0100" => 1.179, "1100" => 0.821, "2100" => 0.349, "0011" => 1.322, "1011" => 0.772, "2011" => 0.258, "0110" => 1.095, "1110" => 1.133, "2110" => 0.509, "0101" => 1.227, "1101" => 0.919, "2101" => 0.430, "0111" => 1.625, "1111" => 1.352, "2111" => 0.612 }
#各イベントの総数
ivent = {"単打" => 0, "二塁打" => 0, "三塁打" => 0, "本塁打" => 0, "凡打死" => 0, "凡打出塁" => 0, "空振り三振" => 0, "見逃し三振" => 0, "三振" => 0, "四球" => 0, "死球" => 0, "犠打" => 0, "犠飛" => 0}
#各イベントの合計値
total = {"単打" => 0, "二塁打" => 0, "三塁打" => 0, "本塁打" => 0, "凡打死" => 0, "凡打出塁" => 0, "空振り三振" => 0, "見逃し三振" => 0, "三振" => 0, "四球" => 0, "死球" => 0, "犠打" => 0, "犠飛" => 0}
#アウト、出塁をどうするか

#状況が変化したかどうかの判断材料にするためnow,prevとし定義する
now = "0000"
prev = "0000"
#得点の合計値として文字を置く
x = 0
#状況が変わった前のイベントの得点期待値を求めるため、保存する配列を作る
pattern = []
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

	if data['一走打順'] == '0'
		runners1 = 0
	else
		runners1 = 1
	end

	if data['二走打順'] == '0'
		runners2 = 0
	else
		runners2 = 1
	end

	if data['三走打順'] == '0'
		runners3 = 0
	else
		runners3 = 1
	end

	#数値に置き換えたものを文字列として順に並べる
 	now = out.to_s + runners3.to_s + runners2.to_s + runners1.to_s

	#状況が変化した時
	if now != prev
		if pattern.include?("単打")
			#単打の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の単打の合計値に加える
			total.store("単打", total["単打"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("二塁打")
			#二塁打の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の二塁打の合計値に加える
			total.store("二塁打", total["二塁打"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("三塁打")
			#三塁打の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の三塁打の合計値に加える
			total.store("三塁打", total["三塁打"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("本塁打")
			#単打の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の本塁打の合計値に加える
			total.store("本塁打", total["本塁打"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("凡打死")
			#凡打死の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の凡打死の合計値に加える
			total.store("凡打死", total["凡打死"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("凡打出塁")
			#凡打出塁の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の凡打出塁の合計値に加える
			total.store("凡打出塁", total["凡打出塁"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("空振り三振")
			#空振り三振の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の空振り三振の合計値に加える
			total.store("空振り三振", total["空振り三振"] + y)
			total.store("三振", total["三振"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("見逃し三振")
			#見逃し三振の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の見逃し三振の合計値に加える
			total.store("見逃し三振", total["見逃し三振"] + y)
			total.store("三振", total["三振"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("四球")
			#四球の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の四球の合計値に加える
			total.store("四球", total["四球"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("死球")
			#死球の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の死球の合計値に加える
			total.store("死球", total["死球"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("犠打")
			#犠打の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の犠打の合計値に加える
			total.store("犠打", total["犠打"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
		if pattern.include?("犠飛")
			#犠飛の得点価値を求める
			y = ex[now] + x - ex[prev]
			#イベント項目の犠飛の合計値に加える
			total.store("犠飛", total["犠飛"] + y)
			x = 0
			y = 0
			prev = now
			pattern = []
		end
	end
		#打者結果に単打があった時
		if data["打撃結果"] == "単打"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に単打の回数を追加する
			ivent.store("単打", ivent["単打"] + 1)
		end
		#打者結果に二塁打があった時
		if data["打撃結果"] == "二塁打"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			ivent.store("二塁打", ivent["二塁打"] + 1)
		end
		#打者結果に三塁打があった時
		if data["打撃結果"] == "三塁打"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に三塁打の回数を追加する
			ivent.store("三塁打", ivent["三塁打"] + 1)
		end
		#打者結果に本塁打があった時
		if data["打撃結果"] == "本塁打"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に本塁打の回数を追加する
			ivent.store("本塁打", ivent["本塁打"] + 1)
		end
		#打者結果に凡打死があった時
		if data["打撃結果"] == "凡打死"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に凡打死の回数を追加する
			ivent.store("凡打死", ivent["凡打死"] + 1)
		end
		#打者結果に凡打出塁があった時
		if data["打撃結果"] == "凡打出塁"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に凡打出塁の回数を追加する
			ivent.store("凡打出塁", ivent["凡打出塁"] + 1)
		end
		#打者結果に空振り三振があった時
		if data["打撃結果"] == "空振り三振"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に単打の回数を追加する
			ivent.store("空振り三振", ivent["空振り三振"] + 1)
			ivent.store("三振", ivent["三振"] + 1)
		end
		#打者結果に見逃し三振があった時
		if data["打撃結果"] == "見逃し三振"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に見逃し三振の回数を追加する
			ivent.store("見逃し三振", ivent["見逃し三振"] + 1)
			ivent.store("三振", ivent["三振"] + 1)
		end
		#打者結果に四球があった時
		if data["打撃結果"] == "四球"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に四球の回数を追加する
			ivent.store("四球", ivent["四球"] + 1)
		end
		#打者結果に死球があった時
		if data["打撃結果"] == "死球"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に死球の回数を追加する
			ivent.store("死球", ivent["死球"] + 1)
		end
		#打者結果に犠打があった時
		if data["打撃結果"] == "犠打"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に単打の回数を追加する
			ivent.store("犠打", ivent["犠打"] + 1)
		end
		#打者結果に犠飛があった時
		if data["打撃結果"] == "犠飛"
			#得点がいくつか順に数える
			if data["一走状況"] == "1"
				x = x + 1
			end
			if data["二走状況"] == "1"
				x = x + 1
			end
			if data["三走状況"] == "1"
				x = x + 1
			end
			if data["打者状況"] == "1"
				x = x + 1
			end
			#イベントの項目に犠飛の回数を追加する
			ivent.store("犠飛", ivent["犠飛"] + 1)
		end
		#打者結果に四球があった時
		if data["打撃結果"] == "四球"
			#pattern配列に四球を追加する
			pattern.push("四球")
		end
		#打者結果に凡打死があった時
		if data["打撃結果"] == "凡打死"
			#pattern配列に凡打死を追加する
			pattern.push("凡打死")
		end
		#打者結果に単打があった時
		if data["打撃結果"] == "単打"
			#pattern配列に単打を追加する
			pattern.push("単打")
		end
		#打者結果に二塁打があった時
		if data["打撃結果"] == "二塁打"
			#pattern配列に凡打死を追加する
			pattern.push("二塁打")
		end
		#打者結果に三塁打があった時
		if data["打撃結果"] == "三塁打"
			#pattern配列に三塁打を追加する
			pattern.push("三塁打")
		end
		#打者結果に本塁打があった時
		if data["打撃結果"] == "本塁打"
			#pattern配列に本塁打を追加する
			pattern.push("本塁打")
		end
		#打者結果に凡打出塁があった時
		if data["打撃結果"] == "凡打出塁"
			#pattern配列に凡打出塁を追加する
			pattern.push("凡打出塁")
		end
		#打者結果に死球があった時
		if data["打撃結果"] == "死球"
			#pattern配列に死球を追加する
			pattern.push("死球")
		end
		#打者結果に空振り三振があった時
		if data["打撃結果"] == "空振り三振"
			#pattern配列に空振り三振を追加する
			pattern.push("空振り三振")
		end
		#打者結果に見逃し三振があった時
		if data["打撃結果"] == "見逃し三振"
			#pattern配列に見逃し三振を追加する
			pattern.push("見逃し三振")
		end
		#打者結果に犠飛があった時
		if data["打撃結果"] == "犠飛"
			#pattern配列に犠飛を追加する
			pattern.push("犠飛")
		end
		#打者結果に犠打があった時
		if data["打撃結果"] == "犠打"
			#pattern配列に犠打を追加する
			pattern.push("犠打")
		end

end
 # p total
 # p ivent
  puts ((total["単打"] / ivent["単打"].to_f).round(3))
  puts ((total["二塁打"] / ivent["二塁打"].to_f).round(3))
  puts ((total["三塁打"] / ivent["三塁打"].to_f).round(3))
  puts ((total["本塁打"] / ivent["本塁打"].to_f).round(3))
  puts ((total["凡打死"] / ivent["凡打死"].to_f).round(3))
  puts ((total["凡打出塁"] / ivent["凡打出塁"].to_f).round(3))
  puts ((total["空振り三振"] / ivent["空振り三振"].to_f).round(3))
  puts ((total["見逃し三振"] / ivent["見逃し三振"].to_f).round(3))
  puts ((total["三振"] / ivent["三振"].to_f).round(3))
  puts ((total["四球"] / ivent["四球"].to_f).round(3))
  puts ((total["死球"] / ivent["死球"].to_f).round(3))
  puts ((total["犠打"] / ivent["犠打"].to_f).round(3))
  puts ((total["犠飛"] / ivent["犠飛"].to_f).round(3))
