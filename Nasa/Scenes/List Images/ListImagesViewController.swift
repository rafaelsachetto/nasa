//
//  ListImagesViewController.swift
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
import SnapKit

protocol ListImagesDisplayLogic: class {
    func displaySegmentedControl(with viewModel: ListImages.Cameras.ViewModel)
}

final class ListImagesViewController: UICollectionViewController {
    var interactor: ListImagesBusinessLogic?
    var router: (NSObjectProtocol & ListImagesRoutingLogic & ListImagesDataPassing)?

    // MARK: Object lifecycle

    convenience init() {
        self.init(collectionViewLayout: .init())
    }

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor: ListImagesInteractor = .init()
        let presenter: ListImagesPresenter = .init()
        let router: ListImagesRouter = .init()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }

    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        doSegmentedControl()
        collectionView.backgroundColor = .white
        title = "Mars Rovers Photos"
    }

    func doSegmentedControl() {
        let request: ListImages.Cameras.Request = .init()
        interactor?.doSegmentedControl(with: request)
    }

}

extension ListImagesViewController: ListImagesDisplayLogic {
    func displaySegmentedControl(with viewModel: ListImages.Cameras.ViewModel) {
        addSegmentedControl(with: viewModel.cameras)
    }
}

extension ListImagesViewController {
    func addSegmentedControl(with items: [String]) {
        let segmentedItems: [String] = items
        let segmentedControl: UISegmentedControl = .init(items: segmentedItems)
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action: #selector(indexChanged(_:)), for: .valueChanged)
        view.addSubview(segmentedControl)

        segmentedControl.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
            make.leading.trailing.equalTo(view.safeAreaLayoutGuide)
        }
    }

    @objc func indexChanged(_ sender: UISegmentedControl) {
        print(ListImages.Cameras(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex)!.lowercased())! == ListImages.Cameras.opportunity)
    }
}
