//
//  RiffsVC.swift
//  Riff
//
//  Created by Boariu Andy on 7/31/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class RiffsVC: UIViewController {
    
    // MARK: - View Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        loadAllRiffs()
    }
    
    // MARK: - Notification Methods
    
    // MARK: - Public Methods
    
    // MARK: - Custom Methods
    
    private func loadAllRiffs() {
//        appDelegate.ref.child(Constants.RiffKeys.riff).observeSingleEvent(of: .value) { [weak self] (snapshot) in
//            guard let me = self else { return }
//
//            for child in snapshot.children {
//                if let riff = child.value as? Dictionary<String, String> {
//
//                }
//            }
//
//            guard let arrRiffs = snapshot.value as? [DataSnapshot] else {
//                return
//            }
//            
//            for riff in arrRiffs {
//                if let dictRiff = riff as? Dictionary<String, String> {
//                    print(dictRiff)
//                }
//            }
//        }
    }
    
    // MARK: - API Methods
    
    // MARK: - Action Methods
    
    // MARK: - Memory Cleanup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
