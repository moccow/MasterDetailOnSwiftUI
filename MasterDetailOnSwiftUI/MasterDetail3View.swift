//
//  MasterDetail3View.swift
//  MasterDetailOnSwiftUI
//
//  Created by m-ishiyama on 2020/12/28.
//

// Display Detail

import SwiftUI

struct MasterDetail3View: View {
    @State private var fruits = ["Apple", "Banana", "Cherry", "Dragon Fruit"]
    @State private var selectedFruit = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    HStack{
                        Text(fruit)
                        Spacer()
                    }
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.selectedFruit = fruit
                    }
                    .listRowBackground(self.selectedFruit == fruit ? Color.gray.opacity(0.25) : Color.clear)
                }
                .onAppear {
                    self.selectedFruit = "Apple"
                }
            }
            .navigationBarHidden(true)
            // セルの表示形式を横幅いっぱいにする
//            .listStyle(PlainListStyle())

            // Listと同じ階層にDetailを配置する
            Detail(title: selectedFruit)
        }
    }
}

struct Detail: View {
    let title: String
    var body: some View {
        Text("\(self.title)").font(.system(size: 50)).frame(maxWidth: .infinity)
    }
}

struct MasterDetail3View_Previews: PreviewProvider {
    static var previews: some View {
        MasterDetail3View()
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
