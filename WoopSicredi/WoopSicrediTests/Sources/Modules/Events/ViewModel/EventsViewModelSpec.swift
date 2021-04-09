//
//  EventsViewModelSpec.swift
//  WoopSicrediTests
//
//  Created by Luann Marques Luna on 09/04/21.
//

import Quick
import Nimble

@testable import WoopSicredi

class EventsViewModelSpec: QuickSpec {
    
    var sut: EventsViewModel!
    var eventsServiceMock: EventsServiceMock!
    
    override func spec() {
        describe("EventsViewModel") {
            
            context("when fetch events with success") {
                
                beforeEach {
                    self.buildServiceMock(with: .success)
                }
                
                it("then events could not be zero") {
                    expect(self.sut.numberOfEvents).toNot(be(0))
                }

            }
            
            context("when fetch events with failure") {
                
                beforeEach {
                    self.buildServiceMock(with: .failure)
                }
                
                it("then genres should be zero") {
                    expect(self.sut.numberOfEvents).to(be(0))
                }
                
            }
            
            context("when fetch events with id") {
                
                beforeEach {
                    self.buildServiceMock(with: .success)
                }
                
                it("then first event id must be 1") {
                    expect(self.sut.elementAt(index: 0)?.id).to(equal("1"))
                }
                
            }
            
            context("when fetch events with id failure") {
                
                beforeEach {
                    self.buildServiceMock(with: .failure)
                }
                
                it("then first event id should be nil") {
                    expect(self.sut.elementAt(index: 0)?.id).to(beNil())
                }
                
            }
            
        }
        
    }
    
}

extension EventsViewModelSpec {
    
    func buildServiceMock(with result: ResultCase) {
        self.eventsServiceMock = EventsServiceMock(result: result)
        self.buildViewModel(eventsServiceMock)
    }
    
    func buildViewModel(_ eventsServiceMock: EventsServiceMock) {
        sut = EventsViewModel(service: eventsServiceMock)
        sut.fetchData {}
    }
}
