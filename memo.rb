require "csv"

# メモ新規作成処理
def make_memo
  
  puts "拡張子を除いたファイル名を入力してください"
  
  fileName = gets.chomp.to_s
  
  puts "メモしたい内容を記入してください"
  puts "入力が完了したらCtrl+Dを押してください"
  
  CSV.open(fileName + ".csv", 'w') do |csv|
    
    memos = STDIN.read.chomp
    csv << [memos]
  
  end

  puts "メモを保存しました"
  
end

# 既存メモ編集処理
def edit_memo
  
  puts "拡張子を除いたファイル名を入力してください"
  
  fileName = gets.chomp.to_s
  
  if File.exist?(fileName + ".csv")
  
    puts "編集が完了したらCtrl+Dを押してください"
  
    CSV.open(fileName + ".csv", 'a') do |csv|
    
      memos = STDIN.read.chomp
      csv << [memos]
    
    end
    
    puts "編集内容を保存しました"
    
    return
    
  end
  
  puts "ファイル名が存在しません"
  return
  
end



loop {  
  
  puts "1(新規でメモを作成)2（既存のメモを編集する）3（処理を終了する）"
  
  memo_type = gets.chomp.to_i

  if memo_type == 1
  
    make_memo
  
  elsif memo_type == 2

    edit_memo
   
  elsif memo_type == 3
    
    puts "処理を終了しました"
    break
  
  else
  
    puts "1〜３を入力してください"

  end
}
