//
//  ContentView.swift
//  SimpleNewsApp-SwiftUI
//
//  Created by Ilya Doroshkevitch on 15.03.2021.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var newsStorage = NewsStorage()
   
    var body: some View {
        NavigationView {
        List(newsStorage.news, id: \.self) { item in
        
            newsCell(item: item)
        }
        .navigationBarTitle(Text("NEWS"))
        
        }
       
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
    
}



public extension UIView {
    func getImage(from imageUrl: String, to imageView: UIImageView) {
        guard let url = URL(string: imageUrl ) else { return }
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                imageView.image = UIImage(data: data)
            }
        }
    }
  }

struct newsCell: View {
    var item: Response.News
    var newsStorage = NewsStorage()
    var body: some View {
        NavigationLink(
            destination: NewsFullView(title: item.title ?? "", description: item.description ?? "", imageUrl: item.urlToImage ?? AppDelegate.defaultImage)) {
            let image = newsStorage.getImage(from: item.urlToImage ?? AppDelegate.defaultImage )
            
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100.0, height: 100.0, alignment: .center)
            VStack(alignment: .leading) {
                Text(item.title ?? "")
                Text(item.description ?? "")
                    .font(.subheadline).foregroundColor(Color.gray).multilineTextAlignment(.leading)
            }
        }
    }
}
