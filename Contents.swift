//: Playground - noun: a place where people can play

import Cocoa

//# Encode RodPost #

let tab:[String] = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"]
//print("tab.count :", tab.count)


// Crypter le message en RodPost
func messageCrypt(message: String) -> String {
    let msg = message.uppercased()
    var i = 0
    let msgTab = Array(msg)
    var msgCrypt = [String]()
    
    while i < msg.count {
        let letter = msgTab[i]
        
        // Gérer les characters spéciaux afin de les laisser dans le message
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if String(letter).rangeOfCharacter(from: characterset.inverted) != nil {
            msgCrypt.append(String(letter))
        } else {
           
            let indexOf = tab.index(of: String(letter))
            let newIndex = indexOf! + i + 1
            //print("newIndex:", newIndex)
            
            let IntNewIndexOf = (newIndex % tab.count)
            //print("% :",IntNewIndexOf)
            
            let newIndexOf = tab[IntNewIndexOf]
            
            msgCrypt.append(newIndexOf)
        }
        
        i = i + 1
    }
    return msgCrypt.joined()
}

messageCrypt(message: "salut toi comment vas-tu ?")

// Décrypter le message en RodPost
func messageDecrypt(message: String) -> String {
    let msg = message.uppercased()
    var i = 0
    let msgTab = Array(msg)
    var msgDecrypt = [String]()
    
    while i < msg.count {
        let letter = msgTab[i]
        
        let characterset = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789")
        if String(letter).rangeOfCharacter(from: characterset.inverted) != nil {
            msgDecrypt.append(String(letter))
        } else {
            print(letter)
            print(tab[i % tab.count])
            let indexOf = tab.index(of: String(letter))
            var newIndex = indexOf! - i - 1
            
            if newIndex < 0 {
                newIndex = tab.count + newIndex
            }
            
            print("newIndex:", newIndex)
            
            let IntNewIndexOf = (newIndex % tab.count)
            print("% :",IntNewIndexOf)
            
            let newIndexOf = tab[IntNewIndexOf]
            
            msgDecrypt.append(newIndexOf)
        }
        
        i = i + 1
    }
    return msgDecrypt.joined()
}

messageDecrypt(message: "TCOYY AWR NAZATDK OUN-QS ?")

/* ----------- ENIGMA --------------*/

/*
 
 r : [[Int]]
 var mult = 1
 for i (r.count - 1) ... 0 {
 resultat = resultat + mult * r[i][pos ‰ r[i].count]
 
 mult = mult * 10
 }
 exemple :
 [[1,2,3],[1,2],[1,2,3,4,5]]
 mult = 1
 i = 2
 resultat = 0 + 1 * 4 = 4
 mult = 1 * 10
 
 i = 1
 resultat = 4 + 10 * (2) = 24
 mult = 10 * 10
 
 i = 0
 resultat  = 24 + 100 * 1 = 124
 
 
*/

//let rotors:[[Int]] = [[1,2,3],[1,2],[1,2,3,4,5]]
//var mult = 1
//var pos = 19
//var resultat
//
//for i in (rotors.count - 1)...0 {
//   resultat = resultat + mult * rotors[i][pos ‰ rotors[i].count]
//    mult = mult * 10
//    print(resultat)
//}

/*
 
 Enigma en Français :
 - Alors chaque lettre correspond à une suite de chiffre qui sont définis par des rotors
 - Les rotors sont aux nombres de 3
 - 1 er rotor : [1,2,3]; 2ème rotor : [1,2]; 3ème rotor : [1,2,3,4,5]
 - Pour chaque lettre on fait tourner le rotor de 1
 - ce qui nous donne pour la 1ère lettre : 111 -> le résultat
 - la 2 ème : 222
 - etc... jusqu' à la dernière lettre
 - enfin pour décrypter la lettre on fait : position de la lettre dans l'alphabet + résultat % 26
 
 */












