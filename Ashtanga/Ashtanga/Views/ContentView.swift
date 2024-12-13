//
//  ContainerView.swift
//  Ashtanga
//
//  Created by Luca Langella 1 on 09/12/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            AshtangaView ()
            .tabItem {
                    Image("Guru")
                    Text("Ashtanga")
                            }

            AsanaView ()
            .tabItem {
                    Image(systemName:"figure.yoga")
                    Text("Asana")
                            }
        }
    }
}

#Preview {
    ContentView()
}
