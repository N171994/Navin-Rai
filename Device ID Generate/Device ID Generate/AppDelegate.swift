//
//  AppDelegate.swift
//  Device ID Generate
//
//  Created by Navin Rai on 14/07/23.
//

import UIKit
import KeychainSwift
//import Appwrite

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


//    let client = Client()
//        .setEndpoint("https://cloud.appwrite.io/v1")
//        .setProject("64b149f5dab72fa14af2")
////        .setSelfSigned(status: true) // For self signed certificates, only use for development
//    let realtime = Realtime(client)

    // Subscribe to files channel
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
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
        
        let generateDeviceID = generateDeviceID()
        print(generateDeviceID)
        
//        let subscription = realtime.subscribe(channels: ["files"]) { response in
//            if (message.events!.contains("buckets.*.files.*.create")) {
//                // Log when a new file is uploaded
//                print(String(describing: response))
//            }
//        }
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

