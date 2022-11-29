//
//  ContentView.swift
//  iExpense
//
//  Created by Berkay Sancar on 29.11.2022.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel = MainViewModel()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.items) { item in
                    HStack {
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text(item.type)
                        }
                        
                        Spacer()
                        
                        Text(item.amount, format: .currency(code: "USD"))
                    }
                   
                }
                .onDelete(perform: viewModel.removeObject)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button {
                    showingAddExpense = true
                } label: {
                     Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(viewModel: self.viewModel)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
