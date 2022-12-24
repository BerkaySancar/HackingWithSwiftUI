//
//  ContentView.swift
//  SnowSeeker
//
//  Created by Berkay Sancar on 20.12.2022.
//

import SwiftUI

struct MainView: View {
    
    @State private var resorts: [Resort] = Bundle.main.decode("resorts.json")
    
    @State private var searchText = ""
    
    @StateObject private var favorites = Favorites()

    private var filteredResorts: [Resort] {
        if searchText.isEmpty {
            return resorts
        } else {
            return resorts.filter { $0.name.localizedCaseInsensitiveContains(searchText)}
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredResorts) { resort in
                NavigationLink {
                    ResortView(resort: resort)
                } label: {
                    HStack {
                        Image(resort.country)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(Capsule())
                            .overlay(Capsule()
                                .stroke(.black, lineWidth: 1))
                        
                        VStack(alignment: .leading) {
                            Text(resort.name)
                                .font(.headline)
                            Text("\(resort.runs) runs")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(resort) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite resort.")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Resorts")
            .searchable(text: $searchText, prompt: "Search for a resort")
            
            WelcomeView()
        }
        .environmentObject(favorites)
        .phoneOnlyNavigationView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
