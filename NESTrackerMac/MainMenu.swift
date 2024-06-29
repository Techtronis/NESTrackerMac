//
//  MainMenu.swift
//  FTNT
//
//  Created by Alexis Jost on 11.06.23.
//

import SwiftUI

struct MainMenu: View {
    
    var categories = ConsoleList.categories.sorted(by: { $0.key < $1.key })
    @State private var searchText: String = ""
    var item: [ConsoleDetails]
    
    var filteredConsoles: [ConsoleDetails] {
        if searchText.isEmpty {
            return item
        } else {
            return item.filter { $0.consoleName.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var body: some View {
        VStack{
            NavigationSplitView{
                List(){
                    if searchText != ""{
                        ForEach(filteredConsoles, id: \.id) { item in
                            NavigationLink(destination: ConsoleDetailView(item: item)) {
                                HStack {
                                    Image(item.id)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 60, height: 60)
                                    VStack (alignment: .leading){
                                        Text(item.consoleName)
                                            .fontWeight(.semibold)
                                        Text(item.category)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.gray)
                                    }
                                    if item.favorites {
                                        Image(systemName: "star.fill")
                                            .foregroundColor(.yellow)
                                    }
                                }
                            }
                        }
                    } else {
                        Section(header: Text("General")){
                            NavigationLink(destination: CurrentConsoles(item: ConsoleList.consoles), label: {
                                HStack{
                                    Image(systemName: "folder")
                                        .foregroundColor(.red)
                                    Text("Current Consoles")
                                        .fontWeight(.medium)
                                }
                            })
                            ForEach(categories, id:\.key) { category in
                                if (category.key == "Other" || category.key == "Remakes"){
                                    NavigationLink(destination: ConsoleMenu(item: category.value), label: {
                                        Section{
                                            HStack{
                                                Image(systemName: "folder")
                                                    .foregroundColor(.red)
                                                Text(category.key)
                                                    .fontWeight(.medium)
                                            }
                                        }
                                    })
                                }
                            }
                        }
                        Section(header: Text("Home Consoles")){
                            ForEach(categories, id:\.key) { category in
                                if (category.key == "Color TV Game" || category.key == "Home Consoles" || category.key == "Nintendo Switch"){
                                    NavigationLink(destination: ConsoleMenu(item: category.value), label: {
                                        Section{
                                            HStack{
                                                Image(systemName: "folder")
                                                    .foregroundColor(.red)
                                                Text(category.key)
                                                    .fontWeight(.medium)
                                            }
                                        }
                                    })
                                }
                            }
                        }
                        Section(header: Text("Handhelds")){
                            ForEach(categories, id:\.key) { category in
                                if (category.key == "Game & Watch" || category.key == "Nintendo DS / 3DS" || category.key == "Game Boy" || category.key == "iQue"){
                                    NavigationLink(destination: ConsoleMenu(item: category.value), label: {
                                        Section{
                                            HStack{
                                                Image(systemName: "folder")
                                                    .foregroundColor(.red)
                                                Text(category.key)
                                                    .fontWeight(.medium)
                                            }
                                        }
                                    })
                                }
                            }
                        }
                    }
                }.navigationTitle("NESTracker")
                    .searchable(text: $searchText, prompt: "Search Consoles")
                
            } detail: {
                Text("Choose Category")
            }
        }
    }
}

struct MainMenu_Previews: PreviewProvider {
    static var previews: some View {
        MainMenu(item: ConsoleList.consoles)
    }
}
