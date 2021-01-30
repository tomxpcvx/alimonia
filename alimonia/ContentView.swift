//
//  ContentView.swift
//  alimonia
//
//  Created by Tom Pietsch on 26.01.21.
//

import SwiftUI

struct ContentView: View {
    @State var showingDetail = false
    @State var meals: Array<String> = ["Keks", "Eierkuchen", "Nudeln"]
    var body: some View {
        NavigationView {
            VStack (alignment: .leading) {
                ForEach(meals, id: \.self) { meal in
                    VStack (alignment: .leading, spacing: 5) {
                        HStack {
                            Text (meal)
                            Spacer()
                        }
                        .font(Font.largeTitle.bold())
                        .foregroundColor(.green)
                        
                        HStack {
                            Text ("Hier könnte ihr Text stehen.")
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color (UIColor.secondarySystemGroupedBackground))
                    .cornerRadius(16)
                }
                Spacer()
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
                .background(Color (UIColor.systemGroupedBackground))
            .navigationBarTitle("Mahlzeiten")
            .navigationBarItems(trailing: Button(action: {
                self.showingDetail.toggle()
            }) {
                Image(systemName: "plus.circle").imageScale(.large)
            }.sheet(isPresented: $showingDetail) {
                MealView(
                    showingDetail: self.$showingDetail,
                    meals: self.$meals
                )
            }
            )
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
