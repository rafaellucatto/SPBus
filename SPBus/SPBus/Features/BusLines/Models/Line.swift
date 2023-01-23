//
//  Line.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

struct Line: Decodable {
    /// código identificador da linha
    var cl: Int = 0
    /// é linha circular
    var lc: Bool = false
    /// primeira parte do letreiro numérico
    var lt: String = ""
    /// sentido da linha (1 = terminal principal para secundário; 2 = segundário para principal)
    var sl: Int = 0
    /// segunda parte do letreiro numérico
    var tl: Int = 0
    /// letreiro partindo do terminal principal
    var tp: String = ""
    /// letreiro partindo do terminal secundário
    var ts: String = ""
}
