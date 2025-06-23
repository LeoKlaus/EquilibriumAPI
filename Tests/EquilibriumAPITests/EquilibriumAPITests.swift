import Testing
import Foundation
@testable import EquilibriumAPIHandler


@Test func decodeIrCommand() async throws {
    let json = """
    {
        "name": "Volume Up",
        "command_group_id": 1,
        "bt_media_action": null,
        "method": null,
        "id": 1,
        "button": "volume_up",
        "type": "ir",
        "bt_action": null,
        "host": null,
        "body": null,
        "ir_action": [
            4500,
            506
            ]
    }
    """.utf8
    
    let command = try JSONDecoder().decode(Command.self, from: Data(json))
    
    #expect(command.id == 1)
    #expect(command.name == "Volume Up")
    #expect(command.commandGroupId == 1)
    #expect(command.btMediaAction == nil)
    #expect(command.method == nil)
    #expect(command.button == .volumeUp)
    #expect(command.type == .ir)
    #expect(command.btAction == nil)
    #expect(command.host == nil)
    #expect(command.body == nil)
    //#expect(command.irAction == [4500, 506])
}

@Test func decodeNetworkCommand() async throws {
    let json = """
    {
        "name": "Govee PC",
        "command_group_id": null,
        "bt_media_action": null,
        "method": "post",
        "id": 24,
        "button": "other",
        "type": "network",
        "bt_action": null,
        "host": "http://192.168.27.210:1880/test",
        "body": "pc",
        "ir_action": []
    }
    """.utf8
    
    let command = try JSONDecoder().decode(Command.self, from: Data(json))
    
    #expect(command.id == 24)
    #expect(command.name == "Govee PC")
    #expect(command.type == .network)
    #expect(command.commandGroupId == nil)
    #expect(command.button == .other)
    #expect(command.btAction == nil)
    #expect(command.btMediaAction == nil)
    #expect(command.method == .post)
    #expect(command.host == "http://192.168.27.210:1880/test")
    #expect(command.body == "pc")
    //#expect(command.irAction == [])
}

@Test func decodeBluetoothCommand() async throws {
    let json = """
    {
        "name": "Select",
        "command_group_id": null,
        "bt_media_action": null,
        "method": null,
        "id": 16,
        "button": "select",
        "type": "bluetooth",
        "bt_action": "KEY_ENTER",
        "host": null,
        "body": null,
        "ir_action": []
    }
    """.utf8
    
    let command = try JSONDecoder().decode(Command.self, from: Data(json))
    
    #expect(command.id == 16)
    #expect(command.name == "Select")
    #expect(command.commandGroupId == nil)
    #expect(command.type == .bluetooth)
    #expect(command.button == .select)
    #expect(command.btMediaAction == nil)
    #expect(command.btAction == "KEY_ENTER")
    #expect(command.method == nil)
    #expect(command.host == nil)
    #expect(command.body == nil)
    //#expect(command.irAction == [])
}

@Test func decodeBluetoothMediaKeyCommand() async throws {
    let json = """
    {
        "name": "Mute",
        "command_group_id": null,
        "bt_media_action": "KEY_MUTE",
        "method": null,
        "id": 10,
        "button": "mute",
        "type": "bluetooth",
        "bt_action": null,
        "host": null,
        "body": null,
        "ir_action": []
    }
    """.utf8
    
    let command = try JSONDecoder().decode(Command.self, from: Data(json))
    
    #expect(command.id == 10)
    #expect(command.name == "Mute")
    #expect(command.commandGroupId == nil)
    #expect(command.type == .bluetooth)
    #expect(command.button == .mute)
    #expect(command.btAction == nil)
    #expect(command.btMediaAction == "KEY_MUTE")
    #expect(command.method == nil)
    #expect(command.host == nil)
    #expect(command.body == nil)
    //#expect(command.irAction == [])
}

