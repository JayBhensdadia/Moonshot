//
//  Bundle-Decodable.swift
//  Moonshot
//
//  Created by Jay Bhensdadia on 11/04/23.
//

import Foundation

extension Bundle{
//    func decode(_ file : String) -> [String : Astronaut] {
//        guard let url = self.url(forResource: file, withExtension: nil) else {
//            fatalError("Failed to locate \(file) in bundle")
//        }
//
//        guard let data = try? Data(contentsOf: url) else{
//            fatalError("Failed to load data form \(file)")
//        }
//
//        let decoder = JSONDecoder()
//
//        guard let loaded = try? decoder.decode([String: Astronaut].self,from: data) else{
//            fatalError("failed to decode data")
//        }
//        return loaded
//    }
    
    func decode<T: Codable>(_ file : String) -> T {
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load data form \(file)")
        }
        
        let decoder = JSONDecoder()
        let formatter = DateFormatter()
        formatter.dateFormat = "y-MM-dd"
        decoder.dateDecodingStrategy = .formatted(formatter)
        
        guard let loaded = try? decoder.decode(T.self,from: data) else{
            fatalError("failed to decode data")
        }
        return loaded
    }
}
