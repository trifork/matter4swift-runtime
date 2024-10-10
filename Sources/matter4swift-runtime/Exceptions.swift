// Copyright (c) 2024 Trifork A/S
//
// SPDX-License-Identifier: MIT

import Foundation

extension matter4swift
{
    public enum DecodingError: Error
    {
        case missingData
        case error(error:String)
    }


    public enum ExecuteCommandError: Error
    {
        case missingInputParameter(parameterName: String)
    }


    public enum Matter4SwiftError: Error
    {
        case notYetImplemented(message:String)
    }
}
