// Logical architecture model
package logical {
    public import SmartBuildingECS::Zone;
    public import SmartBuildingECS::ControlCore;
    public import SmartBuildingECS::SensingNetwork;
    public import SmartBuildingECS::ActuationNetwork;
    public import SmartBuildingECS::EnergyOptimizer;
    public import SmartBuildingECS::AnalyticsService;

    // Logical part definitions with internal features
    partdef SensingNetwork {
        feature tempSensors: TemperatureSensor[1..*];
        feature humiditySensors: HumiditySensor[1..*];
        feature co2Sensors: CO2Sensor[1..*];
        feature occupancySensors: OccupancySensor[1..*];
        feature lightSensors: LightSensor[1..*];
    }

    partdef ControlCore {
        feature controlLoop: functional::ControlLoop;
        feature optimization: functional::OptimizeEnergy;
    }

    partdef ActuationNetwork {
        feature hvacUnits: HVACUnit[1..*];
        feature lightingDrivers: LightingDriver[1..*];
        feature ventilationFans: VentilationFan[1..*];
    }

    partdef EnergyOptimizer { feature strategy: OptimizationStrategy; }
    partdef AnalyticsService { feature maintenancePredictor: functional::PredictMaintenance; }

    // Sensor & actuator definitions
    partdef TemperatureSensor { feature measured: SmartBuildingECS::Temperature; }
    partdef HumiditySensor { feature measured: SmartBuildingECS::Humidity; }
    partdef CO2Sensor { feature measured: SmartBuildingECS::CO2Concentration; }
    partdef OccupancySensor { feature measured: SmartBuildingECS::OccupancyCount; }
    partdef LightSensor { feature measured: SmartBuildingECS::Illuminance; }

    partdef HVACUnit { feature mode: SmartBuildingECS::HVACMode; }
    partdef LightingDriver { feature level: SmartBuildingECS::Illuminance; }
    partdef VentilationFan { feature airflowRate: functional::VentilationRate; }

    // Strategy abstraction
    partdef OptimizationStrategy { feature name: String; }

    // Ports and interfaces (actual interface definitions in interfaces package)
    portdef SensorDataPort { }
    portdef ControlCommandPort { }

    // Example connections (syntax illustrative)
    // connect SensingNetwork::tempSensors -> ControlCore::controlLoop;
    // connect ControlCore::optimization -> ActuationNetwork::hvacUnits;
}
