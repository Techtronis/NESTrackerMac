//
//  CurrentConsoles.swift
//  NESTrackerMac
//
//  Created by Alexis Jost on 24.06.2024.
//

import SwiftUI

struct CurrentConsoles: View {
    
    var item: [ConsoleDetails]
    
    var body: some View {
        NavigationStack {
            List(item, id: \.id) { item in
                if(!item.discontinued){
                    NavigationLink(destination: ConsoleDetailView(item: item), label: {
                        HStack{
                            Image(item.id)
                                .resizable()
                                .scaledToFit()
                                .padding(4)
                                .frame(width: 60, height:60)
                            VStack(alignment: .leading){
                                Text(item.consoleName)
                                    .fontWeight(.semibold)
                                    .font(.system(size: 17))
                                Text("\(item.ReleaseDate)")
                                    .font(.system(size:15))
                                    .foregroundColor(.gray)
                            }
                            
                            if item.favorites {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    })
                }
            }
        }.navigationTitle("Current Consoles")
    }
}

#Preview {
    CurrentConsoles(item: ConsoleList.consoles)
}
