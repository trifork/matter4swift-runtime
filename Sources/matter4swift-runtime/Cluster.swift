// Copyright (c) 2024 Trifork A/S
//
// SPDX-License-Identifier: MIT

import Foundation
import Matter

extension matter4swift
{
    /// Base class for all generated cluster classes.
    open class Cluster
    {
        public let controller:MTRDeviceController
        public let node:NodeId
        public let endpoint:EndpointNo
        public let cluster:ClusterId

        public lazy var device:MTRBaseDevice = {
            return MTRBaseDevice(nodeID: self.node as NSNumber, controller: self.controller)
        }()

        public init(withController controller:MTRDeviceController, node:NodeId, endpoint:EndpointNo, cluster: MTRClusterIDType)
        {
            self.controller = controller
            self.node = node
            self.endpoint = endpoint
            self.cluster = cluster.rawValue
        }

        public init(withController controller:MTRDeviceController, node:UInt64, endpoint:EndpointNo, cluster: ClusterId)
        {
            self.controller = controller
            self.node = node
            self.endpoint = endpoint
            self.cluster = cluster
        }
    }
}
