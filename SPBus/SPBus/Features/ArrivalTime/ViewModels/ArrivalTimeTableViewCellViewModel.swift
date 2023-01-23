//
//  ArrivalTimeTableViewCellViewModel.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

final class ArrivalTimeTableViewCellViewModel {
    
    private let arrivalTimeCellModel: ArrivalTimeCellModel
    
    init(arrivalTimeCellModel: ArrivalTimeCellModel) {
        self.arrivalTimeCellModel = arrivalTimeCellModel
    }
    
    var rowNumberLabel: String {
        let rowNumber: Int = arrivalTimeCellModel.rowNumberLabel + 1
        return rowNumber.description
    }

    var lineWiseLabel: String {
        return """
        Horário de chegada: \(arrivalTimeCellModel.arrivalTime)
        Destino: \(arrivalTimeCellModel.lineDestination)
        """
    }
}

struct ArrivalTimeCellModel {
    let rowNumberLabel: Int
    let arrivalTime: String
    let lineDestination: String
}
