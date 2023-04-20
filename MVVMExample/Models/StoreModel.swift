//
//  StoreModel.swift
//  MVVMExample
//
//  Created by Isaac Iniongun on 20/04/2023.
//

import Foundation

@MainActor class StoreModel: ObservableObject {
    @Published var products: [Product] = []
    private let webservice: Webservice
    
    init(webservice: Webservice) {
        self.webservice = webservice
    }
    
    func populateProducts() async throws {
        products = try await webservice.getProducts()
    }
}
