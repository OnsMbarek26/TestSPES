// Root SysML v2 package for Smart Building Environmental Control System (SB-ECS)
// Demonstrates broad construct usage for learning/testing tool capability.

package SmartBuildingECS {
    // Simplified root for SysIDE grammar testing.

    import requirements;
    import functional;
    import logical;
    import technical;
    import interfaces;
    import information;
    import behavior;
    import parametrics;
    import variants;
    import verification;
    import views;
    import allocations;

    // Basic type placeholders (using partdefs instead of valuetypes/quantity kinds)
    partdef Temperature {}
    partdef Humidity {}
    partdef CO2Concentration {}
    partdef Power {}
    partdef Energy {}
    partdef OccupancyCount {}
    partdef Illuminance {}
    partdef Boolean {}

    // Enumerations (alternative syntax without 'values =')
    // enumeration ZoneType { Office, MeetingRoom, Lobby, Corridor, Lab }
    // enumeration ComfortMode { Standard, Eco, HighComfort }
    // enumeration MaintenanceState { Nominal, Warning, Fault }
    // enumeration HVACMode { Heating, Cooling, Ventilation, Idle }

    // Constraint placeholders (converted to generic 'constraint')
    // Constraints commented until grammar confirmed
    // constraint TemperatureWithinRange (t: Temperature, min: Temperature, max: Temperature) { /* t in [min,max] */ }
    // constraint HumidityWithinRange (h: Humidity, min: Humidity, max: Humidity) { /* h in [min,max] */ }
    // constraint CO2Below (c: CO2Concentration, limit: CO2Concentration) { /* c < limit */ }

    // Feature toggles simplified (no featuremodel keyword)
    partdef GlobalFeatures {
        feature EnergySavingMode: Boolean;
        feature PredictiveMaintenance: Boolean;
        feature AdvancedLighting: Boolean;
        // AdvancedLightingRequiresEnergySaving: AdvancedLighting -> requires EnergySavingMode
    }

    // System structure
    partdef SmartBuildingSystem {
        feature zones: Zone[1..*];
        feature controlCore: ControlCore;
        feature sensingNetwork: SensingNetwork;
        feature actuationNetwork: ActuationNetwork;
        feature energyOptimizer: EnergyOptimizer;
        feature analyticsService: AnalyticsService;
    }

    partdef Zone {}
    partdef ControlCore {}
    partdef SensingNetwork {}
    partdef ActuationNetwork {}
    partdef EnergyOptimizer {}
    partdef AnalyticsService {}

    requirement SystemOverviewReq {
        text = "Maintain environmental parameters within comfort ranges while minimizing energy consumption.";
    }

    // viewpoint RequirementsViewpoint { concerns = [ SystemOverviewReq ]; }
    // viewpoint EnergyViewpoint { concerns = [ EnergyOptimizer ]; }

    part SmartBuilding : SmartBuildingSystem {}
}
