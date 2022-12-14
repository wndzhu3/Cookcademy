//
//  RecipeCategoryGridView.swift
//  Cookcademy
//
//  Created by Wendy Zhu on 9/12/22.
//

import SwiftUI

struct RecipeCategoryGridView: View {
    // recipeData will be passed in
    @EnvironmentObject private var recipeData: RecipeData
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(), GridItem()], content: {
                    ForEach(MainInformation.Category.allCases, id: \.self) { category in
                        NavigationLink(
                            destination: RecipesListView(viewStyle: .singleCategory(category)),
                                        //.environmentObject(recipeData)
                                      label: {
                                        CategoryView(category: category)
                        })
                    }
                })
            }
            .navigationTitle("Categories")
        }
    }
}

struct CategoryView: View {
    let category: MainInformation.Category
    
    var body: some View {
        ZStack {
            Image(category.rawValue)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .opacity(0.35)
            Text(category.rawValue)
                .font(.title)
        }
    }
}

struct RecipeCategoryGridView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeCategoryGridView()
    }
}
