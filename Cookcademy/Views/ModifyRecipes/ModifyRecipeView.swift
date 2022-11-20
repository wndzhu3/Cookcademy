//
//  ModifyRecipeView.swift
//  Cookcademy
//
//  Created by Wendy Zhu on 9/13/22.
//

import SwiftUI

struct ModifyRecipeView: View {
    // @Binding means this view does not own the variable recipe
    // RecipesListView will provide the recipe to ModifyRecipeView through the binding
    // the binding allows ModifyRecipeView to access and modify the original property as if it owned recipe
    // once ModifyRecipeView is done, it doesn’t need to send any recipe data back to RecipesListView since it was already owned by RecipesListView.
    @Binding var recipe: Recipe
    
    @State private var selection = Selection.main
    
    var body: some View {
        VStack {
            Picker("Select recipe component", selection: $selection) {
                Text("Main Info").tag(Selection.main)
                Text("Ingredients").tag(Selection.ingredients)
                Text("Directions").tag(Selection.directions)
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()
            switch selection {
            case .main:
                ModifyMainInformationView(mainInformation: $recipe.mainInformation)
            case .ingredients:
                ModifyComponentsView<Ingredient, ModifyIngredientView>(components: $recipe.ingredients)
            case .directions:
                ModifyComponentsView<Direction, ModifyDirectionView>(components: $recipe.directions)
            }
            Spacer()
        }
    }
    
    enum Selection {
        case main
        case ingredients
        case directions
    }
}

struct ModifyRecipeView_Previews: PreviewProvider {
    // since the preview is not provided with a binding, there is a @State recipe to act as that binding
    // this will correctly display a ModifyRecipeView instance.
    @State static var recipe = Recipe()
    static var previews: some View {
        ModifyRecipeView(recipe: $recipe)
    }
}
