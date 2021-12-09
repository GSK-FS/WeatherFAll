//
//  WeatherDataRequest.swift
//  WheatherFAll
//
//  Created by GSK on 12/6/21.
//

import Foundation
import CoreLocation

enum GetDataRequest<Type> {
    case success([Type])
    case failure
}

struct WeatherDataRequest<Type> where Type: Decodable {
    let basePathURL = "https://explorecalifornia.org/api/weather/city/"
    let dataURL: URL
    
    init(city: String) {
        let dataPathString = (basePathURL + city).addingPercentEncoding(withAllowedCharacters: NSCharacterSet.urlQueryAllowed)!
        guard let dataURL = URL(string: dataPathString) else {
            let error = fatalError()
            
            print("Error Print (dataURL):", error)
        }
        self.dataURL = dataURL
    }
    
    func getData (completion: @escaping (GetDataRequest<Type>) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: dataURL) { myData, myResponce, myError in
            guard let jsonData = myData else {
                completion(.failure)
                return
            }
            do {
                let resources = try JSONDecoder().decode([Type].self, from: jsonData)
                completion(.success(resources))
            } catch {
                completion(.failure)
            }
        }
        dataTask.resume()
    }
    
}
