//
//  Photo.swift
//  basic functions
//
//  Created by Magic Keegan on 11/30/21.
//

import Foundation
import UIKit

enum PhotoError: Error {
    case imageCreationError
    case missingImageURL
}

struct Photo{
    private let session: URLSession = {
        let config = URLSessionConfiguration.default
        return URLSession(configuration: config)
    }()
    
    private func processImageRequest(data: Data?, error: Error?) -> Result<UIImage, Error> {
        guard
            let imageData = data,
            let image = UIImage(data: imageData) else {

                // Couldn't create an image
                if data == nil {
                    return .failure(error!)
                } else {
                    return .failure(PhotoError.imageCreationError)
                }
        }

        return .success(image)
    }
    
    func fetchImage(with photoURL:URL?,completion: @escaping (Result<UIImage, Error>) -> Void){
        guard let url = photoURL else {
            completion(.failure(PhotoError.missingImageURL))
            return
        }
        
       
        
        let request = URLRequest(url: url as URL)
        
        let task = session.dataTask(with: request) {
            (data, response, error) -> Void in

            let result = self.processImageRequest(data: data, error: error)
            
            OperationQueue.main.addOperation {
                completion(result)
            }
        }
        task.resume()
    }
    
}
