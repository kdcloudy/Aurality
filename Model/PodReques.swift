//
//  PodRequest.swift
//  Aurality
//
//  Created by Ashwin Chandrasekar on 29/10/20.
//  Copyright © 2020 kdcloudy. All rights reserved.
//

import Foundation

enum PodError:Error {
    case noDataAvailable
    case canNotProcessData
}

struct PodRequest {
    
    let API_KEY = "41ca466fc4714dc181132fe21a29c833"
    
    func getPodcast() {
        let resourceString = "https://listen-api.listennotes.com/api/v2/just_listen"
        if let resourceURL = URL(string: resourceString) {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "GET"
            urlRequest.addValue(API_KEY, forHTTPHeaderField: "X-ListenAPI-Key")
            
            let dataTask = URLSession.shared.dataTask(with: resourceURL) { (data, response, error) in
                if error != nil  {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: .utf8)
                    print(dataString)
                    //self.parseJSON(podData: safeData)
                }
                
            }
             dataTask.resume()
        }
    }
    
    func parseJSON(podData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(PodData.self, from: podData)
            print(decodedData.total)
        } catch {
            print(error)
        }
    }
    
    /*func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil  {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
    
    func getPodcast (completion: @escaping(Result<[PodInfo], PodError>) -> Void) {
        do {
            var urlRequest = URLRequest(url: resourceURL)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/json", forHTTPHeaderField: "Content-type")
            urlRequest.addValue(API_KEY, forHTTPHeaderField: "X-ListenAPI-Key")
            
            let dataTask = URLSession.shared.dataTask(with: resourceURL) { data,_,_ in guard let jsonData = data else {
                    completion(.failure(.noDataAvailable))
                    return
                }
                
                do {
                    let decoder = JSONDecoder()
                    let podResponse = try decoder.decode(PodInfo.self, from: jsonData)
                    let podDetails = podResponse.response.podcasts
                    completion(.success(podDetails))
                } catch {
                    completion(.failure(.canNotProcessData))
                }
            }
            dataTask.resume()
        }
    }*/
    
    
    
}

