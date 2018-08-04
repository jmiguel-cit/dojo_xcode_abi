//
//  ViewController.swift
//  ABI Device
//
//  Created by Joao Miguel Godoy Faccio on 23/06/2018.
//  Copyright © 2018 jmiguel. All rights reserved.
//

import UIKit
import Firebase
import Foundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var db: DatabaseReference!
    var dbStore: Firestore!

  
    var list = [String]()
    
    let device1 = ["codigo": "1",
                   "fabricante": "Apple",
                   "modelo": "iPhone 5S",
                   "imei": "352047061506932",
                   "observacao": "observa",
                   "patrimonio": "99999"]
    
    let device2 = ["codigo": "2",
                   "fabricante": "Apple",
                   "modelo": "iPhone 6S",
                   "imei": "353288073041133",
                   "observacao": "",
                   "patrimonio": "17994"]
    
    let device3 = ["codigo": "4",
                   "fabricante": "Apple",
                   "modelo": "iPhone 7",
                   "imei": "355327086523493",
                   "observacao": "",
                   "patrimonio": "19408"]
    
    let codigo01: [String: Any] = [
        "codigo": 1,
        "fabricante": "Apple",
        "modelo": "iPhone 5S",
        "imei": "352047061506932",
        "observacao": "observa",
        "patrimonio": "99999"
    ]
    let codigo02: [String: Any] = [
        "codigo": 2,
        "fabricante": "Apple",
        "modelo": "iPhone 6S",
        "imei": "353288073041133",
        "observacao": "",
        "patrimonio": "17994"
    ]
    let codigo04: [String: Any] = [
        "codigo": 4,
        "fabricante": "Apple",
        "modelo": "iPhone 7",
        "imei": "355327086523493",
        "observacao": "",
        "patrimonio": "19408"
    ]
    let codigo08: [String: Any] = [
        "codigo": 8,
        "fabricante": "Samsung",
        "modelo": "Samsung S7",
        "imei": "358181072290892",
        "observacao": "",
        "patrimonio": "19348"
    ]
    let codigo10: [String: Any] = [
        "codigo": 10,
        "fabricante": "Samsung",
        "modelo": "Samsung S5 Neo",
        "imei": "354613070087525",
        "observacao": "",
        "patrimonio": ""
    ]
    let codigo19: [String: Any] = [
        "codigo": 19,
        "fabricante": "Apple",
        "modelo": "Cabos USB",
        "imei": "",
        "observacao": "1",
        "patrimonio": ""
    ]
    let codigo24: [String: Any] = [
        "codigo": 24,
        "fabricante": "Android",
        "modelo": "Cabos USB",
        "imei": "",
        "observacao": "1",
        "patrimonio": ""
    ]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        cell.textLabel?.numberOfLines = 5
        
        return(cell)
    }
    

    @IBOutlet weak var labelLine1: UILabel!
    @IBOutlet weak var labelLine2: UILabel!
    @IBOutlet weak var labelLine3: UILabel!
    @IBOutlet weak var labelLine4: UILabel!
    @IBOutlet weak var labelLine5: UILabel!
    @IBOutlet weak var labelLine6: UILabel!
    @IBOutlet weak var labelLine7: UILabel!
    @IBOutlet weak var labelLine8: UILabel!
    @IBOutlet weak var labelLine9: UILabel!
    
    @IBOutlet weak var tabela: UITableView!
    
    @IBOutlet weak var imageQRCode: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        db = Database.database().reference()
        
        let settings = FirestoreSettings()
        Firestore.firestore().settings = settings
        dbStore = Firestore.firestore()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonRetirar(_ sender: Any) {
        //GLAUBER: LENDO OS DADOS DO FIRESTORE/REALTIME E IMPRIMINDO NO CONSOLE
        dbStore.collection("devices").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        
        let key = "-LIqYbFi0dDcmmooXldF"
            //Auth.auth().currentUser?.uid
        db.child("devices").child(key).observeSingleEvent(of: .value, with: { (snapshot) in
            // Get user value
            let device = snapshot.value as? NSDictionary
            
            print(device)
            // ...
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
    
    func tempRetirar(){
        //GLAUBER: PREENCHE A LISTA COM OS DEVICES NA TELA (LISTVIEW)
        var codigo = Int()
        var fabricante = String()
        var modelo = String()
        var imei = String()
        var observacao = String()
        var patrimonio = String()
        
        switch (list.count){
        case 0:
            codigo = codigo01["codigo"] as! Int
            fabricante = codigo01["fabricante"] as! String
            modelo = codigo01["modelo"] as! String
            imei = codigo01["imei"] as! String
            observacao = codigo01["observacao"] as! String
            patrimonio = codigo01["patrimonio"] as! String
        case 1:
            codigo = codigo02["codigo"] as! Int
            fabricante = codigo02["fabricante"] as! String
            modelo = codigo02["modelo"] as! String
            imei = codigo02["imei"] as! String
            observacao = codigo02["observacao"] as! String
            patrimonio = codigo02["patrimonio"] as! String
        case 2:
            codigo = codigo04["codigo"] as! Int
            fabricante = codigo04["fabricante"] as! String
            modelo = codigo04["modelo"] as! String
            imei = codigo04["imei"] as! String
            observacao = codigo04["observacao"] as! String
            patrimonio = codigo04["patrimonio"] as! String
        case 3:
            codigo = codigo08["codigo"] as! Int
            fabricante = codigo08["fabricante"] as! String
            modelo = codigo08["modelo"] as! String
            imei = codigo08["imei"] as! String
            observacao = codigo08["observacao"] as! String
            patrimonio = codigo08["patrimonio"] as! String
        case 4:
            codigo = codigo10["codigo"] as! Int
            fabricante = codigo10["fabricante"] as! String
            modelo = codigo10["modelo"] as! String
            imei = codigo10["imei"] as! String
            observacao = codigo10["observacao"] as! String
            patrimonio = codigo10["patrimonio"] as! String
        case 5:
            codigo = codigo19["codigo"] as! Int
            fabricante = codigo19["fabricante"] as! String
            modelo = codigo19["modelo"] as! String
            imei = codigo19["imei"] as! String
            observacao = codigo19["observacao"] as! String
            patrimonio = codigo19["patrimonio"] as! String
        case 6:
            codigo = codigo24["codigo"] as! Int
            fabricante = codigo24["fabricante"] as! String
            modelo = codigo24["modelo"] as! String
            imei = codigo24["imei"] as! String
            observacao = codigo24["observacao"] as! String
            patrimonio = codigo24["patrimonio"] as! String
        default:
            list.removeAll()
            tabela.reloadData()
        }
        
        let addList = "Codigo: \(codigo) \n\(fabricante): \(modelo) \nIMEI: \(imei) \n\(observacao) \n\(patrimonio)"
        
        list.append(addList)
    }
    
    @IBAction func buttonConsultar(_ sender: Any) {
        //GLAUBER: PREENCHE AS INFORMAÇÕES NOS LABELS DE DETALHES
        let codigo : Int = codigo24["codigo"] as! Int
        let fabricante : String = codigo24["fabricante"] as! String
        let modelo : String = codigo24["modelo"] as! String
        let imei : String = codigo24["imei"] as! String
        let observacao : String = codigo24["observacao"] as! String
        let patrimonio : String = codigo24["patrimonio"] as! String
        
        let asd = "Codigo: \(codigo) \n\(fabricante): \(modelo) \nIMEI: \(imei) \n\(observacao) \n\(patrimonio)"
        
        list.append(asd)
        tabela.reloadData()
        
        labelLine1.text = "Codigo: \(codigo)"
        labelLine2.text = "Fabricante: \(fabricante)"
        labelLine3.text = "Modelo: \(modelo)"
        labelLine4.text = "IMEI: \(imei)"
        labelLine5.text = "Observação: \(observacao)"
        labelLine6.text = "Patrimônio: \(patrimonio)"
        labelLine7.text = "Status: reservado"
        labelLine8.text = "Login: jmiguel"
        labelLine9.text = "Devolução prevista: 20/10/2020"
    }
    
    @IBAction func buttonDevolver(_ sender: Any) {
        //GLAUBER: LIMPA A LISTA (LISTVIEW)
        list.removeAll()
        tabela.reloadData()
    }

    @IBAction func buttonExcluir(_ sender: Any) {
        //GLAUBER: INSERE OS 3 DEVICES NO FIRESTORE, 3 MANEIRAS/OPÇÕES DIFERENTES DE FAZER

        var ref: DocumentReference? = nil
        ref = dbStore.collection("devices").addDocument(data: [
            "codigo": "1",
            "fabricante": "Apple",
            "modelo": "iPhone 5S",
            "imei": "352047061506932",
            "observacao": "observa",
            "patrimonio": "99999"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        ref = dbStore.collection("devices").addDocument(data: device2)
        { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("Document added with ID: \(ref!.documentID)")
            }
        }
        ref = dbStore.collection("devices").addDocument(data: device3)
        
    }
    
    @IBAction func buttonSincronizar(_ sender: Any) {
        //GLAUBER: LÊ UM JSON E CONVERTE EM OBJETO, E VICE-VERSA
        let jsonDict = [
            "name" : "Swift",
            "developer" : "Apple Inc.",
            "releaseDate" : [
                "format":"longStyle",
                "date": "June 2, 2014"
            ],
            "typing": ["static", "strong", "inferred"],
            "OS": ["Mac OS", "Linux", "FreeBSD"],
            "license": "Apache License 2.0",
            "website": "swift.org"
            ] as [String : Any]
        if JSONSerialization.isValidJSONObject(jsonDict) {
            if let data = try? JSONSerialization.data(withJSONObject: jsonDict, options: []) {
                print(data)
                
                let json = try? JSONSerialization.jsonObject(with: data, options: [])
                if let dictionary = json as? [String: Any],
                    let name = dictionary["name"],
                    let developer = dictionary["developer"],
                    let typing = dictionary["typing"],
                    let website = dictionary["website"] {
                    // treat it as a string key dictionary.
                    print("language name: \(name)")
                    print("language developer: \(developer)")
                    print("language typing: \(typing)")
                    print("language website: \(website)")
                }
            }
        }
    }
    @IBAction func buttonAdicionar(_ sender: Any) {
        //GLAUBER: INSERE OS 3 DEVICES NO REALTIME
        
        var key = db.childByAutoId().key
        db.child("devices").child(device1["codigo"]!).setValue(device1)

        key = db.childByAutoId().key
        db.child("devices").child(key).setValue(device2)

        key = db.childByAutoId().key
        db.child("devices").child(key).setValue(device3)
        
    }

}
