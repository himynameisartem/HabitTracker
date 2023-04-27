//
//  ProductCardModel.swift
//  cerenadaApp
//
//  Created by Артем Кудрявцев on 25.10.2022.
//

import UIKit

struct ProductCardData: Codable {
    let id: Int
    let name: String
    let description: String
    let sku: String
    let price: String
    let status: String
    let images: [Images]
    let attributes: [Attributes]
    let meta_data: [MetaData]
    let related_ids: [Int]?
}
//
//struct Images: Codable {
//    let src: String
//}
//
//struct Attributes: Codable {
//    let name: String
//    let options: [String]
//}
//
//struct MetaData: Codable {
//    let id: Int
//    let key: String
//    let value: Value?
//}
//
//enum Value: Codable {
//    case string(String)
//    case unknownData(UnknownData)
//    case emptyData(EmptyData)
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.singleValueContainer()
//        
//        if let x = try? container.decode(String.self) {
//            self = .string(x)
//            return
//        }
//        if let x = try? container.decode(UnknownData.self) {
//            self = .unknownData(x)
//            return
//        }
//        if let x = try? container.decode(EmptyData.self) {
//            self = .emptyData(x)
//            return
//        }
//        throw DecodingError.typeMismatch(Value.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for MyValue"))
//    }
//    
//    func encode(to encoder: Encoder) throws {
//        var container = encoder.singleValueContainer()
//        switch self {
//        case .string(let x):
//            try container.encode(x)
//        case .unknownData(let x):
//            try container.encode(x)
//        case .emptyData(let x):
//            try container.encode(x)
//        }
//    }
//    
//    var stringValue: String? {
//        switch self {
//        case .string(let s):
//            return s
//        default:
//            return nil
//        }
//    }
//    
//}
//
//struct UnknownData: Codable {
//    
//}
//
//struct EmptyData: Codable {
//    
//}
