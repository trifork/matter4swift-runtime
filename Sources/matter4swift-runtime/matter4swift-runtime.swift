// Copyright (c) 2024 Trifork A/S
//
// SPDX-License-Identifier: MIT

import OSLog

var defaultLogger = Logger()

public enum matter4swift
{
}

extension matter4swift.MatterStructure : CustomStringConvertible
{
    public var description: String {
        let substrings = data.map { (key: Int, value: matter4swift.MatterDataValue) in
            "\(key):\(value)"
        }
        return "{" + substrings.joined(separator: ", ") + "}"
    }
}

extension matter4swift.MatterArray : CustomStringConvertible
{
    public var description: String {
        let substrings:[String] = data.map { dataValue in
            dataValue.description
        }
        return "matter4swift.MatterArray:[" + substrings.joined(separator: ", ") + "]"
    }
}

extension matter4swift.MatterDataValue : CustomStringConvertible
{
    public var description: String {
        if let signedIntegerValue = signedIntegerValue {
            return "signedIntegerValue:\(signedIntegerValue)"
        } else if let unsignedIntegerValue = unsignedIntegerValue {
            return "unsignedIntegerValue:\(unsignedIntegerValue)"
        } else if let booleanValue = booleanValue {
            return "booleanValue:\(booleanValue)"
        } else if let stringValue = stringValue {
            return "stringValue:\(stringValue)"
        } else if let octetStringValue = octetStringValue {
            return "octetStringValue:\(octetStringValue)"
        } else if let floatValue = floatValue {
            return "floatValue:\(floatValue)"
        } else if let doubleValue = doubleValue {
            return "doubleValue:\(doubleValue)"
        } else if let structureValue = structureValue {
            return "structureValue:\(structureValue)"
        } else if let arrayValue = arrayValue {
            return "arrayValue:\(arrayValue)"
        } else {
            return "<nil>"
        }
    }
}

extension matter4swift.MatterResponseValue : CustomStringConvertible
{
    public var description: String {
        var path:String
        var data:String
        if self.path != nil {
            path = self.path!.description
        } else {
            path = "<no path>"
        }
        if self.data != nil {
            data = self.data!.description
        } else {
            data = "<no data>"
        }

        return "\(path):\(data)"
    }
}
