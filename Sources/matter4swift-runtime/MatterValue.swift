// Copyright (c) 2024 Trifork A/S
//
// SPDX-License-Identifier: MIT

import Foundation
import Matter


public extension matter4swift
{
    // MARK: Structure

    struct MatterStructure
    {
        public let data:[Int:MatterDataValue]

        public init(data: [Int : MatterDataValue]) {
            self.data = data
        }

        public init(array:[[String:Any]]) throws {
            var data:[Int:matter4swift.MatterDataValue] = [:]
            try array.forEach { (elt:[String : Any]) in
                if let contextTag = elt[MTRContextTagKey] as? Int, let eltData = elt[MTRDataKey] as? [String:Any] {
                    data[contextTag] = try matter4swift.MatterDataValue(dict: eltData)
                }
            }
            self.data = data
        }

        func toArray() -> [[String:Any]]
        {
            var array:[[String:Any]] = []
            data.forEach { (key: Int, value: MatterDataValue) in
                array.append([
                    MTRContextTagKey: key,
                    MTRDataKey: value.toDictionary()
                ])
            }
            return array
        }
    }

    // MARK: Array

    struct MatterArray
    {
        public let data:[MatterDataValue]

        public init(data: [MatterDataValue]) {
            self.data = data
        }

        public init(array:Array<Dictionary<String,Any>>) throws {
            var data:[MatterDataValue] = []
            try array.forEach { (elt:Dictionary<String, Any>) in
                if let eltData = elt[MTRDataKey] as? [String:Any] {
                    data.append(try MatterDataValue(dict: eltData))
                }
            }
            self.data = data
        }

        public func toArray() -> [[String:Any]]
        {
            var array:[[String:Any]] = []
            data.forEach { (dataValue:MatterDataValue) in
                array.append([
                    MTRDataKey: dataValue.toDictionary()
                ])
            }
            return array
        }
    }

    // MARK: Data Value

    struct MatterDataValue
    {
        public let signedIntegerValue:Int?
        public let unsignedIntegerValue:UInt?
        public let booleanValue:Bool?
        public let stringValue:String?
        public let octetStringValue:[UInt8]?
        public let floatValue:Float?
        public let doubleValue:Double?
        public let structureValue:MatterStructure?
        public let arrayValue:MatterArray?

        public init()
        {
            self.signedIntegerValue = nil
            self.unsignedIntegerValue = nil
            self.booleanValue = nil
            self.stringValue = nil
            self.octetStringValue = nil
            self.floatValue = nil
            self.doubleValue = nil
            self.structureValue = nil
            self.arrayValue = nil
        }

        public init(signedIntegerValue:Int)
        {
            self.signedIntegerValue = signedIntegerValue
            self.unsignedIntegerValue = nil
            self.booleanValue = nil
            self.stringValue = nil
            self.octetStringValue = nil
            self.floatValue = nil
            self.doubleValue = nil
            self.structureValue = nil
            self.arrayValue = nil
        }

        public init(unsignedIntegerValue:UInt)
        {
            self.signedIntegerValue = nil
            self.unsignedIntegerValue = unsignedIntegerValue
            self.booleanValue = nil
            self.stringValue = nil
            self.octetStringValue = nil
            self.floatValue = nil
            self.doubleValue = nil
            self.structureValue = nil
            self.arrayValue = nil
        }

        public init(booleanValue:Bool)
        {
            self.signedIntegerValue = nil
            self.unsignedIntegerValue = nil
            self.booleanValue = booleanValue
            self.stringValue = nil
            self.octetStringValue = nil
            self.floatValue = nil
            self.doubleValue = nil
            self.structureValue = nil
            self.arrayValue = nil
        }

        public init(stringValue:String)
        {
            self.signedIntegerValue = nil
            self.unsignedIntegerValue = nil
            self.booleanValue = nil
            self.stringValue = stringValue
            self.octetStringValue = nil
            self.floatValue = nil
            self.doubleValue = nil
            self.structureValue = nil
            self.arrayValue = nil
        }

        public init(octetStringValue:[UInt8])
        {
            self.signedIntegerValue = nil
            self.unsignedIntegerValue = nil
            self.booleanValue = nil
            self.stringValue = nil
            self.octetStringValue = octetStringValue
            self.floatValue = nil
            self.doubleValue = nil
            self.structureValue = nil
            self.arrayValue = nil
        }

        public init(floatValue:Float)
        {
            self.signedIntegerValue = nil
            self.unsignedIntegerValue = nil
            self.booleanValue = nil
            self.stringValue = nil
            self.octetStringValue = nil
            self.floatValue = floatValue
            self.doubleValue = nil
            self.structureValue = nil
            self.arrayValue = nil
        }

        public init(doubleValue:Double)
        {
            self.signedIntegerValue = nil
            self.unsignedIntegerValue = nil
            self.booleanValue = nil
            self.stringValue = nil
            self.octetStringValue = nil
            self.floatValue = nil
            self.doubleValue = doubleValue
            self.structureValue = nil
            self.arrayValue = nil
        }

        public init(structureValue:matter4swift.MatterStructure)
        {
            self.signedIntegerValue = nil
            self.unsignedIntegerValue = nil
            self.booleanValue = nil
            self.stringValue = nil
            self.octetStringValue = nil
            self.floatValue = nil
            self.doubleValue = nil
            self.structureValue = structureValue
            self.arrayValue = nil
        }

        public init(arrayValue:matter4swift.MatterArray)
        {
            self.signedIntegerValue = nil
            self.unsignedIntegerValue = nil
            self.booleanValue = nil
            self.stringValue = nil
            self.octetStringValue = nil
            self.floatValue = nil
            self.doubleValue = nil
            self.structureValue = nil
            self.arrayValue = arrayValue
        }

