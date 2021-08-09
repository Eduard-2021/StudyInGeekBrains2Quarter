//
//  ViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 07.08.2021.
//

import UIKit

class FirstViewController: UIViewController {

    @IBOutlet weak var logoMillionaire: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoMillionaire.layer.cornerRadius = 150
    }


}

