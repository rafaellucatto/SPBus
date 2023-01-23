//
//  ArrivalTimeViewModel+Extension.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Foundation

extension ArrivalTimeViewModel: ArrivalTimeViewModelProtocol {

    func handleResult(search: String) {
        arrivalTimeViewModelDelegate?.displayActivityIndicator()
        let testString: String = search.trimmingCharacters(in: .whitespacesAndNewlines)
        let range: NSRange = .init(location: 0, length: testString.utf16.count)
        let regex: NSRegularExpression = try! .init(pattern: "[0-9]+")
        if (regex.firstMatch(in: testString, options: [], range: range) != nil) {
            getArrivalTimes(text: testString)
        }
    }

    func setupInitialView() {
        arrivalTimeViewModelDelegate?.displayNoResultMessage()
    }

}
