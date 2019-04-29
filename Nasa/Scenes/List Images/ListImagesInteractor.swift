//
//  ListImagesInteractor.swift
//  Nasa
//
//  Created by Rafael Sachetto on 28/04/19.
//  Copyright (c) 2019 Rafael Sachetto. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol ListImagesBusinessLogic {
    func doSegmentedControl(with request: ListImages.Cameras.Request)
}

protocol ListImagesDataStore {
    //var name: String { get set }
}

final class ListImagesInteractor: ListImagesBusinessLogic, ListImagesDataStore {
    var presenter: ListImagesPresentationLogic?
    var worker: ListImagesWorker?
    //var name: String = ""

    // MARK: Do something
    func doSegmentedControl(with request: ListImages.Cameras.Request) {
        let response: ListImages.Cameras.Response = .init()
        presenter?.presentSegmentedControl(with: response)
    }
}
