//
//  CaesarianShift.swift
//  ciphers
//
//  Created by Divyesh Chotai on 12/20/16.
//  Copyright © 2016 Divyesh Chotai. All rights reserved.
//

import UIKit

class CaesarianShift: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBAction func decryptButton(_ sender: Any) {
        if inputField.text?.isEmpty ?? true || nField.text?.isEmpty ?? true{
            return
        }
        outputField.text = caesarianShift(input: inputField.text!, offset: Int(nField.text!)!, mode: "Decrypt")
    }
    @IBAction func encryptButton(_ sender: Any) {
        if inputField.text?.isEmpty ?? true || nField.text?.isEmpty ?? true{
            return
        }
        outputField.text = caesarianShift(input: inputField.text!, offset: Int(nField.text!)!, mode: "Encrypt")
    }
    @IBOutlet weak var nField: UITextField!
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var outputField: UITextView!
    let nArray = Array(0...25)
    var nPicker = UIPickerView()
    let alphabet: [String] = ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o",
                              "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nPicker.delegate = self
        nPicker.dataSource = self
        nField.delegate = self
        nField.inputView = nPicker
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CaesarianShift.dismissKeyboard)))
    }

    func dismissKeyboard() {
        nField.resignFirstResponder()
        inputField.resignFirstResponder()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return nArray.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return String(nArray[row])
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        nField.text = String(nArray[row])
    }
    
    func caesarianShift(input: String, offset: Int, mode: String) -> String? {
        var result = ""
        var offset = offset
        if offset == 0 {
            return input
        }
        if mode == "Decrypt" {
            offset = alphabet.count - offset
        }
        for char in input.characters {
            if alphabet.contains(String(char).lowercased()) {
                var val = alphabet[(alphabet.index(of: String(char).lowercased())! + offset) % alphabet.count]
                if String(char) != String(char).lowercased() {
                    val = val.uppercased()
                }
                result += val
            } else {
                result += String(char)
            }
        }
        return result
    }
    
}