@Test func decodeCommandGroup() async throws {
    let json = """
    {
        "name": "Power",
        "type": "power",
        "id": 3,
        "commands": [
          {
            "name": "Power Toggle",
            "button": "power_toggle",
            "type": "ir",
            "command_group_id": 3,
            "host": null,
            "method": null,
            "body": null,
            "bt_action": null,
            "bt_media_action": null,
            "id": 5
          }
        ]
      }
    """.utf8
    
    let commandGroup = try JSONDecoder().decode(CommandGroup.self, from: Data(json))
    
    #expect(commandGroup.id == 3)
    #expect(commandGroup.name == "Power")
    #expect(commandGroup.type == .power)
    #expect(
        commandGroup.commands == [
            Command(
                id: 5,
                name: "Power Toggle",
                button: .powerToggle,
                type: .ir,
                commandGroupId: 3
            )
        ]
    )
}

@Test func decodeDevice() async throws {
    let json = """
    {
        "name": "Hisense TV",
        "manufacturer": "Hisense",
        "model": "55U8KQ",
        "type": "display",
        "id": 1,
        "command_groups": [
            {
                "name": "Power",
                "type": "power",
                "id": 3,
                "commands": [
                    {
                        "name": "Power Toggle",
                        "button": "power_toggle",
                        "type": "ir",
                        "command_group_id": 3,
                        "host": null,
                        "method": null,
                        "body": null,
                        "bt_action": null,
                        "bt_media_action": null,
                        "id": 5
                    }
                ]
            }
        ],
        "macros": [
            {
                "name": "TestMacroWithSceneAndDevice",
                "id": 6,
                "delays": [
                    125
                ]
            },
            {
                "name": "string",
                "id": 1,
                "delays": [
                    100
                ]
            },
            {
                "name": "string",
                "id": 4,
                "delays": []
            }
        ],
        "scenes": [
            {
                "name": "Apple TV",
                "bluetooth_address": "C0:95:6D:80:ED:7E",
                "id": 3,
                "image_id": null,
                "keymap": "apple_tv"
            }
        ],
        "image": null
    }
    """.utf8
    
    let device = try JSONDecoder().decode(Device.self, from: Data(json))
    
    #expect(device.id == 1)
    #expect(device.name == "Hisense TV")
    #expect(device.manufacturer == "Hisense")
    #expect(device.model == "55U8KQ")
    #expect(device.type == .display)
    #expect(
        device.commandGroups == [
            CommandGroup(
                id: 3,
                name: "Power",
                type: .power,
                commands: [
                    Command(
                        id: 5,
                        name: "Power Toggle",
                        button: .powerToggle,
                        type: .ir,
                        commandGroupId: 3
                    )
                ]
            )
        ]
    )
    #expect(
        device.scenes == [
            Scene(
                id: 3,
                name: "Apple TV",
                bluetoothAddress: "C0:95:6D:80:ED:7E",
                keymap: "apple_tv"
            )
        ]
    )
    #expect(device.macros == [
        Macro(id: 6, name: "TestMacroWithSceneAndDevice", delays: [125]),
        Macro(id: 1, name: "string", delays: [100]),
        Macro(id: 4, name: "string")
    ])
}

@Test func decodeHTTPValidationError() async throws {
    let json = """
        {
            "detail": [
                {
                    "type": "missing",
                    "loc": [
                        "body",
                        "name"
                    ],
                    "msg": "Field required"
                }
            ]
        }
        """.utf8
    
    let validationError = try JSONDecoder().decode(HTTPValidationError.self, from: Data(json))
    
    #expect(
        validationError.detail.first == ValidationError(
            type: "missing",
            loc: [
                "body",
                "name"
            ],
            msg: "Field required"
        )
    )
}

@Test func decodeHTTPValidationErrorInt() async throws {
    let json = """
        {
            "detail": [
                {
                    "type": "missing",
                    "loc": [
                        1, 2
                    ],
                    "msg": "Field required"
                }
            ]
        }
        """.utf8
    
    let validationError = try JSONDecoder().decode(HTTPValidationError.self, from: Data(json))
    
    #expect(
        validationError.detail.first == ValidationError(
            type: "missing",
            loc: [
                "1",
                "2"
            ],
            msg: "Field required"
        )
    )
}

