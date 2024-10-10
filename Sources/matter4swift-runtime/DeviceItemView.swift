// Copyright (c) 2024 Trifork A/S
//
// SPDX-License-Identifier: MIT

import SwiftUI

extension matter4swift
{
    public struct DeviceItemView<T: CustomStringConvertible>: View {
        var name:String
        @Binding var value:T?
        var suffix:String? = nil

        public init(name: String, value: Binding<T?>, suffix: String? = nil) {
            self.name = name
            self._value = value
            self.suffix = suffix
        }

        public var body: some View {
            HStack {
                Text(name).bold()
                if let value = value {
                    if let suffix = suffix {
                        Text("\(value.description)\(suffix)")
                    } else {
                        Text("\(value.description)")
                    }
                } else {
                    Text("nil")
                }
            }
        }
    }


    public struct StaticDeviceItemView<T: CustomStringConvertible>: View {
        var name:String
        var value:T?
        var suffix:String? = nil

        public init(name: String, value: T? = nil, suffix: String? = nil) {
            self.name = name
            self.value = value
            self.suffix = suffix
        }

        public var body: some View {
            HStack {
                Text(name).bold()
                if let value = value {
                    if let suffix = suffix {
                        Text("\(value.description)\(suffix)")
                    } else {
                        Text("\(value.description)").frame(maxWidth: .infinity, alignment: .trailing)
                    }
                } else {
                    Text("nil")
                }
            }
        }
    }
}
