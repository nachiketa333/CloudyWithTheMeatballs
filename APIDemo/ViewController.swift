//
//  ViewController.swift
//  APIDemo
//
//  Created by Parrot on 2019-03-03.
//  Copyright © 2019 Parrot. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON


class ViewController: UIViewController {

    
    @IBOutlet weak var outputLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //let URL = "https://httpbin.org/get"
        Alamofire.request("https://api.darksky.net/forecast/9973ce8e1daf155b2f112328638848ff/43.6532,-79.3832").responseJSON {
            
            (xyz) in
            print(xyz.value)
            
            // convert the response to a JSON object
            let x = JSON(xyz.value)
            // ------------------------------------------
            // 1. Convert the API response to a JSON object
            
        
            
             let TimeZone = x["timezone"]
            
            print("Time: \(time)")
            
            self.outputLabel.text = ("Time Zone: \(TimeZone)")
            
            
            
            
//            // 2b. Get a key from the JSON object
//            let origin = jsonResponse["origin"]
//            let host = jsonResponse["headers"]["Host"]
//
//            // 2c. Output the value to screen
//            print("Your IP Address: \(origin)")
//            print("Host: \(host)")
//
//            // 3. Show the data in the user interface
//            self.outputLabel.text = "IP Address: \(origin)"
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

