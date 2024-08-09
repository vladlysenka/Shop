// Created by Vlad Lysenka 09.08.2024 

import SwiftUI

@main
struct ShopApp: App {
    @State private var vm: ProductViewModel = ProductViewModel()
    var body: some Scene {
        WindowGroup {
            Main()
                .environment(vm)
        }
    }
}
