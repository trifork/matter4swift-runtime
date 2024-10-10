// Copyright (c) 2024 Trifork A/S
//
// SPDX-License-Identifier: MIT

import SwiftUI


public extension matter4swift
{
    struct ForEachOrEmpty<Data, ID, ForEachContent, EmptyContent>: View where Data: RandomAccessCollection, ID: Hashable, ForEachContent: View, EmptyContent: View {
        let data: Data
        let forEachBuilder: (Data.Element) -> ForEachContent
        let emptyBuilder: () -> EmptyContent
        let identityKeyPath: KeyPath<Data.Element, ID>

        public init(_ data: Data, id: KeyPath<Data.Element, ID>, @ViewBuilder each: @escaping (Data.Element)->ForEachContent, @ViewBuilder empty: @escaping () -> EmptyContent) {
            self.data = data
            identityKeyPath = id
            forEachBuilder = each
            emptyBuilder = empty
        }


        public var body: some View {
            if data.isEmpty {
                return AnyView(emptyBuilder())
            } else {
                return AnyView(ForEach(data, id: identityKeyPath, content: forEachBuilder))
            }
        }
    }
}

public extension matter4swift.ForEachOrEmpty where ID == Data.Element.ID, Data.Element: Identifiable {
    init(_ data: Data, @ViewBuilder each: @escaping (Data.Element)->ForEachContent, @ViewBuilder empty: @escaping () -> EmptyContent) {
        self.init(data, id: \.id , each: each, empty: empty)
    }
}


public extension matter4swift
{
    struct ForEachOrEmpty_Previews: PreviewProvider {
        static let someNumbers = [1,2,3]
        static let noNumbers: [Int] = []

        struct IDString: Identifiable {
            let value: String
            var id: String { value }
            init(_ value: String) { self.value = value }
        }
        static let someLetters = [IDString("a"), IDString("b"), IDString("c")]
        static let noLetters: [IDString] = []


        public static var previews: some View {
            Group {
                VStack {
                    Divider()
                    ForEachOrEmpty(someNumbers, id: \.self, each: { number in
                        VStack {
                            Text("number \(number)")
                            Divider()
                        }
                    }, empty: {
                        VStack {
                            Text("None")
                            Divider()
                        }
                    })
                }

                VStack {
                    Divider()
                    ForEachOrEmpty(noNumbers, id: \.self, each: { number in
                        VStack {
                            Text("number \(number)")
                            Divider()
                        }
                    }, empty: {
                        VStack {
                            Text("None")
                            Divider()
                        }
                    })
                }

                VStack {
                    Divider()
                    ForEachOrEmpty(someLetters, each: { letter in
                        VStack {
                            Text(letter.value)
                            Divider()
                        }
                    }, empty: {
                        VStack {
                            Text("None")
                            Divider()
                        }
                    })
                }

                VStack {
                    Divider()
                    ForEachOrEmpty(noLetters, each: { letter in
                        VStack {
                            Text(letter.value)
                            Divider()
                        }
                    }, empty: {
                        VStack {
                            Text("None")
                            Divider()
                        }
                    })
                }

            }.previewLayout(.sizeThatFits)
        }
    }
}
