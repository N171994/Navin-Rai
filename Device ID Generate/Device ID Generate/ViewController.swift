//
//  ViewController.swift
//  Device ID Generate
//
//  Created by Navin Rai on 14/07/23.
//

import UIKit
import KeychainSwift


class ViewController: UIViewController {
    @IBOutlet weak var deviceIDLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func generateDeviceIDButtonTapped(_ sender: UIButton) {
        let deviceID = generateDeviceID()
        deviceIDLabel.text = "Device ID: \(deviceID)"
    }
    
    func generateDeviceID() -> String {
        let keychain = KeychainSwift()

        // Check if the device ID already exists in the Keychain
        if let existingDeviceID = keychain.get("DeviceID") {
            return existingDeviceID
        } else {
            // Generate a new device ID
            let newDeviceID = UUID().uuidString

            // Store the new device ID in the Keychain
            keychain.set(newDeviceID, forKey: "DeviceID")

            return newDeviceID
        }
    }
}
