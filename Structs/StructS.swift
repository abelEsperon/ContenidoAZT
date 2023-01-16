//
//  StructS.swift
//  ContenidoAZT
//
//  Created by Abel Gonzalez on 22/09/22.
//

import Foundation

struct Sitio: Codable {
    let data: [Datos]
    }

// MARK: - Datos
struct Datos: Codable {
    let url: String
    let title: String
    }

