//
//  Rezervare.swift
//  pensiune
//
//  Created by Radu Tothazan on 24/05/16.
//  Copyright © 2016 Radu Tothazan. All rights reserved.
//

import Foundation
class Rezervare {
    private var nume: String!
    private var dataIncepere: Int!
    private var dataTerminare: Int!
    private var numarPersoane: Int!
    private var pretCamera: Int = 100
    private var discount: Int = 5
    
    init(nume: String, dataIncepere: Int, dataTerminare: Int, numarPersoane: Int){
        self.nume = nume
        self.dataIncepere = dataIncepere
        self.dataTerminare = dataTerminare
        self.numarPersoane = numarPersoane
    }
    init(nume: String){
        self.nume = nume
    }
    
    func getNume() ->String{
        return self.nume
    }
    func getDataIncepere() -> Int{
        return self.dataIncepere
    }
    func getDataTerminare() -> Int{
        return self.dataTerminare
    }
    func getNumarPersoane() -> Int{
        return self.numarPersoane
    }
    func getPretCamera() -> Int{
        return self.pretCamera
    }
    func getDiscount() -> Int{
        return self.discount
    }
    
    func setNume(nume: String){
        self.nume = nume
    }
    func setDataIncepere(dataIncepere: Int){
        self.dataIncepere = dataIncepere
    }
    func setDataTerminare(dataTerminare: Int){
        self.dataTerminare = dataTerminare
    }
    func setNumarPersoane(numarPersoane: Int){
        self.numarPersoane = numarPersoane
    }
    
    
    
}