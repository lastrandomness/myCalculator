//
//  ViewController.swift
//  vzv
//
//  Created by TikTak on 12/13/18.
//  Copyright © 2018 TikTak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textName: UITextField!
    @IBOutlet weak var labelShowName: UILabel!
    @IBAction func buttonClick(_ sender: Any) {
      print("hallo")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hallo6")
        // Do any additional setup after loading the view, typically from a nib.
    }
    
}




/*let msg = UIAlertController(title: "hello", message: "what's your name", preferredStyle:.alert)
 let msg2 = UIAlertAction(title: "hallo", style: .default){ (action) in print("This is msg 2!")}
 present(msg,animated: true,completion: nil)
 msg.addAction(msg2)*/
