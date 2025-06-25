//
//  BleDevice.swift
//  EquilibriumAPI
//
//  Created by Leo Wehrfritz on 24.06.25.
//

public struct BleDevice: Codable, Identifiable {
    public var id: String {
        self.address
    }
    public let name: String
    public let address: String
    public let connected: Bool
    public let paired: Bool
    
    /*
     Should only be used for mocking.
     */
    public init(name: String, address: String, connected: Bool, paired: Bool) {
        self.name = name
        self.address = address
        self.connected = connected
        self.paired = paired
    }
}

public struct BleDeviceResponse: Codable {
    public let devices: [BleDevice]
}
