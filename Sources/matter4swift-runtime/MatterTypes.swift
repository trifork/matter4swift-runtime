// Copyright (c) 2024 Trifork A/S
//
// SPDX-License-Identifier: MIT

import Foundation

public extension matter4swift
{
    typealias DefaultSuccess = Void

    // MARK: Analog

    typealias Percent = UInt8
    typealias Percent100ths = UInt16

    typealias EpochUs = UInt64
    typealias EpochS = UInt32
    typealias SystimeUs = UInt64
    typealias SystimeMs = UInt64
    typealias ElapsedS = UInt32

    typealias Temperature = Int16

    // MARK: Discrete

    typealias Enum8 = UInt8
    typealias Enum16 = UInt16

    typealias Priority = Enum8
    typealias Status = Enum8

    // MARK: Identifier

    typealias GroupId = UInt16
    typealias EndpointNo = UInt16
    typealias VendorId = UInt16
    typealias DevtypeId = UInt32
    typealias FabricId = UInt64
    typealias FabricIdx = UInt8
    typealias ClusterId = UInt32
    typealias AttribId = UInt32
    typealias FieldId = UInt32
    typealias EventId = UInt32
    typealias CommandId = UInt32
    typealias ActionId = UInt8
    typealias TransactionId = UInt32
    typealias NodeId = UInt64

    typealias EntryIdx = UInt16

    typealias DataVer = UInt32
    typealias EventNo = UInt64

    // MARK: Composite

    typealias OctetString = [UInt8]
    typealias IPAdr = OctetString
    typealias IPV4Adr = OctetString
    typealias IPV6Adr = OctetString
    typealias IPV6Pre = OctetString
    typealias HWAdr = OctetString

    typealias Namespace = Enum8
    typealias Tag = Enum8
}

// MARK: Encode/Decode Extensions

public extension UInt8
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.unsignedIntegerValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(unsignedIntegerValue: UInt(self))
    }
}

public extension UInt16
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.unsignedIntegerValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(unsignedIntegerValue: UInt(self))
    }
}

public extension UInt32
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.unsignedIntegerValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(unsignedIntegerValue: UInt(self))
    }
}

public extension UInt64
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.unsignedIntegerValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(unsignedIntegerValue: UInt(self))
    }
}


public extension Int8
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.signedIntegerValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(signedIntegerValue: Int(self))
    }
}


public extension Int16
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.signedIntegerValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(signedIntegerValue: Int(self))
    }
}


public extension Int32
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.signedIntegerValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(signedIntegerValue: Int(self))
    }
}


public extension Int64
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.signedIntegerValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(signedIntegerValue: Int(self))
    }
}


public extension Float
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.floatValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(floatValue: self)
    }
}


public extension Double
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.doubleValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(doubleValue: self)
    }
}


public extension matter4swift.OctetString
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.octetStringValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(octetStringValue: self)
    }
}


public extension Bool
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.booleanValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(booleanValue: self)
    }
}


public extension String
{
    init(matterDataValue:matter4swift.MatterDataValue) throws
    {
        if let value = matterDataValue.stringValue {
            self.init(value)
        } else {
            throw matter4swift.DecodingError.missingData
        }
    }

    func toMatterDataValue() -> matter4swift.MatterDataValue {
        return matter4swift.MatterDataValue(stringValue: self)
    }
}
