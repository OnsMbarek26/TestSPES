// Parametric & constraints
package parametrics {
    import functional::ComfortScoreCalc;

    // Energy model placeholders
    constraintdef EnergyBalance (consumed: SmartBuildingECS::Energy, generated: SmartBuildingECS::Energy, net: SmartBuildingECS::Energy) {
        // net = consumed - generated
    }

    constraintdef VentilationEfficiency (rate: functional::VentilationRate, co2: SmartBuildingECS::CO2Concentration) {
        // rate correlates inversely with co2 concentration trend
    }

    // Binding examples (commented)
    // bind EnergyBalance (buildingConsumed, buildingGenerated, buildingNet);
}