@Test func decodeScene() async throws {
    let json = """
    {
        "name": "Apple TV",
        "id": 3,
        "devices": [
            {
                "name": "Hisense TV",
                "type": "display",
                "image_id": null,
                "manufacturer": "Hisense",
                "model": "55U8KQ",
                "id": 1
            }
        ],
        "image": null,
        "start_macro": {
            "name": "string",
            "id": 1,
            "commands": [
                {
                    "name": "TestCommand",
                    "button": "other",
                    "command_group_id": 0,
                    "ir_action": [],
                    "bt_media_action": null,
                    "method": "get",
                    "type": "network",
                    "id": 1,
                    "bt_action": null,
                    "host": "https://google.de",
                    "body": null
                },
                {
                    "name": "TestCommand2",
                    "button": "other",
                    "command_group_id": null,
                    "ir_action": [],
                    "bt_media_action": null,
                    "method": "get",
                    "type": "network",
                    "id": 2,
                    "bt_action": null,
                    "host": "https://google.de",
                    "body": null
                }
            ],
            "delays": [
                100
            ],
            "scenes": [
                {
                    "name": "string",
                    "stop_macro_id": 2,
                    "keymap": null,
                    "id": 1,
                    "image_id": 0,
                    "start_macro_id": 1,
                    "bluetooth_address": null
                }
            ],
            "devices": [
                {
                    "name": "Hisense TV",
                    "model": "55U8KQ",
                    "id": 1,
                    "manufacturer": "Hisense",
                    "type": "display",
                    "image_id": null
                }
            ]
        },
        "stop_macro": {
            "name": "TestMacro2",
            "id": 2,
            "commands": [
                {
                    "name": "TestCommand",
                    "button": "other",
                    "command_group_id": 0,
                    "ir_action": [],
                    "bt_media_action": null,
                    "method": "get",
                    "type": "network",
                    "id": 1,
                    "bt_action": null,
                    "host": "https://google.de",
                    "body": null
                },
                {
                    "name": "TestCommand2",
                    "button": "other",
                    "command_group_id": null,
                    "ir_action": [],
                    "bt_media_action": null,
                    "method": "get",
                    "type": "network",
                    "id": 2,
                    "bt_action": null,
                    "host": "https://google.de",
                    "body": null
                }
            ],
            "delays": [
                100
            ],
            "scenes": [],
            "devices": []
        },
        "macros": [
            {
                "name": "TestMacroWithScene",
                "id": 5,
                "delays": [
                    125
                ]
            },
            {
                "name": "TestMacroWithSceneAndDevice",
                "id": 6,
                "delays": [
                    125
                ]
            },
            {
                "name": "string",
                "id": 1,
                "delays": [
                    100
                ]
            }
        ],
        "bluetooth_address": "C0:95:6D:80:ED:7E",
        "keymap": "apple_tv"
    }
    """.utf8
    
    let scene = try JSONDecoder().decode(Scene.self, from: Data(json))
    
    #expect(scene.id == 3)
    #expect(scene.name == "Apple TV")
    #expect(scene.imageId == nil)
    #expect(scene.image == nil)
    #expect(scene.bluetoothAddress == "C0:95:6D:80:ED:7E")
    #expect(scene.keymap == "apple_tv")
    #expect(
        scene.devices == [
            Device(
                id: 1,
                name: "Hisense TV",
                manufacturer: "Hisense",
                model: "55U8KQ",
                type: .display
            )
        ]
    )
    #expect(
        scene.startMacro == Macro(
            id: 1,
            name: "string",
            commands: [
                Command(id: 1, name: "TestCommand", button: .other, type: .network, commandGroupId: 0, host: "https://google.de", method: .get),
                Command(id: 2, name: "TestCommand2", button: .other, type: .network, host: "https://google.de", method: .get)
            ],
            delays: [100],
            scenes: [
                Scene(id: 1, name: "string", imageId: 0)
            ],
            devices: [
                /**
                 "name": "Hisense TV",
                 "model": "55U8KQ",
                 "id": 1,
                 "manufacturer": "Hisense",
                 "type": "display",
                 "image_id": null
                 */
                Device(id: 1, name: "Hisense TV", manufacturer: "Hisense", model: "55U8KQ", type: .display)
            ]
        )
    )
    #expect(
        scene.stopMacro ==
        Macro(
            id: 2,
            name: "TestMacro2",
            commands: [
                Command(id: 1, name: "TestCommand", button: .other, type: .network, commandGroupId: 0, host: "https://google.de", method: .get),
                Command(id: 2, name: "TestCommand2", button: .other, type: .network, host: "https://google.de", method: .get)
            ],
            delays: [100],
            scenes: [],
            devices: []
        )
    )
    
    #expect(scene.macros == [
        Macro(id: 5, name: "TestMacroWithScene", delays: [125]),
        Macro(id: 6, name: "TestMacroWithSceneAndDevice", delays: [125]),
        Macro(id: 1, name: "string", delays: [100])
    ])
}

