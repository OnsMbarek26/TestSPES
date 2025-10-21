// Technical / deployment architecture (normalized syntax)
package technical {
    // Local Power placeholder to avoid cross-package import errors until root normalized
    partdef Power {}

    // Physical / logical deployment elements (simplified types)
    partdef EdgeGateway {
        feature powerDraw: Power; // instantaneous power consumption
    }

    partdef ZoneController {
        feature zonePowerProfile: Power; // placeholder linking to power usage of zone
    }

    partdef CloudService {
        feature processingPowerProxy: Power; // placeholder representing consumed compute resources
    }

    partdef PowerMeter {
        feature currentPower: Power;
    }

    // Illustrative deployment relationship placeholders (commented until allocation grammar confirmed)
    // allocation logical::ControlCore -> technical::EdgeGateway;
    // allocation logical::AnalyticsService -> technical::CloudService;

    // Grouping packages for deployment classification
    package onPremNodes {
        public import technical::EdgeGateway;
        public import technical::ZoneController;
        public import technical::PowerMeter;
    }

    package cloudNodes {
        public import technical::CloudService;
    }
}
