//
//  RoundUpViewControllerUnitTests.swift
//  RoundUpTests
//
//  Created by Jordi Gámez on 14/07/2019.
//  Copyright © 2019 JordiGamez. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import RoundUp

/// RoundUpViewController unit tests
class RoundUpViewControllerUnitTests: QuickSpec {
    
    // MARK: - Mocks
    
    class MockRoundUpPresenter: RoundUpPresenterProtocol {
        
        var bindIsCalled = false
        var transferSavingsIsCalled = false
        var viewDidLoadIsCalled = false
        var viewWillAppearIsCalled = false
        var viewDidAppearIsCalled = false
        var viewWillDisappearIsCalled = false
        var viewDidDisappearIsCalled = false
        
        func bind(view: RoundUpViewControllerProtocol) {
            bindIsCalled = true
        }
        
        func transferSavings(amount: CGFloat) {
            transferSavingsIsCalled = true
        }
        
        func viewDidLoad() {
            viewDidLoadIsCalled = true
        }
        
        func viewWillAppear() {
            viewWillAppearIsCalled = true
        }
        
        func viewDidAppear() {
            viewDidAppearIsCalled = true
        }
        
        func viewWillDisappear() {
            viewWillDisappearIsCalled = true
        }
        
        func viewDidDisappear() {
            viewDidDisappearIsCalled = true
        }
    }
    
    // MARK: - Tests
    
    override func spec() {
        
        // MARK: Variables
        
        var viewController: RoundUpViewController?
        var presenter: MockRoundUpPresenter?
        
        // MARK: Tests
        
        beforeEach {
            presenter = MockRoundUpPresenter()
            viewController = RoundUpViewController()
        }
        describe("when viewDidLoad is called") {
            context("given a valid presenter") {
                beforeEach {
                    viewController?.presenter = presenter
                    viewController?.viewDidLoad()
                }
                it("should call bind presenter method") {
                    expect(presenter?.bindIsCalled).to(beTrue())
                }
                it("should call viewDidLoad presenter method") {
                    expect(presenter?.viewDidLoadIsCalled).to(beTrue())
                }
            }
        }
        describe("when setupView is called") {
            context("given a valid protocol conformance") {
                beforeEach {
                    viewController?.setupView()
                }
                it("should set the background color to white") {
                    expect(viewController?.view.backgroundColor).to(equal(UIColor.white))
                }
            }
        }
        describe("when displayTotalSavedAmount is called") {
            context("given a valid protocol conformance") {
                beforeEach {
                    viewController?.loadView()
                    viewController?.displayTotalSavedAmount(value: 1000)
                }
                it("should set the totalSavedAmount value to 1000") {
                    expect(viewController?.totalSavedAmount).to(equal(1000))
                }
                it("should set the totalSavingsValueLabel text value to £1000") {
                    expect(viewController?.totalSavingsValueLabel.text).to(equal("£1000.0"))
                }
                it("should set the totalSavingsValueLabel isHidden to false") {
                    expect(viewController?.totalSavingsValueLabel.isHidden).to(beFalse())
                }
            }
        }
        describe("when displayTranferSuccessfullyMade is called") {
            context("given a valid protocol conformance") {
                beforeEach {
                    viewController?.loadView()
                    viewController?.displayTranferSuccessfullyMade()
                }
                it("should set the transferSavingsButton isHidden to true") {
                    expect(viewController?.transferSavingsButton.isHidden).to(beTrue())
                }
                it("should set the transferDoneLabel text value to Transfer complete") {
                    expect(viewController?.transferDoneLabel.text).to(equal("Transfer complete"))
                }
                it("should set the transferDoneLabel isHidden to false") {
                    expect(viewController?.transferDoneLabel.isHidden).to(beFalse())
                }
                it("should set the totalSavingsValueLabel text value to £0") {
                    expect(viewController?.totalSavingsValueLabel.text).to(equal("£0"))
                }
            }
        }
        describe("when showError is called") {
            context("given a valid protocol conformance") {
                beforeEach {
                    viewController?.loadView()
                    viewController?.showError()
                }
                it("should do nothing") {}
            }
        }
        describe("when transferSavingsButton is called using .touchUpInside") {
            context("given a valid protocol conformance") {
                beforeEach {
                    viewController?.presenter = presenter
                    viewController?.viewDidLoad()
                    viewController?.loadView()
                    viewController?.transferSavingsButton.sendActions(for: .touchUpInside)
                }
                it("should call the presenter transferSavingsIsCalled method") {
                    expect(presenter?.transferSavingsIsCalled).to(beTrue())
                }
            }
        }
    }
}
