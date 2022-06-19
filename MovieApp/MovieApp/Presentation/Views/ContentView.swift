//
//  ContentView.swift
//  MovieApp
//
//  Created by Khalil-Mhelheli on 31/5/2022.
//

import SwiftUI
import Combine

struct ContentView: View {
    
    @State private var showSettings = false
    
    
    var body: some View {
        
        NavigationView {
            Group {
                HomeTabView()
            }
            .navigationBarTitle("Movies", displayMode: .automatic)
            .navigationBarItems(trailing: VStack {
                settingButton
            })
            .sheet(isPresented: $showSettings) {
                SettingView(isPresented: $showSettings)
            }
        }
        
    }
    
    private var settingButton: some View {
        Button {
            showSettings.toggle()
        } label: {
            HStack {
                Image(systemName: "gear")
                    .imageScale(.large)
                    .foregroundColor(.gray)
            }
            .frame(width: 30, height: 30)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
