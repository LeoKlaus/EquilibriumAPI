//
//  EquilibriumAPIHandler.swift
//  EquilibriumAPIHandler
//
//  Created by Leo Wehrfritz on 23.06.25.
//

import Foundation

public enum EquilibriumAPIError: Error {
    case invalidHostAndPort
    case noValidServerResponse
    case unexpectedServerResponse(statusCode: Int, response: String?)
}

open class EquilibriumAPIHandler {
    
    let baseURL: URL
    let host: String
    
    public init(host: String, port: Int) throws {
        guard let url = URL(string: "http://\(host):\(port)") else {
            throw EquilibriumAPIError.invalidHostAndPort
        }
        self.host = "\(host):\(port)"
        self.baseURL = url
    }
    
    open func get(endpoint: ApiEndpoint) async throws -> Data {
        let url = self.baseURL.appendingPathComponent(endpoint.path)
        
        let (data, response) = try await URLSession.shared.data(for: URLRequest(url: url))
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw EquilibriumAPIError.noValidServerResponse
        }
        
        if 200...299 ~= httpResponse.statusCode {
            return data
        } else {
            if let validationError = try? JSONDecoder().decode(HTTPValidationError.self, from: data) {
                throw validationError
            } else {
                throw EquilibriumAPIError.unexpectedServerResponse(statusCode: httpResponse.statusCode, response: String(data: data, encoding: .utf8))
            }
        }
    }
    
    public func get<T: Decodable>(endpoint: ApiEndpoint) async throws -> T {
        let data = try await self.get(endpoint: endpoint)
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    open func patch<T: Codable>(endpoint: ApiEndpoint, object: T) async throws -> T {
        let url = self.baseURL.appendingPathComponent(endpoint.path)
        
        var request = URLRequest(url: url)
        request.httpMethod = "PATCH"
        request.httpBody = try JSONEncoder().encode(object)
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw EquilibriumAPIError.noValidServerResponse
        }
        
        if 200...299 ~= httpResponse.statusCode {
            return try JSONDecoder().decode(T.self, from: data)
        } else {
            if let validationError = try? JSONDecoder().decode(HTTPValidationError.self, from: data) {
                throw validationError
            } else {
                throw EquilibriumAPIError.unexpectedServerResponse(statusCode: httpResponse.statusCode, response: String(data: data, encoding: .utf8))
            }
        }
    }
    
    open func post(endpoint: ApiEndpoint) async throws {
        let url = self.baseURL.appendingPathComponent(endpoint.path)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw EquilibriumAPIError.noValidServerResponse
        }
        
        if 200...299 ~= httpResponse.statusCode {
            return
        } else {
            if let validationError = try? JSONDecoder().decode(HTTPValidationError.self, from: data) {
                throw validationError
            } else {
                throw EquilibriumAPIError.unexpectedServerResponse(statusCode: httpResponse.statusCode, response: String(data: data, encoding: .utf8))
            }
        }
    }
    
    open func post<T: Codable>(endpoint: ApiEndpoint, object: T) async throws -> T {
        let url = self.baseURL.appendingPathComponent(endpoint.path)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = try JSONEncoder().encode(object)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw EquilibriumAPIError.noValidServerResponse
        }
        
        if 200...299 ~= httpResponse.statusCode {
            return try JSONDecoder().decode(T.self, from: data)
        } else {
            if let validationError = try? JSONDecoder().decode(HTTPValidationError.self, from: data) {
                throw validationError
            } else {
                throw EquilibriumAPIError.unexpectedServerResponse(statusCode: httpResponse.statusCode, response: String(data: data, encoding: .utf8))
            }
        }
    }
    
    open func delete(endpoint: ApiEndpoint) async throws {
        let url = self.baseURL.appendingPathComponent(endpoint.path)
        
        var request = URLRequest(url: url)
        request.httpMethod = "DELETE"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw EquilibriumAPIError.noValidServerResponse
        }
        
        if 200...299 ~= httpResponse.statusCode {
            return
        } else {
            if let validationError = try? JSONDecoder().decode(HTTPValidationError.self, from: data) {
                throw validationError
            } else {
                throw EquilibriumAPIError.unexpectedServerResponse(statusCode: httpResponse.statusCode, response: String(data: data, encoding: .utf8))
            }
        }
    }
    
    open func postMultipartForm<T: Decodable>(endpoint: ApiEndpoint, fileURL: URL) async throws -> T {
        
        var body = Data()
        
        let boundary = UUID().uuidString
        
        let filename = fileURL.lastPathComponent
        let fileData = try Data(contentsOf: fileURL)
        
        body.append("--\(boundary)\r\n")
        body.append("Content-Disposition: form-data; name=\"file\"; filename=\"\(filename)\"\r\n")
        body.append("Content-Type: \(fileURL.mimeType)\r\n\r\n")
        body.append(fileData)
        body.append("\r\n")
        body.append("--\(boundary)--\r\n")
        
        let url = self.baseURL.appendingPathComponent(endpoint.path)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = body
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw EquilibriumAPIError.noValidServerResponse
        }
        
        if 200...299 ~= httpResponse.statusCode {
            return try JSONDecoder().decode(T.self, from: data)
        } else {
            if let validationError = try? JSONDecoder().decode(HTTPValidationError.self, from: data) {
                throw validationError
            } else {
                throw EquilibriumAPIError.unexpectedServerResponse(statusCode: httpResponse.statusCode, response: String(data: data, encoding: .utf8))
            }
        }
    }
    
    open func openWebsocket(endpoint: ApiEndpoint) throws -> URLSessionWebSocketTask {
        guard let url = URL(string: "ws://" + self.host + endpoint.path) else {
            throw EquilibriumAPIError.invalidHostAndPort
        }
        
        let webSocketTask = URLSession.shared.webSocketTask(with: url)
        return webSocketTask
    }
}

public extension EquilibriumAPIHandler {
    static func testConnection(host: String, port: Int) async throws -> ServerInfo {
        guard let url = URL(string: "http://\(host):\(port)" + ApiEndpoint.info.path) else {
            throw EquilibriumAPIError.invalidHostAndPort
        }
        
        let (data, _) = try await URLSession.shared.data(for: URLRequest(url: url))
        return try JSONDecoder().decode(ServerInfo.self, from: data)
    }
}
