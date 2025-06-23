//
//  EquilibriumAPIHandler.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 23.06.25.
//

import Foundation

enum EquilibriumAPIError: Error {
    case invalidHostAndPort
}

public class EquilibriumAPIHandler {
    
    
    
}

public extension EquilibriumAPIHandler {
    public static func testConnection(host: String, port: Int) async throws -> ServerInfo {
        guard let url = URL(string: "http://\(host):\(port)/info") else {
            throw EquilibriumAPIError.invalidHostAndPort
        }
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        return try JSONDecoder().decode(ServerInfo.self, from: data)
    }
}
