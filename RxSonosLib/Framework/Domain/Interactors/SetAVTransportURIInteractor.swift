//
//  SetAVTransportURIInteractor.swift
//  RxSonosLib
//
//  Created by Deno von Selasinsky on 17.09.21.
//  Copyright © 2021 Uberweb. All rights reserved.
//

import Foundation

import RxSwift

struct SetAVTransportURIValues: RequestValues {
    let room: Room
    let masterUrl: String
}

class SetAVTransportURIInteractor: CompletableInteractor {

    typealias T = SetAVTransportURIValues
    
    private let transportRepository: TransportRepository
    
    init(transportRepository: TransportRepository) {
        self.transportRepository = transportRepository
    }
    
    func buildInteractorObservable(values: SetAVTransportURIValues?) -> Completable {
        
        guard let room = values?.room,
              let masterUrl = values?.masterUrl else {
            return Completable.error(SonosError.invalidImplementation)
        }
        
        return transportRepository.setAVTransportURI(for: room, masterURI: masterUrl)
        
    }
}
