//
//  SitioAZT.swift
//  ContenidoAZT
//
//  Created by Abel Gonzalez on 22/09/22.
//
import Foundation

// MARK: - Welcome
struct Content: Codable {
    let items: [Item]
}

// MARK: - Item
struct Item: Codable {
    let firebasescreen, firebaseTipo, tituloselcolor, tipo: String
    let imagetv: String
    let itemPrivate: String
    let programa: String
    let imagen: String
    let firebaseScreen, titulounselcolor: String
    
    enum CodingKeys: String, CodingKey {
        case firebasescreen
        case firebaseTipo = "firebase_tipo"
        case tituloselcolor, tipo, imagetv
        case itemPrivate = "private"
        case programa, imagen
        case firebaseScreen = "firebase_screen"
        case titulounselcolor
    }
}

