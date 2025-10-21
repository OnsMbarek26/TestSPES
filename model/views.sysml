// Views & viewpoints
package views {
    viewpointdef ComfortViewpoint { concern requirements::SystemComfortRangeReq; }
    viewpointdef EnergyViewpoint { concern requirements::SystemEnergyReductionReq; }
    viewpointdef AirQualityViewpoint { concern requirements::SystemCO2LimitReq; }

    viewdef ComfortOperationalView { viewpoint ComfortViewpoint; }
    viewdef EnergyPerformanceView { viewpoint EnergyViewpoint; }
    viewdef AirQualityControlView { viewpoint AirQualityViewpoint; }
}
