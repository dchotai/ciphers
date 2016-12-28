//
//  MorseCode.swift
//  ciphers
//
//  Created by Divyesh Chotai on 12/20/16.
//  Copyright © 2016 Divyesh Chotai. All rights reserved.
//

import UIKit

class MorseCode: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var outputBox: UITextView!
    @IBAction func decryptButton(_ sender: Any) {
        if inputField.text?.isEmpty ?? true {
            return
        }
        outputBox.text = morseDecrypt(input: inputField.text!)
    }
    @IBAction func encryptButton(_ sender: Any) {
        if inputField.text?.isEmpty ?? true {
            return
        }
        outputBox.text = morseEncrypt(input: inputField.text!)
    }
    @IBOutlet weak var inputField: UITextField!
    
    let morseDict = [" ": "/", "a":".-", "b":"-...", "c":"-.-.", "d":"-..", "e":".", "f":"..-.",
                     "g":"--.", "h":"....", "i":"..", "j":".---", "k":"-.-", "l":".-..", "m":"--",
                     "n":"-.", "o":"---", "p":".--.", "q":"--.-", "r":".-.", "s":"...", "t":"-",
                     "u":"..-", "v":"...-", "w":".--", "x":"-..-", "y":"-.--", "z":"--..", "0":"-----",
                     "1":".----", "2":"..---", "3":"...--", "4":"....-", "5":".....", "6":"-....", "7":"--...",
                     "8":"---..", "9":"----.", ".":".-.-.-", ",":"--..--", "?":"..--..", "-":"-....-",
                     "=":"-...-", ":":"---...", ";":"-.-.-.", "(":"-.--.", ")":"-.--.-", "/":"-..-.",
                     "\"":".-..-.", "$":"...-..-", "'":".----.", "_":"..--.-", "@":".--.-.", "!":"-.-.--",
                     "+":".-.-.", "~":".-...", "#":"...-.-", "&":"-.---"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(MorseCode.dismissKeyboard)))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func dismissKeyboard() {
        inputField.resignFirstResponder()
    }

    func morseDecrypt(input: String) -> String? {
        var result = ""
        for each in input.components(separatedBy: " ") {
            for (key, val) in morseDict {
                if val == String(each) {
                    result += key
                }
            }
        }
        return result
    }

    func morseEncrypt(input: String) -> String? {
        var result = ""
        for each in input.characters {
            if let val = morseDict[String(each).lowercased()]{
                result += val + " "
            }
        }
        return result
    }

}
