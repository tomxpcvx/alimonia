//
//  MealView.swift
//  alimonia
//
//  Created by Tom Pietsch on 28.01.21.
//

import SwiftUI

struct MealView: View {
    @State private var showingAlert = false
    @Binding var showingDetail: Bool
    @Binding var meals: Array<String>
    var body: some View {
        NavigationView {
            Button("Show Alert") {
                self.showingAlert = true
                self.meals.append("Keks")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Mahlzeit hinzugefügt!"), message: Text("Der Eintrag wurde angelegt."), dismissButton: .default(Text("OK")))
            }
            .navigationBarTitle(Text("Sheet View"), displayMode: .inline)
            .navigationBarItems(trailing: Button(action: {
                print("Dismissing sheet view...")
                self.showingDetail = false
            }) {
                Text("Done").bold()
            })
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(showingDetail: .constant(false), meals: .constant(["1", "2"]))
    }
}

