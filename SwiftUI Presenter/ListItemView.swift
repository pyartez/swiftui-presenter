//
//  ListItemView.swift
//  SwiftUI Presenter
//
//  Created by Phil Yates on 10/02/2021.
//

import SwiftUI

struct ListItemViewModel: Identifiable {
    let id: Int
    let title: String
    let subTitle: String?
    let image: String
}

struct ListItemView: View {
    let viewModel: ListItemViewModel
    
    var body: some View {
        HStack() {
            Image(viewModel.image)
            VStack(alignment: .leading) {
                Text(viewModel.title)
                    .font(.headline)
                viewModel.subTitle.map({
                    Text($0)
                        .font(.subheadline)
                })
            }
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(
            viewModel: ListItemViewModel(
                id: 1,
                title: "Test Title",
                subTitle: "Test Subtitle",
                image: "first"
            )
        )
    }
}
