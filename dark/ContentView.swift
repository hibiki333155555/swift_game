import SwiftUI

struct ContentView: View {
    
    @State private var showStatusBars = false
    @State private var isBattleViewPresented = false
    
    
    @State private var hpValue = 1
    @State private var strengthValue = 1
    @State private var agilityValue = 1
    @State private var intelligenceValue = 1
    
    var body: some View {
        
        ZStack {
            
            // 背景画像
            Image("bg")
                .resizable()
                .scaledToFit()
                .scaleEffect(2.3)
                .ignoresSafeArea()
            
            // ステータスバーのビュー
            if showStatusBars {
                StatusBarsView(hpValue: $hpValue, strengthValue: $strengthValue, agilityValue: $agilityValue, intelligenceValue: $intelligenceValue) // ステータスバーのビューを定義する
                    .transition(.move(edge: .leading)) // 左側からのスライドイン
                    .animation(.easeInOut, value: showStatusBars) // アニメーションの適用
            }

            
            // 画面の右側にボタンを縦並びに配置
            HStack {
                Spacer() // 左側に余白を追加してボタンを右側に寄せる
                VStack(spacing: 20) { // ボタン間のスペース
                    // Startボタン
                    Button(action: {
                        isBattleViewPresented.toggle()
                        // Startボタンのアクション
                        print("Start tapped")
                    }) {
                        Text("GAME START")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                            .fullScreenCover(isPresented: $isBattleViewPresented){
                                BattleView(hpValue: $hpValue, strengthValue: $strengthValue, agilityValue: $agilityValue, intelligenceValue: $intelligenceValue) // ボタンを押した後に表示するビューを指定
                            }
                    }
                    .padding(.bottom, 20)
                    
                    // Level Upボタン
                    Button(action: {
                        // Level Upボタンのアクション
                        print("Level Up tapped")
                        withAnimation {
                            showStatusBars.toggle() // ステータスバーの表示をトグルする
                        }
                    }) {
                        Text("LEVEL UP")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.yellow)
                            .padding(.vertical, 10)
                            .padding(.horizontal, 20)
                            .background(Color.black.opacity(0.8))
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
                .padding(.trailing, 20) // 右側の余白を調整
            }
        }
    }
}

// ステータスバーのビューを定義
struct StatusBarsView: View {
    
    @Binding var hpValue: Int
    @Binding var strengthValue: Int
    @Binding var agilityValue: Int
    @Binding var intelligenceValue: Int
    
    var body: some View {
        HStack {
            VStack {
                // ここにステータスバーの詳細なビューを追加します
                Button(action: {
                    // ボタンがクリックされたときのアクションをここに追加
                    hpValue = hpValue + 1
                }) {
                    Text("HP: \(hpValue)")
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 40) // ステータスボタンのサイズを適宜調整
                .background(Color.black.opacity(0.9))
                .cornerRadius(10)
                .padding()
                
                Button(action: {
                    // Strengthボタンがクリックされたときのアクション
                    strengthValue = strengthValue + 1
                }) {
                    Text("Strength: \(strengthValue)")
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 40)
                .background(Color.black.opacity(0.9))
                .cornerRadius(10)
                .padding()

                Button(action: {
                    // Agilityボタンがクリックされたときのアクション
                    agilityValue = agilityValue + 1
                }) {
                    Text("Agility: \(agilityValue)")
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 40)
                .background(Color.black.opacity(0.9))
                .cornerRadius(10)
                .padding()

                Button(action: {
                    // Intelligenceボタンがクリックされたときのアクション
                    intelligenceValue = intelligenceValue + 1
                }) {
                    Text("Intelligence: \(intelligenceValue)")
                        .foregroundColor(.white)
                }
                .frame(width: 200, height: 40)
                .background(Color.black.opacity(0.9))
                .cornerRadius(10)
                .padding()
            }
            .frame(width: 200) // ステータスバーの幅を適宜調整
            .background(Color.black.opacity(0.9))
            .cornerRadius(10)
            .padding()
            Spacer()
        }
    }
}

struct BattleView: View {
    
    
    @Binding var hpValue: Int
    @Binding var strengthValue: Int
    @Binding var agilityValue: Int
    @Binding var intelligenceValue: Int
    
    @State private var enemyHP = 100
    @State private var enemyStrength = 50
    
    @State private var isGameOver = false
    
    var body: some View {
        ZStack {
            VStack {
                
        
                Image("battle")
                    .resizable()
                    .scaledToFit()
                    .scaleEffect(2.0)
                    .ignoresSafeArea()
        
               Text("Enemy HP: \(enemyHP)")
                   .foregroundColor(.white)
                   .frame(width: 200, height: 30)
                   .background(Color.red.opacity(0.9))
                   .cornerRadius(10)
                   .padding()
                
                    
                
            }
            
            if isGameOver {
                Color.black.opacity(0.8) // 背景に半透明の黒を被せる
                    .ignoresSafeArea()
                
                Text("Game Over")
                    .font(.largeTitle)
                    .foregroundColor(.red)
                    .padding(.top, 50)
            }
            
            HStack {
                Spacer()
                
                // アタックボタン
                Button(action: {
                    enemyHP = enemyHP - strengthValue
                    hpValue = hpValue - enemyStrength
                    // アタックボタンがクリックされたときのアクションをここに追加
                    
                    if hpValue <= 0 {
                        isGameOver = true
                    }
                }) {
                    Text("Attack")
                        .foregroundColor(.white)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 20)
                        .background(Color.clear)
                        .cornerRadius(10)
                }
                
                VStack{
                    
                    Text("YourSTR: \(strengthValue)")
                    Text("YourHP: \(hpValue)")
                }
            }
        }
            
        
    }
}


#Preview {
    ContentView()
}
