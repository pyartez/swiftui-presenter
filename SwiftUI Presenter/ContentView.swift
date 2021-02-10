//
//  ContentView.swift
//  SwiftUI Presenter
//
//  Created by Phil Yates on 10/02/2021.
//

import SwiftUI
import Combine

final class ListPresenterImp: ListPresenter {
    @Published var listItems: [ListItemViewModel] = []
    
    init() {
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (timer) in
            let items = [ListItemViewModel(id: 1, title: "test", subTitle: "test sub", image: "first"),
                        ListItemViewModel(id: 2, title: "test2", subTitle: "test sub1", image: "first")]
            
            self.listItems = items
        }
    }
}

protocol ListPresenter: ObservableObject {
    var listItems: [ListItemViewModel] { get }
}

struct ContentView<T>: View where T: ListPresenter {
    @ObservedObject private var presenter: T
    
    init(presenter: T) {
        self.presenter = presenter
    }
 
    var body: some View {
        List(presenter.listItems) { item in
            ListItemView(viewModel: item)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let items = [ListItemViewModel(id: 1, title: "test", subTitle: "test sub", image: "first"),
                    ListItemViewModel(id: 2, title: "test2", subTitle: "test sub1", image: "first"),
                    ListItemViewModel(id: 3, title: "test3", subTitle: "test sub2", image: "first"),
                    ListItemViewModel(id: 4, title: "test4", subTitle: "test sub3", image: "first"),
                    ListItemViewModel(id: 5, title: "test5", subTitle: "test sub4", image: "first")]
        
        let presenter = ListPresenterImp()
        presenter.listItems = items
        
        return ContentView(presenter: presenter)
    }
}
