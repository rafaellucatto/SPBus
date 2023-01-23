//
//  BusLineViewModel.swift
//  SPBus
//
//  Created by Rafael Lucatto on 1/22/23.
//

import Business
import Core
import Foundation

protocol BusLineViewModelProtocol {

    var requestManager: RequestManagerProtocol { get set }
    var lines: [Line] { get set }
    var numberOfRows: Int { get }
    var screenTitle: String { get }
    var busLineViewDelegate: BusLineViewModelDelegate? { get set }

    func handleResult(search: String)
    func setupInitialView()
    func getLines(text: String)

}

protocol BusLineViewModelDelegate: AnyObject {

    func displayActivityIndicator()
    func displayNoResultMessage()
    func reloadTableViewData()

}

final class BusLineViewModel {

    var lines: [Line] = []
    var numberOfRows: Int { lines.count }
    var requestManager: RequestManagerProtocol = RequestManager.shared
    var screenTitle: String { K.MainScreen.line }

    weak var busLineViewDelegate: BusLineViewModelDelegate?

    func getLines(text: String) {
        lines.removeAll()
        let url: String = "\(K.Urls.baseUrl)\(K.Urls.Lines.byLine)\(text)"
        
        requestManager.fetchListDataFromSPTransForArray(expectedType: Line.self, url: url) { [weak self] result in
            switch result {
            case .success(let _lines):
                self?.lines = _lines
                if let count = self?.lines.count, count > 0 {
                    self?.busLineViewDelegate?.reloadTableViewData()
                    return
                }
                self?.busLineViewDelegate?.displayNoResultMessage()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}

extension BusLineViewModel: BusLineViewModelProtocol {

    func handleResult(search: String) {
        busLineViewDelegate?.displayActivityIndicator()
        let testString: String = search.trimmingCharacters(in: .whitespacesAndNewlines)
        let range: NSRange = .init(location: 0, length: testString.utf16.count)
        let regex: NSRegularExpression = try! .init(pattern: "[0-9]+")
        if (regex.firstMatch(in: testString, options: [], range: range) != nil) {
            getLines(text: testString)
        }
    }

    func setupInitialView() {
        busLineViewDelegate?.displayNoResultMessage()
    }

}