        public init(dict:[String:Any]) throws
        {
            let rawType = dict[MTRTypeKey] as! String
            let rawValue = dict[MTRValueKey]

            var signedIntegerValue:Int? = nil
            var unsignedIntegerValue:UInt? = nil
            var booleanValue:Bool? = nil
            var stringValue:String? = nil
            var octetStringValue:[UInt8]? = nil
            var floatValue:Float? = nil
            var doubleValue:Double? = nil
            var structureValue:matter4swift.MatterStructure? = nil
            var arrayValue:matter4swift.MatterArray? = nil

            switch (rawType) {
            case MTRSignedIntegerValueType: // NSNumber object.
                signedIntegerValue = rawValue as? Int
            case MTRUnsignedIntegerValueType: // NSNumber object.
                unsignedIntegerValue = rawValue as? UInt
            case MTRBooleanValueType: // NSNumber object.
                booleanValue = rawValue as? Bool
            case MTRUTF8StringValueType: // NSString object.
                stringValue = rawValue as? String
            case MTROctetStringValueType: // NSData object.
                if let rawValue = rawValue as? Data {
                    octetStringValue = [UInt8](rawValue)
                } else {
                    throw matter4swift.DecodingError.missingData
                }
            case MTRFloatValueType: // NSNumber object.
                floatValue = rawValue as? Float
            case MTRDoubleValueType: // NSNumber object.
                doubleValue = rawValue as? Double
            case MTRNullValueType: // "value" key will not be included.
                break
            case MTRStructureValueType: // structure-value NSArray object. See below for the definition of structure-value.
                structureValue = try matter4swift.MatterStructure(array:(rawValue as! [[String:Any]]))
            case MTRArrayValueType: // Array-value NSArray object. See below for the definition of array-value.
                arrayValue = try matter4swift.MatterArray(array:rawValue as! Array<Dictionary<String,Any>>)
            default:
                throw matter4swift.DecodingError.missingData
            }

            self.signedIntegerValue = signedIntegerValue
            self.unsignedIntegerValue = unsignedIntegerValue
            self.booleanValue = booleanValue
            self.stringValue = stringValue
            self.octetStringValue = octetStringValue
            self.floatValue = floatValue
            self.doubleValue = doubleValue
            self.structureValue = structureValue
            self.arrayValue = arrayValue
        }

        public func toDictionary() -> [String:Any]
        {
            var type:String? = nil
            var value:Any? = nil
            if let signedIntegerValue = signedIntegerValue {
                type =  MTRSignedIntegerValueType
                value = NSNumber(value: signedIntegerValue)
            } else if let unsignedIntegerValue = unsignedIntegerValue {
                type = MTRUnsignedIntegerValueType
                value = NSNumber(value: unsignedIntegerValue)
            } else if let booleanValue = booleanValue {
                type = MTRBooleanValueType
                value = NSNumber(booleanLiteral: booleanValue)
            } else if let stringValue = stringValue {
                type = MTRUTF8StringValueType
                value = stringValue
            } else if let octetStringValue = octetStringValue {
                type = MTROctetStringValueType
                value = Data(octetStringValue)
            } else if let floatValue = floatValue {
                type = MTRFloatValueType
                value = floatValue
            } else if let doubleValue = doubleValue {
                type = MTRDoubleValueType
                value = doubleValue
            } else if let structureValue = structureValue {
                type = MTRStructureValueType
                value = structureValue.toArray()
            } else if let arrayValue = arrayValue {
                type = MTRArrayValueType
                value = arrayValue.toArray()
            } else {
                type = MTRNullValueType
                return [
                    MTRTypeKey: MTRNullValueType,
                ]
            }

            if let type=type, let value=value {
                return [
                    MTRTypeKey: type,
                    MTRValueKey: value
                ]
            } else {
                return [
                    MTRTypeKey: MTRNullValueType,
                ]
            }
        }
    }

    // MARK: Response Value

    struct MatterResponseValue
    {
        public let path:MTRAttributePath?
        public let data:MatterDataValue?

        public init(dict:[String:Any]) throws
        {
            if let path = dict[MTRAttributePathKey] as? MTRAttributePath {
                self.path = path
            } else {
                self.path = nil
            }
            if let data = dict[MTRDataKey] as? Dictionary<String, Any> {
                self.data = try matter4swift.MatterDataValue(dict: data)
            } else {
                self.data = nil
            }
            if dict[MTRErrorKey] != nil {
                // TODO[pdr] Decode error
                throw matter4swift.DecodingError.error(error: "An error occured")
                /*
                 let x = try! NSKeyedUnarchiver(forReadingFrom: error)
                 let y = x.decodeObject()
                 if let pl = try! PropertyListSerialization.propertyList(from: Data(error), format: nil) as? NSDictionary {
                 if let errorString = pl["$"] {}
                 }
                 if let x = pl
                 self.error = "\(pl)"
                 if let s = self.error {
                 defaultLogger.error("\(s)")
                 }
                 */
            }
        }
    }

    // MARK: Utility Functions

    func toUInt8(_ value:Int) -> UInt8
    {
        return UInt8(truncating: NSNumber(value: value))
    }


    func toUInt16(_ value:Int) -> UInt16
    {
        return UInt16(truncating: NSNumber(value: value))
    }


    func toUInt32(_ value:Int) -> UInt32
    {
        return UInt32(truncating: NSNumber(value: value))
    }


    func toUInt64(_ value:Int) -> UInt64
    {
        return UInt64(truncating: NSNumber(value: value))
    }
}
