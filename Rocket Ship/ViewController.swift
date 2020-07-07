//
//  ViewController.swift
//  Rocket Ship
//
//  Created by Anderson Hsiao on 6/5/20.
//  Copyright © 2020 Anderson Hsiao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func unwindToMain(nwindSegue: UIStoryboardSegue){
        
    }
    
    @IBAction func moreButton(_ sender: Any) {
        UIApplication.shared.openURL(URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!)
    }
}

