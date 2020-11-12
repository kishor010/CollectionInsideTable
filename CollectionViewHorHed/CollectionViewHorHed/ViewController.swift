//
//  ViewController.swift
//  CollectionViewHorHed
//
//  Created by Kishor Pahalwani on 08/06/20.
//  Copyright © 2020 Kishor Pahalwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnGoToCells(_ sender: Any) {
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "TableCollVC") as? TableCollVC {
            self.navigationController?.show(vc, sender: nil)
        }
    }
}
