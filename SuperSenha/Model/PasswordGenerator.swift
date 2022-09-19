//
//  PasswordGenerator.swift
//  SuperSenha
//
//  Created by Rafael Rodrigues on 10/08/22.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCharacters: Int
    var useLetters: Bool
    var useNumbers: Bool
    var useCapitalLettters: Bool
    var useSpecialCharacters: Bool
    
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let specialCharacters = "!@#$%¨&*()_-+=~´`|[{]}/?;:><.,'"
    private let numbers = "0123456789"
    
    init (numberOfCharacters: Int, useLetters: Bool, useNumbers: Bool, useCapitalLettters: Bool, useSpecialCharacters: Bool) {
        
        var numChars = min(numberOfCharacters, 16)
        numChars = max(numChars, 1)
        
        self.numberOfCharacters = numChars
        self.useLetters = useLetters
        self.useNumbers = useNumbers
        self.useCapitalLettters = useCapitalLettters
        self.useSpecialCharacters = useSpecialCharacters
        
    }
    
    func generate(total: Int) -> [String] {
        
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumbers {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLettters {
            universe += letters.uppercased()
        }
           
       let universeArray = Array(universe)
        while passwords.count < total {
            var password = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(universe.count)))
                password += String (universeArray[index])
            }
            passwords.append(password)
        }
        
        
        
        return passwords
    }
    
    
    
    
}
