//
//  ContentView.swift
//  MVVMExample
//
//  Created by Isaac Iniongun on 19/04/2023.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = ProductListViewModel(webservice: Webservice())
    @EnvironmentObject private var storeModel: StoreModel
    
    var body: some View {
        List(storeModel.products) { product in
            Text(product.title)
            Text(product.price as NSNumber, formatter: NumberFormatter.currency)
        }.task {
            //await vm.populateProducts()
            do {
                try await storeModel.populateProducts()
            } catch {
                print(error)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(StoreModel(webservice: Webservice()))
    }
}
