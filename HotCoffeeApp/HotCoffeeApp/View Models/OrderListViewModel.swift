//
//  OrderListViewModel.swift
//  HotCoffeeApp
//
//  Created by Amit Naskar on 7/31/19.
//  Copyright © 2019 Amit Naskar. All rights reserved.
//

import Foundation
import SwiftUI
import CoreData
//import Combine

class OrderListViewModel: ObservableObject {
    
    @Published
    var orders = [OrderViewModel]()
    
    init() {
        fetchAllOrders()
    }
    
    func deleteOrder(_ orderVM: OrderViewModel) {
        CoreDataManager.shared.deleteOrder(name: orderVM.name)
        fetchAllOrders()
    }
    
    func fetchAllOrders() {
        self.orders = CoreDataManager.shared.getAllOrders().map(OrderViewModel.init)
        print(self.orders)
    }

    
}

class OrderViewModel {
    
    var name = ""
    var type = ""
    
    init(order: Order) {
        self.name = order.name!
        self.type = order.type!
    }
    
}
