//
//  MasterDetail2View.swift
//  MasterDetailOnSwiftUI
//
//  Created by m-ishiyama on 2020/12/28.
//

// Color Selected Cell

import SwiftUI

struct MasterDetail2View: View {
    @State private var fruits = ["Apple", "Banana", "Cherry", "Dragon Fruit"]
    @State private var selectedFruit = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    // テキスト以外の部分（セル全体）も含めてひとつの表示領域にする。
                    HStack{
                        Text(fruit)
                        Spacer()
                    }
                    // 形状を矩形全体とする。
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.selectedFruit = fruit
                    }
                    // 選択セル色を付ける
                    .listRowBackground(self.selectedFruit == fruit ? Color.gray.opacity(0.25) : Color.clear)
                }
                .onAppear {
                    self.selectedFruit = "Apple"
                }
            }
            .navigationBarHidden(true)
        }
    }
}

struct MasterDetail2View_Previews: PreviewProvider {
    static var previews: some View {
        MasterDetail2View()
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}

