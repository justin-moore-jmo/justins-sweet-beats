//
//  ViewController.swift
//  Justin's Sweet Beats
//
//  Created by Justin Moore on 3/14/19.
//  Copyright © 2019 Justin Moore. All rights reserved.
//

import UIKit
import SafariServices
import AVFoundation

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    
    @IBAction func bangerTapped(_ sender: Any) {
        let alert = UIAlertController(title: "WARNING! THIS SONG IS A BANGER!", message: "Are you sure you want to continue?", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title:"No", style: .default, handler: nil))
        alert.addAction(UIAlertAction(title:"Yes", style: .default, handler: goToBanger))
        
        self.present(alert, animated:true, completion:nil)

        
    }
    func goToBanger(action: UIAlertAction!){
        performSegue(withIdentifier: "wowzers", sender: nil)
    }
    
    
    @IBAction func goToWebsite(_ sender: Any) {
        if let url = URL(string: "https://soundcloud.com/justin-moore-jmo") {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            present(vc, animated: true)
    }
    
    
}
}


class CreateCharacter: UIViewController{
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("create character page loaded")
        strValue.text = "\(randomCharacter.str)"
        conValue.text = "\(randomCharacter.con)"
        wisValue.text = "\(randomCharacter.wis)"
        
        
        
        do {
            playSong = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath!))
            playSong.play()
        }
        catch{
            print("OH NO!")
        }
        
        
    }
    @IBOutlet weak var strValue: UILabel!
    
    @IBOutlet weak var conValue: UILabel!
    
    @IBOutlet weak var wisValue: UILabel!
    
    struct human {
        var str: Int
        var con: Int
        var wis: Int
    }
    
    var randomCharacter = human(str: Int.random(in: 1...20), con: Int.random(in: 1...20), wis: Int.random(in: 1...20))
    
    @IBAction func rerollStats(_ sender: Any) {
        randomCharacter.str = Int.random(in:1...20)
        randomCharacter.con = Int.random(in:1...20)
        randomCharacter.wis = Int.random(in:1...20)
        strValue.text = "\(randomCharacter.str)"
        conValue.text = "\(randomCharacter.con)"
        wisValue.text = "\(randomCharacter.wis)"
    }
    
    let soundPath = Bundle.main.path(forResource: "Song1", ofType: "mp3")
    var playSong = AVAudioPlayer()
    @IBAction func musicPlay(_ sender: Any) {

    }
    
    
    
}

class BangerScene: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("banger scene loaded")
        
        do {
            playSong = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: soundPath!))
            playSong.play()
        }
        catch{
            print("OH NO!")
        }
    }
        let soundPath = Bundle.main.path(forResource: "Song2", ofType: "m4a")
        var playSong = AVAudioPlayer()
        @IBAction func musicPlay(_ sender: Any) {
            
        }
}