@Test func decodeSceneStatusReport() async throws {
    let json = """
    {
        "id": 7,
        "status": "stopping"
    }
    """.utf8
    
    let sceneStatus = try JSONDecoder().decode(SceneStatusReport.self, from: Data(json))
    
    #expect(sceneStatus.id == 7)
    #expect(sceneStatus.status == .stopping)
}

@Test func decodeSceneStatusReportEmpty() async throws {
    let json = """
    {
        "id": null,
        "status": null
    }
    """.utf8
    
    let sceneStatus = try JSONDecoder().decode(SceneStatusReport.self, from: Data(json))
    
    #expect(sceneStatus.id == nil)
    #expect(sceneStatus.status == nil)
}

@Test func decodeMacro() async throws {
    let json = """
    {
        "name": "string",
        "id": 1,
        "commands": [
            {
                "name": "TestCommand",
                "button": "other",
                "command_group_id": 0,
                "ir_action": [],
                "bt_media_action": null,
                "method": "get",
                "type": "network",
                "id": 1,
                "bt_action": null,
                "host": "https://google.de",
                "body": null
            },
            {
                "name": "TestCommand2",
                "button": "other",
                "command_group_id": null,
                "ir_action": [],
                "bt_media_action": null,
                "method": "get",
                "type": "network",
                "id": 2,
                "bt_action": null,
                "host": "https://google.de",
                "body": null
            }
        ],
        "delays": [
            100
        ],
        "scenes": [
            {
                "name": "string",
                "stop_macro_id": 2,
                "keymap": null,
                "id": 1,
                "image_id": 0,
                "start_macro_id": 1,
                "bluetooth_address": null
            }
        ],
        "devices": [
            {
                "name": "Hisense TV",
                "model": "55U8KQ",
                "id": 1,
                "manufacturer": "Hisense",
                "type": "display",
                "image_id": null
            }
        ]
    }
    """.utf8
    
    let macro = try JSONDecoder().decode(Macro.self, from: Data(json))
    
    #expect(macro.id == 1)
    #expect(macro.name == "string")
    #expect(macro.commands == [
        Command(id: 1, name: "TestCommand", button: .other, type: .network, commandGroupId: 0, host: "https://google.de", method: .get),
        Command(id: 2, name: "TestCommand2", button: .other, type: .network, host: "https://google.de", method: .get)
    ])
    #expect(macro.delays == [100])
    #expect(macro.scenes == [
        Scene(id: 1, name: "string", imageId: 0)
    ])
    #expect(macro.devices == [
        Device(id: 1, name: "Hisense TV", manufacturer: "Hisense", model: "55U8KQ", type: .display)
    ])
}
    
    
@Test fund decodeServerInfo() async throws {
    let json = """
    {
        "version": "0.1.0"
    }
    """.utf8
    
    let info = try JSONDecoder().decode(ServerInfo.self, from: Data(json))
    
    #expect(info.version == "0.1.0")
}
