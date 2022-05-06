//
//  TinkoffManager.swift
//  developer-toolbox
//
//  Created by Roman Guseynov on 01.05.2022.
//  Copyright © 2022 Roman Guseynov. All rights reserved.
//

import Combine
import TinkoffInvestSDK
/*
    tinkoff sandbox api = t.rKvwa1oqqCcpAgk1ZaKY_uhhZqMxNXo9msOg195PygGQ-ojCvgY-NiGfcObmZ_uueegFGU8-uuG12gsVEMFrZg
    tinkoff 3-5years_readonly = t.Lyn71G8eBneBEJRXf8y19pcj-9JMyTxycKZsiQQSZS2vjnCSfUGgLCxTuAZnraoK1seEwOx6GNkMiMWKyWk37Q
 */
final class TinkoffManager {

    let tokenProvider = DefaultTokenProvider(token: "t.Lyn71G8eBneBEJRXf8y19pcj-9JMyTxycKZsiQQSZS2vjnCSfUGgLCxTuAZnraoK1seEwOx6GNkMiMWKyWk37Q")
    lazy var sdk = TinkoffInvestSDK(tokenProvider: tokenProvider)
    var cancellables = Set<AnyCancellable>()

    init() {
        sdk.userService.getAccounts().flatMap {
            self.sdk.portfolioService.getPortfolio(accountID: $0.accounts.first!.id)
        }.sink { result in
            switch result {
              case .failure(let error):
                  print(error.localizedDescription)
              case .finished:
                  print("did finish loading getPortfolio")
              }
        } receiveValue: { portfolio in
            print(portfolio)
        }.store(in: &cancellables)
    }
}
