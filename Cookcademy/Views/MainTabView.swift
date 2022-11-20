//
//  MainTabView.swift
//  Cookcademy
//
//  Created by Wendy Zhu on 9/21/22.
//

import SwiftUI

struct MainTabView: View {
    //  MainTabView will maintain the state of recipeData and pass recipeData as an environmentObject to the other views
    // if you modify recipeData in any view, the environment will let the views know the variable changed.
    @StateObject var recipeData = RecipeData()
    
    var body: some View {
        TabView {
            RecipeCategoryGridView()
                .tabItem {
                    Label("Recipes", systemImage: "list.dash")
                }
            NavigationView {
                RecipesListView(viewStyle: .favorites)
            }.tabItem {
                Label("Favorites", systemImage: "heart.fill")
            }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gear")
                }
        }
        .environmentObject(recipeData)
        .onAppear {
            recipeData.loadRecipes()
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
    }
}
