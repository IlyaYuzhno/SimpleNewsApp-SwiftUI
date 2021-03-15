//
//  NewsFullView.swift
//  SimpleNewsApp-SwiftUI
//
//  Created by Ilya Doroshkevitch on 15.03.2021.
//

import SwiftUI

struct NewsFullView: View {
    
    var title: String
    var description: String
    var imageUrl: String
    var newsStorage = NewsStorage()
    
    var body: some View {
    
        VStack(alignment: .center) {
            let image = newsStorage.getImage(from: imageUrl )
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 300.0, height: 300.0, alignment: .center)
                .padding()
                Divider()
            
                Text(title)
                    .font(.largeTitle)
                    .multilineTextAlignment(.leading)
                    
                Text(description)
                    .font(.body)
                    .multilineTextAlignment(.leading)
                    .lineLimit(50)
        }
        .padding()
        .navigationBarTitle(Text(title), displayMode: .inline)
        
    }
}

struct NewsFullView_Previews: PreviewProvider {
    static var previews: some View {
        NewsFullView(title: "title", description: "description", imageUrl: "")
    }
}
