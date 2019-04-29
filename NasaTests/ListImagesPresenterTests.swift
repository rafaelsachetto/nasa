//
//  ListImagesPresenterTests.swift
//  Nasa
//
//  Created by Rafael Sachetto on 20/04/19.
//  Copyright (c) 2019 Rafael Sachetto. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

@testable import Nasa
import XCTest

final class ListImagesPresenterTests: XCTestCase {
    // MARK: Subject under test

    var sut: ListImagesPresenter!

    // MARK: Test lifecycle

    override func setUp() {
        super.setUp()
        setupListImagesPresenter()
    }

    override func tearDown() {
        super.tearDown()
    }

    // MARK: Test setup

    func setupListImagesPresenter() {
        sut = ListImagesPresenter()
    }

    // MARK: Test doubles

    final class ListImagesDisplayLogicSpy: ListImagesDisplayLogic {
        var displaySomethingCalled = false

        func displaySomething(with viewModel: ListImages.Something.ViewModel) {
            displaySomethingCalled = true
        }
    }

    // MARK: Tests

    func testPresentSomething() {
        // Given
        let spy = ListImagesDisplayLogicSpy()
        sut.viewController = spy
        let response = ListImages.Something.Response()

        // When
        sut.presentSomething(with: response)

        // Then
        XCTAssertTrue(spy.displaySomethingCalled, "presentSomething(response:) should ask the view controller to display the result")
    }
}
