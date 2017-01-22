//
//  InterfaceController.swift
//  smart-lights-watch WatchKit Extension
//
//  Created by Suyash Kumar on 1/19/17.
//  Copyright © 2017 Suyash Kumar. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire

let headers: HTTPHeaders = [
    "x-access-token": "token-goes-here" //TODO: Move this to a secrets file (perhaps plist?)
]

let devicePrefix = "Suyash's Lights"

class InterfaceController: WKInterfaceController {
    @IBOutlet var lightStatus: WKInterfaceLabel!
    @IBOutlet var toggleButton: WKInterfaceButton!
    @IBOutlet var refreshButton: WKInterfaceButton!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    @IBAction func refresh() {
        Alamofire.request("https://conduit.suyash.io/api/send/suyash/lightsStatus", headers: headers).responseJSON { response in

            if let JSON = response.result.value {
                let response = JSON as! NSDictionary
                self.updateStatus(status: response["data"] as? String)
            }
        }

        
    }

    @IBAction func toggle() {
        Alamofire.request("https://conduit.suyash.io/api/send/suyash/lightsToggle", headers: headers).responseJSON { response in
            if let JSON = response.result.value {
                let response = JSON as! NSDictionary
                self.updateStatus(status: response["data"] as? String)
            }
        }

        
    }
    
    func updateStatus(status: String?) {
        if let s = status {
            if s == "ON" {
                self.lightStatus.setText(devicePrefix + "\nON")
                self.toggleButton.setBackgroundColor(UIColor(red:1.00, green:0.25, blue:0.25, alpha:1.0))
                self.toggleButton.setTitle("Toggle Off")
            }
            else {
                self.lightStatus.setText(devicePrefix + "\nOFF")
                self.toggleButton.setBackgroundColor(UIColor(red:0.01, green:0.81, blue:0.00, alpha:1.0))
                self.toggleButton.setTitle("Toggle On")
            }
        }
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        self.refresh()
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
