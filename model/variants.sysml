// Variability model extensions
package variants {
    import SmartBuildingECS::GlobalFeatures;

    featuremodel BuildingFeatureModel extends GlobalFeatures {
        feature AdvancedAnalytics { optional; }
        feature GreenEnergyIntegration { optional; }
        // Constraint: AdvancedAnalytics requires PredictiveMaintenance
        // constraint AdvancedAnalyticsReqPredictive () { AdvancedAnalytics.selected implies PredictiveMaintenance.selected }
    }
}
