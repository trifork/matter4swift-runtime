// Copyright (c) 2024 Trifork A/S
//
// SPDX-License-Identifier: MIT

import SwiftUI

extension matter4swift
{
    public struct PleaseWaitView: View {
        public init() {
        }

        public var body: some View {
            ZStack {
                Color(white: 1, opacity: 0.85)
                ProgressView("Please Wait").tint(.black)
            }
        }
    }
}
