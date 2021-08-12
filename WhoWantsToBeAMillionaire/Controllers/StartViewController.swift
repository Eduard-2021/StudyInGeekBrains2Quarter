//
//  ViewController.swift
//  WhoWantsToBeAMillionaire
//
//  Created by Eduard on 07.08.2021.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var logoMillionaire: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        logoMillionaire.layer.cornerRadius = 150
//        clearUserDefaults()
    }

    private func clearUserDefaults() {
        let defaults = UserDefaults.standard
        defaults.removeObject(forKey: "Results")
        defaults.removeObject(forKey: "Questions")
    }

}

