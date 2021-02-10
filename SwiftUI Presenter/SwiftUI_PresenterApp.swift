//
//  SwiftUI_PresenterApp.swift
//  SwiftUI Presenter
//
//  Created by Phil Yates on 10/02/2021.
//

import SwiftUI

@main
struct SwiftUI_PresenterApp: App {
    let items = [ListItemViewModel(id: 1, title: "test", subTitle: "test sub", image: "first"),
                ListItemViewModel(id: 2, title: "test2", subTitle: "test sub1", image: "first"),
                ListItemViewModel(id: 3, title: "test3", subTitle: "test sub2", image: "first"),
                ListItemViewModel(id: 4, title: "test4", subTitle: "test sub3", image: "first"),
                ListItemViewModel(id: 5, title: "test5", subTitle: "test sub4", image: "first")]
    
    var presenter: ListPresenterImp {
        let presenter = ListPresenterImp()
        presenter.listItems = items
        return presenter
    }
    
    var body: some Scene {
        WindowGroup {
            return ContentView(presenter: presenter)
        }
    }
}
