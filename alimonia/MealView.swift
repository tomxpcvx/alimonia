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
                self.meals.append("Essen")
            }
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Mahlzeit hinzugefügt!"), message: Text("Der Eintrag wurde angelegt."), dismissButton: .default(Text("OK")))
            }
            .navigationBarTitle(Text("Neue Mahlzeit"), displayMode: .inline)
            .navigationBarItems(
                leading: Button("Abbrechen"){
                    self.showingDetail = false
                },
                trailing: Button("Hinzufügen") {
                    self.showingDetail = false
                    self.meals.append("Essen")
                }
            )
        }
    }
}

struct MealView_Previews: PreviewProvider {
    static var previews: some View {
        MealView(showingDetail: .constant(false), meals: .constant(["Essen 1", "Essen 2"]))
    }
}

