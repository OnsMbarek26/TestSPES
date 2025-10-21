// Requirements model for Smart Building Environmental Control System
package requirements {

    // Stakeholder Requirements
    requirement StakeholderComfortReq {
        id = "STKH-COMFORT-001";
        text = "Provide occupants with configurable comfort levels per zone.";
        attribute risk = "Medium";
    }
    requirement StakeholderEnergyReq {
        id = "STKH-ENERGY-001";
        text = "Reduce overall building HVAC and lighting energy consumption by at least 20% compared to baseline.";
        attribute risk = "High";
    }
    requirement StakeholderAirQualityReq {
        id = "STKH-AIR-001";
        text = "Maintain CO2 concentration below 900 ppm in occupied zones.";
        attribute risk = "Low";
    }

    // System Requirements (refine stakeholder)
    requirement SystemComfortRangeReq {
        id = "SYS-COMFORT-010";
        text = "Maintain temperature within configured comfort bounds for each zone.";
        // refinement relationship expressed outside definition
    }
    requirement SystemHumidityRangeReq {
        id = "SYS-COMFORT-011";
        text = "Maintain relative humidity between configured min and max for each zone.";
    }
    requirement SystemCO2LimitReq {
        id = "SYS-AIR-020";
        text = "Control ventilation to keep CO2 concentration < 900 ppm during occupancy.";
    }
    requirement SystemEnergyReductionReq {
        id = "SYS-ENERGY-030";
        text = "Provide optimization strategies to reduce HVAC and lighting energy consumption >=20%.";
    }

    // Derived Requirements
    requirement DerivedPredictiveMaintenanceReq {
        id = "DRV-MAINT-040";
        text = "Monitor sensor and actuator health to predict failures.";
        // derived from StakeholderComfortReq and StakeholderEnergyReq
    }

    // Quality Requirements
    requirement ResponseTimeReq {
        id = "QLT-RESP-050";
        text = "Adjust zone actuation within 5 seconds of control decision.";
        attribute risk = "Medium";
    }
    requirement AccuracyTemperatureReq {
        id = "QLT-ACC-060";
        text = "Temperature measurements shall have accuracy ±0.5°C.";
    }

    // Verification Requirements
    requirement VerificationSupportReq {
        id = "VER-SUPPORT-070";
        text = "Provide test cases validating comfort, air quality, and energy requirements.";
    }

    // Satisfy relationships placeholders (actual satisfy usages may differ per tool syntax)
    // satisfy SystemComfortRangeReq by SmartBuildingECS::SmartBuildingSystem;
    // satisfy SystemEnergyReductionReq by SmartBuildingECS::EnergyOptimizer;
    // satisfy SystemCO2LimitReq by SmartBuildingECS::ControlCore;
    // satisfy DerivedPredictiveMaintenanceReq by SmartBuildingECS::AnalyticsService;

    // Verify relationships (to be linked with test cases later)
    // verify SystemComfortRangeReq by TestCases::ComfortRangeTest;
    // verify SystemCO2LimitReq by TestCases::CO2VentilationTest;
    // verify SystemEnergyReductionReq by TestCases::EnergyOptimizationTest;

    // Explicit refinement and derivation relationships (tool-specific syntax may vary)
    // refine SystemComfortRangeReq :> StakeholderComfortReq;
    // refine SystemHumidityRangeReq :> StakeholderComfortReq;
    // refine SystemCO2LimitReq :> StakeholderAirQualityReq;
    // refine SystemEnergyReductionReq :> StakeholderEnergyReq;
    // derive DerivedPredictiveMaintenanceReq :> StakeholderComfortReq, StakeholderEnergyReq;

    // Grouping via requirement packages
    package comfortGroup { public import requirements::SystemComfortRangeReq; public import requirements::SystemHumidityRangeReq; }
    package energyGroup { public import requirements::SystemEnergyReductionReq; }
    package airQualityGroup { public import requirements::SystemCO2LimitReq; }

    // Placeholder test cases package for later linking
    package TestCases {
        // verificationcase ComfortRangeTest {}
        // verificationcase CO2VentilationTest {}
        // verificationcase EnergyOptimizationTest {}
    }
}
