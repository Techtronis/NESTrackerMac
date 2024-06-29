//
//  ConsoleMenu.swift
//  NESTrackerMac
//
//  Created by Alexis Jost on 21.06.2024.
//

import SwiftUI

struct ConsoleMenu: View {
    
    var item: [ConsoleDetails]
    
    var body: some View {
        NavigationStack {
            List(item, id: \.id) { item in
                NavigationLink(destination: ConsoleDetailView(item: item), label: {
                    HStack{
                        Image(item.id)
                            .resizable()
                            .scaledToFit()
                            .padding(4)
                            .frame(width: 90, height: 60)
                        Text(item.consoleName)
                            .fontWeight(.semibold)
                    }
                })
            }
        }
    }
}

#Preview {
    ConsoleMenu(item: ConsoleList.consoles)
}
