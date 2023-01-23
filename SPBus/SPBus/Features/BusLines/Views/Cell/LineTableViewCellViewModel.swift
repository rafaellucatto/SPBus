//
//  LineTableViewCellViewModel.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

final class LineTableViewCellViewModel {

    private let lineCellModel: LineTableViewCellModel

    init(lineCellModel: LineTableViewCellModel) {
        self.lineCellModel = lineCellModel
    }

    var rowNumber: String {
        let row: Int = lineCellModel.rowNumber + 1
        return row.description
    }

    var lineLabel: String {
        return """
Código identificador da linha: \(lineCellModel.line.cl)
É circular: \(lineCellModel.line.lc ? "sim" : "não")
Letreiro numérico 1a parte: \(lineCellModel.line.lt)
Letreiro numérico 2a parte: \(lineCellModel.line.tl)
Sentido da linha: \(lineCellModel.line.sl == 1 ? "para terminal secundário" : "para terminal principal")
Letreiro em direção ao terminal secundário: \(lineCellModel.line.tp)
Letreiro em direção ao terminal principal: \(lineCellModel.line.ts)
"""
    }
}

struct LineTableViewCellModel {
    let rowNumber: Int
    let line: Line
}
