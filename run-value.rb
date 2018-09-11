require 'csv'

#csvのデータを読み込む
csv_data = CSV.read('gamedata.csv', headers: true)
puts "start..."

#result,runners,situationの配列を作る
results = []
runners = []
situation = []

#状況24パターンを数値で表記して名前をnow,prevとし定義する
now = '0000'
prev = '0000'

#csvのファイルを読み込みデータを回す
csv_data.each do |data|

#それぞれのデータと照合して数値を代入する
	  out      = data["out"]
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

		#puts now

#状況が変わった場合を想定
    if now != prev

#配列runnersに現在の状況を保存
    	runners.push(now)

#配列situationに現在の状況を蓄積する
        situation[now]++

#得点がが入った場合
    if isChangerun() then

#何点入ったのかを確認
     runners.each do |runner|
     runners1 = data['一走状況'] == '本進' ? '1' : '0'
     runners2 = data['二走状況'] == '本進' ? '1' : '0'
     runners3 = data['三走状況'] == '本進' ? '1' : '0'

#得点を足し合わせたいが変数ではなく文字のため並ぶだけになるのでは？
    　rusults[runner] += data['本進']
     end
    end


#イニングが終了した場合
    if data['イニング継続'] == 'イニング完了' then

#配列runnersを空にする
			 runners = []
    end

#状況をリセットする
    prev = now

end

puts results
puts situation

	#puts results[0000]/situation[0000]
end
