//
//  ContentView.swift
//  MasterDetailOnSwiftUI
//
//  Created by m-ishiyama on 2020/12/28.
//

// display master(left table)

import SwiftUI

struct MasterDetail1View: View {
    @State private var fruits = ["Apple", "Banana", "Cherry", "Dragon Fruit"]
    @State private var selectedFruit = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                        .onTapGesture {
                            self.selectedFruit = fruit
                    }
                }
                .onAppear {
                    self.selectedFruit = "Apple"
                }
            }
            // 2カラムで良いのでナビゲーションバーは非表示
            .navigationBarHidden(true)
        }
   }
}

struct MasterDetail1View_Previews: PreviewProvider {
    static var previews: some View {
        MasterDetail1View()
            .previewLayout(.fixed(width: 1024, height: 768))
    }
}
