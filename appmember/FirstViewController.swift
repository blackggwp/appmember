//
//  FirstViewController.swift
//  appmember
//
//  Created by sukishiMAC on 3/28/2560 BE.
//  Copyright © 2560 sukishiMAC. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func click_hello(_ sender: Any) {
         showalert(msg: "click me")
    }
    
    func showalert(msg:String){
    
        let alert = UIAlertController(title: "Alert", message: msg, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    
    }

}

