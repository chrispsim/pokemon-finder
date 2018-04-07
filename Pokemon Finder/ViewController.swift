//
//  ViewController.swift
//  Pokemon Finder
//
//  Created by Christopher Sim on 4/6/18.
//  Copyright © 2018 Christopher Sim. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var tbPokemonName: UITextField!
    @IBOutlet weak var imgPokemon: UIImageView!
    @IBOutlet weak var lbPokemonName: UILabel!
    
    var pokemonList: [String] = ["caterpie", "ekans", "pikachu", "clefairy"]
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func bSearch(_ sender: AnyObject) {
        // Clear label text
        lbPokemonName.text = ""
        
        // Get name input
        let pokemonName = tbPokemonName.text
        
        var isFound = false
        
        if pokemonName != "" {
            for name in pokemonList {
                if pokemonName == name {
                    showPokemon(name)
                    playSound("found")
                    
                    lbPokemonName.text = "\(name)"
                    isFound = true
                    break
                }
            }
            
            if !isFound {
                showPokemon("")
                playSound("not_found")
                lbPokemonName.text = "Pokemon not found!"
            }
        }
        else {
            
            let alert = UIAlertController(title: "Alert",
                                          message: "Pokemon Required",
                                          preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: "OK",
                                          style: UIAlertActionStyle.default,
                                          handler: nil))
            
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    func showPokemon(_ name: String) {
        imgPokemon.image = UIImage(named: name)
    }
    
    func playSound(_ sound: String) {
        let audioPath = Bundle.main.path(forResource: sound, ofType: "wav")!
        
        do {
            try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
            player.play()
        }
        catch {
            print("Can't find the audio file")
        }
    }
}

