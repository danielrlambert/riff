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
        appDelegate.ref.child(Constants.RiffKeys.riff).observeSingleEvent(of: .value) { [weak self] (snapshot) in
            guard let me = self else { return }
            
            for data in snapshot.children {
                if let dataRiff = data as? DataSnapshot {
                    if var dictRiff = dataRiff.value as? [String: AnyObject] {
                        //TODO: Aici iti vin dictionare cu toate riffurile din database
                        /*
                         ["riff_status": Hey, I am happy, "riff_gender": male, "riff_age": 21]
                         ["riff_status": Hey, I am happy, "riff_gender": male, "riff_age": 21]
                         ["riff_status": Hey, I am happy, "riff_gender": male, "riff_age": 21]
                         ["riff_status": Hey, I am happy, "riff_gender": male, "riff_age": 21]
                         ["riff_status": Hey, I am happy, "riff_gender": male, "riff_age": 21]
                         ["riff_status": Hey, I am happy, "riff_gender": male, "riff_age": 21]
                         */
                        
                        // Creezi o clasa, Riff, si le pastrezi in tabelu de aici, cu obiecte de tipul Riff
                        print(dictRiff)
                    }
                }
            }
        }
    }
    
    // MARK: - API Methods
    
    // MARK: - Action Methods
    
    // MARK: - Memory Cleanup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


