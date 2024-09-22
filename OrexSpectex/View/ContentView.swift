//
//  ContentView.swift
//  OrexSpectex
//
//  Created by admin on 21/9/2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ContentViewModel()
    var body: some View {
        switch viewModel.appState {
        case .unauthorized:
            RegistriesView()
                .environmentObject(viewModel)
        case .authorized(let id):
            let viewModel = HomeViewModel(userId: id)
            HomeView(viewModel: viewModel)
                .environmentObject(self.viewModel)
        }
    }
}

#Preview {
    ContentView()
}
