//
//  HTTPValidationError.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 19.06.25.
//

public struct HTTPValidationError: Codable, Error {
    public let detail: [ValidationError]
}

public struct ValidationError: Equatable, Codable, Sendable {
    public let type: String
    public let loc: [String] // Can also be Int!
    public let msg: String
    
    public init(type: String, loc: [String], msg: String) {
        self.type = type
        self.loc = loc
        self.msg = msg
    }
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.type = try container.decode(String.self, forKey: .type)
        
        if let locInts = try? container.decode([Int].self, forKey: .loc) {
            self.loc = locInts.map { String($0) }
        } else {
            self.loc = try container.decode([String].self, forKey: .loc)
        }
        
        self.msg = try container.decode(String.self, forKey: .msg)
    }
}
