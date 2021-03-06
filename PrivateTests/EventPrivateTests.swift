//
//  EventPrivateTests.swift
//  PredictionIOSDK
//
//  Created by Minh Tu Le on 3/6/15.
//  Copyright (c) 2015 PredictionIO. All rights reserved.
//

import XCTest

class EventPrivateTests: XCTestCase {

    func testToDictionary() {
        let event = Event(
            event: "rate",
            entityType: "customer",
            entityID: "c1",
            targetEntityType: "book",
            targetEntityID: "b1",
            properties: ["rating": 5],
            eventTime: NSDate(timeIntervalSince1970: 0)
        )
        
        let eventDictionary = event.toDictionary()
        let properties = eventDictionary["properties"] as? [String: AnyObject]
        
        XCTAssert(eventDictionary["event"] as? String == "rate", "Event name should be \"rate\"")
        XCTAssert(eventDictionary["entityType"] as? String == "customer", "Entity type should be \"customer\"")
        XCTAssert(eventDictionary["entityId"] as? String == "c1", "Entity ID should be \"c1\"")
        XCTAssert(eventDictionary["targetEntityType"] as? String == "book", "Target entity type should be \"book\"")
        XCTAssert(eventDictionary["targetEntityId"] as? String == "b1", "Target entity ID should be \"rate\"")
        XCTAssert(properties?["rating"] as? Int == 5, "Rating should be 5")
        XCTAssert(eventDictionary["eventTime"] as? String == "1970-01-01T00:00:00.000Z", "Event date should be 1970-01-01T00:00:00.000Z")
    }
    
    func testToDictionaryWithoutOptionalParameters() {
        let event = Event(
            event: "rate",
            entityType: "customer",
            entityID: "c1"
        )
        
        let eventDictionary = event.toDictionary()
        
        XCTAssert(eventDictionary["event"] as? String == "rate", "Event name should be \"rate\"")
        XCTAssert(eventDictionary["entityType"] as? String == "customer", "Entity type should be \"customer\"")
        XCTAssert(eventDictionary["entityId"] as? String == "c1", "Entity ID should be \"c1\"")
        XCTAssertNil(eventDictionary["targetEntityType"], "Target entity type should be nil")
        XCTAssertNil(eventDictionary["targetEntityId"], "Target entity ID should be nil")
        XCTAssertNil(eventDictionary["properties"], "Rating should be nil")
        XCTAssertNotNil(eventDictionary["eventTime"], "Event date should not be nil")
    }
}
