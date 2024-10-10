// Copyright (c) 2024 Trifork A/S
//
// SPDX-License-Identifier: MIT

import SwiftUI


extension matter4swift
{
    public protocol NativeType {
        associatedtype V: View
        @ViewBuilder static func inputField(_ binding: Binding<Self?>) -> Self.V
    }

    public struct NativeTypeInputView<ValueType: NativeType>: View {
        @Binding var field: ValueType?

        public init(field: Binding<ValueType?>) {
            self._field = field
        }

        public var body: some View {
            ValueType.inputField($field)
        }
    }

    public struct BoolInputView: View {
        @Binding var field:Bool?

        public init(field: Binding<Bool?>) {
            self._field = field
        }

        public var body: some View {
            TextField("Bool", value: $field, formatter: NumberFormatter())
            #if os(iOS)
                .keyboardType(.numberPad)
            #endif
        }
    }

    public struct StringInputView: View {
        @Binding var field:String?

        public init(field: Binding<String?>) {
            self._field = field
        }

        public var body: some View {
            Text("TODO: StringInputView")
            // TODO[pdr] TextField("String", text: $field ?? "")
        }
    }

    /// Input view for OctetString.
    ///
    /// The user must input a sequence of 8-bit hexadecimal numbers,
    /// e.g. `000102030405060708090a0b0c0d0e0f10`.
    ///
    /// The input will be validated and converted to a
    /// list of `UInt8`'s. On invalid input `field` will
    /// be set to `nil`.
    public struct OctetStringInputView: View {
        @Binding var field:OctetString?

        @State private var string: String = ""
        @State private var errorMessage: String = ""

        public init(field: Binding<OctetString?>) {
            self._field = field
        }

        public var body: some View {
            HStack {
                TextField("OctetString", text:$string)
                Spacer()
                Text(errorMessage).foregroundStyle(.red)
            }
            .onChange(of: string) {
                self.stringToField()
            }
            .onChange(of: field) { oldValue, newValue in
                self.fieldToString()
            }
        }

        /// Update `field` with the value of `string`.
        private func stringToField() {
            let length = string.count
            if length % 2 == 1 {
                self.errorMessage = "Invalid"
                self.field = nil
            } else {
                var bytes = [UInt8]()
                bytes.reserveCapacity(length/2)
                var index = string.startIndex
                for _ in 0..<length/2 {
                    let nextIndex = string.index(index, offsetBy: 2)
                    if let b = UInt8(string[index..<nextIndex], radix: 16) {
                        bytes.append(b)
                    } else {
                        self.errorMessage = "Invalid"
                        self.field = nil
                        return
                    }
                    index = nextIndex
                }
                self.errorMessage = ""
                self.field = bytes
            }
        }

        private func fieldToString() {
            if let value = $field.wrappedValue {
                let s = value.map{ String(format:"%02X", $0) }.joined(separator: "")
                self.string = s
            } else {
                self.string = ""
            }
        }
    }

    public struct ListInputView<T>: View {
        @Binding var field:[T]?

        public init(field: Binding<[T]?>) {
            self._field = field
        }

        public var body: some View {
            Text("TODO: ListView")
            // TODO[pdr]
        }
    }

    public typealias UInt8InputView = NativeTypeInputView<UInt8>
    public typealias UInt16InputView = NativeTypeInputView<UInt16>
    public typealias UInt32InputView = NativeTypeInputView<UInt32>
    public typealias UInt64InputView = NativeTypeInputView<UInt64>
    public typealias Int8InputView = NativeTypeInputView<Int8>
    public typealias Int16InputView = NativeTypeInputView<Int16>
    public typealias Int32InputView = NativeTypeInputView<Int32>
    public typealias Int64InputView = NativeTypeInputView<Int64>

    public typealias GroupIdInputView = NativeTypeInputView<GroupId>
    public typealias ClusterIdInputView = NativeTypeInputView<ClusterId>
    public typealias EndpointNoInputView = NativeTypeInputView<EndpointNo>
    public typealias DevtypeIdInputView = NativeTypeInputView<DevtypeId>
    public typealias FabricIdxInputView = NativeTypeInputView<FabricIdx>
    public typealias VendorIdInputView = NativeTypeInputView<VendorId>
    public typealias EpochUsInputView = NativeTypeInputView<EpochUs>
    public typealias Percent100thsInputView = NativeTypeInputView<Percent100ths>
    public typealias NodeIdInputView = NativeTypeInputView<NodeId>
    public typealias TemperatureInputView = NativeTypeInputView<Temperature>
    public typealias EpochSInputView = NativeTypeInputView<EpochS>
    public typealias ElapsedSInputView = NativeTypeInputView<ElapsedS>
    public typealias PercentInputView = NativeTypeInputView<Percent>
}

extension UInt8: matter4swift.NativeType {
    public static func inputField(_ binding: Binding<Self?>) -> some View {
        TextField("UInt8", value: binding, format: .number)
            #if os(iOS)
            .keyboardType(.numberPad)
            #endif
            .foregroundColor(.primary)
    }
}

extension UInt16: matter4swift.NativeType {
    public static func inputField(_ binding: Binding<Self?>) -> some View {
        TextField("UInt16", value: binding, format: .number)
            #if os(iOS)
            .keyboardType(.numberPad)
            #endif
            .foregroundColor(.primary)
    }
}


extension UInt32: matter4swift.NativeType {
    public static func inputField(_ binding: Binding<Self?>) -> some View {
        TextField("UInt32", value: binding, format: .number)
            #if os(iOS)
            .keyboardType(.numberPad)
            #endif
            .foregroundColor(.primary)
    }
}

extension UInt64: matter4swift.NativeType {
    public static func inputField(_ binding: Binding<Self?>) -> some View {
        TextField("UInt64", value: binding, format: .number)
            #if os(iOS)
            .keyboardType(.numberPad)
            #endif
            .foregroundColor(.primary)
    }
}

extension Int8: matter4swift.NativeType {
    public static func inputField(_ binding: Binding<Self?>) -> some View {
        TextField("Int8", value: binding, format: .number)
            #if os(iOS)
            .keyboardType(.numberPad)
            #endif
            .foregroundColor(.primary)
    }
}

extension Int16: matter4swift.NativeType {
    public static func inputField(_ binding: Binding<Self?>) -> some View {
        TextField("Int16", value: binding, format: .number)
            #if os(iOS)
            .keyboardType(.numberPad)
            #endif
            .foregroundColor(.primary)
    }
}


extension Int32: matter4swift.NativeType {
    public static func inputField(_ binding: Binding<Self?>) -> some View {
        TextField("Int32", value: binding, format: .number)
            #if os(iOS)
            .keyboardType(.numberPad)
            #endif
            .foregroundColor(.primary)
    }
}

extension Int64: matter4swift.NativeType {
    public static func inputField(_ binding: Binding<Self?>) -> some View {
        TextField("Int64", value: binding, format: .number)
            #if os(iOS)
            .keyboardType(.numberPad)
            #endif
            .foregroundColor(.primary)
    }
}
