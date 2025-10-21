// Information model extensions
package information {
    public import SmartBuildingECS::Temperature;
    public import SmartBuildingECS::Humidity;
    public import SmartBuildingECS::CO2Concentration;
    public import SmartBuildingECS::Illuminance;
    public import SmartBuildingECS::OccupancyCount;

    // Data structure example
    partdef ZoneEnvironmentalSnapshot {
        feature temperature: Temperature;
        feature humidity: Humidity;
        feature co2: CO2Concentration;
        feature occupancy: OccupancyCount;
        feature illuminance: Illuminance;
        feature timestamp: String;
    }

    // Enumeration extension
    enumeration OptimizationAlgorithm { values = [ RuleBased, PredictiveModel, AdaptiveLearning ]; }

    // Mapping constraints (conceptual)
    constraintdef ValidTemperature (t: Temperature) { /* t between -10 and 50 */ }
}
