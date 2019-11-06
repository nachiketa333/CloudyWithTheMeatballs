//
//  InterfaceController.swift
//  APIDemo WatchKit Extension
//
//  Created by Parrot on 2019-03-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import WatchKit
import Foundation
import Alamofire
import SwiftyJSON

class InterfaceController: WKInterfaceController {
    
    // MARK: Outlet
    // ---------------
 
    @IBOutlet var watchOutputLabel: WKInterfaceLabel!
    
    
    @IBOutlet var tempLabel: WKInterfaceLabel!
    
    
    @IBOutlet var precipiLabel: WKInterfaceLabel!
    
    
    @IBOutlet var timeLabel: WKInterfaceLabel!
    
    // MARK: Actions
    @IBAction func getDataPressed() {
        print("Button pressed")
        Alamofire.request("https://api.darksky.net/forecast/9973ce8e1daf155b2f112328638848ff/43.6532,-79.3832").responseJSON {
            
            (xyz) in
            print(xyz.value)
            
            // convert the response to a JSON object
            let x = JSON(xyz.value)
            let humidity = x["currently"]["humidity"]
            let precipitation = x["currently"]["precipIntensity"]
            let temperature = x["currently"]["apparentTemperature"]
            let time = x["currently"]["time"]
            print("Humidity: \(humidity)")
            print("Precipitation: \(precipitation)")
            print("Temperature: \(temperature)")
            print("Time: \(time)")
            
            self.watchOutputLabel.setText("Humidity: \(humidity)")
            self.precipiLabel.setText("Precipitation: \(precipitation)")
            self.tempLabel.setText("Temp: \(temperature) ")
            self.timeLabel.setText("Time: \(time)")
            
        }
    }
    
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        
        
    }
   
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
