// Functional model: Smart Building ECS
package functional {
    // Explicit imports of needed value types and enumerations from root
    public import SmartBuildingECS::Temperature;
    public import SmartBuildingECS::Humidity;
    public import SmartBuildingECS::CO2Concentration;
    public import SmartBuildingECS::OccupancyCount;
    public import SmartBuildingECS::Illuminance;
    public import SmartBuildingECS::ComfortMode;
    public import SmartBuildingECS::MaintenanceState;

    // Local placeholders for scoring/ventilation rate using existing numeric-like types
    // (SysIDE grammar fallback: reuse Temperature for comfortScore, OccupancyCount for ventilationRate magnitude)

    // High-level function definitions
    partdef SenseEnvironment {
        feature temperature: Temperature;
        feature humidity: Humidity;
        feature co2: CO2Concentration;
        feature occupancy: OccupancyCount;
        feature illuminance: Illuminance;
    }

    partdef AnalyzeComfort {
        feature inputTemperature: Temperature;
        feature inputHumidity: Humidity;
        feature inputCO2: CO2Concentration;
        feature inputOccupancy: OccupancyCount;
        feature comfortScore: Temperature; // placeholder
    }

    partdef OptimizeEnergy {
        feature comfortScoreIn: Temperature; // placeholder
        feature occupancyIn: OccupancyCount;
        feature temperatureIn: Temperature;
        feature hvacSetPoint: Temperature;
        feature lightingLevel: Illuminance;
        feature ventilationRate: OccupancyCount; // placeholder
    }

    partdef ControlActuators {
        feature hvacSetPointIn: Temperature;
        feature lightingLevelIn: Illuminance;
        feature ventilationRateIn: OccupancyCount; // placeholder
        feature actuationResult: OccupancyCount; // boolean placeholder (0/1)
    }

    partdef PredictMaintenance {
        feature temperatureIn: Temperature;
        feature humidityIn: Humidity;
        feature co2In: CO2Concentration;
        feature occupancyIn: OccupancyCount;
        feature maintenanceState: MaintenanceState;
    }

    // Activity composition of overall control loop
    partdef ControlLoop {
        feature zoneComfortMode: ComfortMode;
        // Flow annotation:
        // SenseEnvironment.temperature -> AnalyzeComfort.inputTemperature -> OptimizeEnergy.temperatureIn -> ControlActuators.hvacSetPointIn
    }

    // Constraint usage for comfort score calculation (simplified)
    constraintdef ComfortScoreCalc (t: Temperature, h: Humidity, c: CO2Concentration, o: OccupancyCount, score: Temperature) {
        // Pseudo-formula expressed as comment; actual math binding may differ per tool
        // score = 0.4*(1 - |t-22|/10) + 0.2*(1 - |h-50|/30) + 0.2*(1 - c/1000) + 0.2*(1 - o/50)
    }

    // Binding comfort score in analyze action (tool may handle differently; placeholder)
    // bind ComfortScoreCalc (analyze.temperature, analyze.humidity, analyze.co2, analyze.occupancy, analyze.comfortScore);

    // Performance constraints
    // ResponseTimeConstraint & EnergyReductionConstraint placeholders removed pending primitive type availability

    // Functional packages grouping
    package sensingFunctions { public import functional::SenseEnvironment; }
    package optimizationFunctions { public import functional::OptimizeEnergy; public import functional::AnalyzeComfort; }
    package actuationFunctions { public import functional::ControlActuators; }
    package maintenanceFunctions { public import functional::PredictMaintenance; }
}
