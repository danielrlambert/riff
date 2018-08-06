//
//  ViewController.swift
//  Riff
//
//  Created by Boariu Andy on 7/27/18.
//  Copyright © 2018 Plush Republic, Inc. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class HomeVC: UIViewController {
    
    @IBOutlet weak var viewTop: UIView!
    @IBOutlet weak var txfAge: UITextField!
    @IBOutlet weak var txvDescription: UITextView!
    @IBOutlet weak var btnMale: UIButton!
    @IBOutlet weak var btnFemale: UIButton!
    
    let arrTexts = ["Ive got 99 problems and a b*#&h ain't one",
        "A day without sunshine is like, you know, night",
        "I may be drunk, Miss, but in the morning I will be sober and you will still be ugly.",
        "If you're going to do something tonight that you'll be sorry for tomorrow morning, sleep late.",
        "Everything is funny, as long as it's happening to somebody else",
        "It takes considerable knowledge just to realize the extent of your own ignorance",
        "I found there was only one way to look thin: hang out with fat people",
        "A woman's mind is cleaner than a man's: She changes it more often.",
        "My life need editing.",
        "Life is hard. After all, it kills you.",
        "Drawing on my fine command of the English language, I said nothing.",
        "May the forces of evil become confused on the way to your house",
        "Prejudice is a great time saver. You can form opinions without have to get the facts",
        "If women ran the world we wouldn't have wars, just intense neogtiations every 28 days.",
        "I always wanted to be somebody, but now I realize I should have been more specific.",
        "Man cannot live by bread alone; he must have peanut butter.",
        "All generalizations are false, including this one",
        "Gambling: The sure way of getting nothing for something",
        "I can resist everything except temptation",
        "People who think they know everything are a great annoyance to those of us who do.",
        "There are lots of people who mistake their imagination for their memory",
        "Procrastination is the art of keeping up with yesterday",
        "What's another word for thesaurus?",
        "Don't talk about yourself; it will be done when you leave",
        "She got a light skin friend, look like Michael Jackson. Got a dark skin friend, look like Michael Jackson.",
        "Watch out for the medallion. My diamonds are reckless. It feels like a midget is hanging from my necklace.",
        "She said, ‘Boy, you want your cake and eat it too.’ I said it’s cake. That’s what you’re supposed to do.",
        "Rock star, flyer than an ostrich."]
    
    let arrPersons = ["Jay-z",
        "Steve Martin",
        "Winston Churchill",
        "Henny Youngman",
        "Will Rogers",
        "Thomas Sowell",
        "Rodney Dangerfield",
        "Oliver Herford",
        "Mort Sahl",
        "Katharine Hepburn",
        "Robert Benchley",
        "George Carlin",
        "E.B. White",
        "Robin Williams",
        "Lily Tomlin",
        "James A. Garfield",
        "Mark Twain",
        "Wilson Mizner",
        "Oscar Wilde",
        "Isaac Asimov",
        "Josh Billings",
        "Don Marquis",
        "Steven Wright",
        "Wilson Mizner",
        "Kanye West",
        "Ludacris",
        "J. Cole",
        "Juelz Santana"]
    
    // MARK: - View Lifecycle Methods
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        resetValues()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        //saveQuotes()
    }
    
    // MARK: - Notification Methods
    
    // MARK: - Public Methods
    
    // MARK: - Custom Methods
    
    func saveQuotes() {
        for (i, text) in arrTexts.enumerated() {
            let dictQuote = [Constants.RiffKeys.text : text, Constants.RiffKeys.person : arrPersons[i]]
            appDelegate.ref.child(Constants.RiffKeys.quotes).childByAutoId().setValue(dictQuote)
        }
    }
    
    private func setupUI() {
        viewTop.layer.shadowOffset = CGSize(width: 0, height: 5)
        viewTop.layer.shadowOpacity = 0.3
        viewTop.layer.shadowRadius = 2.0
        viewTop.layer.shadowColor = UIColor.darkGray.cgColor
        
        txvDescription.layer.borderWidth = 1.0
        txvDescription.layer.borderColor = UIColor.gray.cgColor
        
        btnFemale.layer.masksToBounds = true
        btnMale.layer.masksToBounds = true
        btnFemale.layer.cornerRadius = btnFemale.frame.size.height / 2
        btnMale.layer.cornerRadius = btnMale.frame.size.height / 2
    }
    
    private func resetValues() {
        txfAge.text = ""
        txvDescription.text = ""
        btnMale.isSelected = false
        btnFemale.isSelected = false
        
    }
    
    private func checkIfUserProfileDetailsFilledCorectly() -> Bool {
        if !btnMale.isSelected && !btnFemale.isSelected
        {
            let alert                = UIAlertController(title: "Oops", message: "Please select your gender!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false
        }
        
        if (txfAge.text?.isEmpty)! {
            let alert                = UIAlertController(title: "Oops", message: "Please enter your age!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false
        }
        
        if txvDescription.text.isEmpty {
            let alert                = UIAlertController(title: "Oops", message: "Please enter your riff!", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
            return false
        }
        
        return true
    }
    
    
    // MARK: - API Methods
    
    // MARK: - Action Methods
    
    @IBAction func btnSubmitAction(_ sender: UIButton) {
        
        if checkIfUserProfileDetailsFilledCorectly() == true {
            let riffItem = [
                Constants.RiffKeys.gender       : btnMale.isSelected ? "male" : "female",
                Constants.RiffKeys.age          : txfAge.text!,
                Constants.RiffKeys.status       : txvDescription.text!,
                //Constants.RiffKeys.createdDate  : String(describing: Date())
                ] as [String : Any]
            
            appDelegate.ref.child(Constants.RiffKeys.riff).childByAutoId().setValue(riffItem) { [weak self] (error, snapshot) in
                guard let me = self else { return }
                
                if let err = error {
                    let alert                = UIAlertController(title: "Oops", message: err.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                    me.present(alert, animated: true, completion: nil)
                }
                else {
                    let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "YourGifVC") as! YourGifVC
                    vc.yourStatus = me.txvDescription.text
                    me.navigationController?.pushViewController(vc, animated: true)
                }
            }
        }
    }
    
    
    @IBAction func btnFemaleAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? .riffRed() : .clear
        
        btnMale.isSelected = false
        btnMale.backgroundColor = UIColor.clear
        
        view.endEditing(true)
        
    }
    
    @IBAction func btnMaleAction(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected
        sender.backgroundColor = sender.isSelected ? .riffBlue() : .clear
        
        btnFemale.isSelected = false
        btnFemale.backgroundColor = UIColor.clear
        
        view.endEditing(true)
    }
    
    // MARK: - Memory Cleanup

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
