//
//  SettingView.swift
//  MovieApp
//
//  Created by Khalil-Mhelheli on 19/6/2022.
//

import SwiftUI

struct SettingView: View {
    
    @Binding var isPresented: Bool
    
    @State private var selection = 1
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Picker(selection: $selection) {
                        Text("Action").tag(1)
                        Text("Comedy").tag(2)
                        Text("Horror").tag(3)
                    } label: {
                        Text("Favourite Genre")
                    }
                }
                Button {
                    isPresented.toggle()
                } label: {
                    Text("Save")
                }
            }
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(isPresented: .constant(false))
    }
}
