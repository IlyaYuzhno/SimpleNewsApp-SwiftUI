//
//  NewsStorage.swift
//  SimpleNewsApp-SwiftUI
//
//  Created by Ilya Doroshkevitch on 15.03.2021.
//

import Foundation
import SwiftUI
import Combine


class NewsStorage: ObservableObject {
    init() {
            fetchNews()
        }
    
    
    @Published var news = [Response.News]()
    
    
    private func fetchNews() {
        Interactor.getLentaFromApi() { [weak self] response in
            self?.news = response
        }
    }
    
    
    func getImage(from imageUrl: String) -> UIImage {
        var image = UIImage()
        if let url = URL(string: imageUrl) {
            if let data = try? Data(contentsOf: url) {
                image = UIImage(data: data)  ?? UIImage(systemName: "photo")!
                
            }
            
        }
        return image
    }
    
    
    
    
}
