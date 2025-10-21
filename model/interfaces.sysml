// Interfaces and protocols
package interfaces {
    // Interface definitions
    interfacedef SensorDataInterface {
        feature temperature: SmartBuildingECS::Temperature;
        feature humidity: SmartBuildingECS::Humidity;
        feature co2: SmartBuildingECS::CO2Concentration;
        feature occupancy: SmartBuildingECS::OccupancyCount;
        feature illuminance: SmartBuildingECS::Illuminance;
    }

    interfacedef ControlCommandInterface {
        feature hvacSetPoint: SmartBuildingECS::Temperature;
        feature lightingLevel: SmartBuildingECS::Illuminance;
        feature ventilationRate: functional::VentilationRate;
    }

    interfacedef MaintenanceStatusInterface {
        feature maintenanceState: SmartBuildingECS::MaintenanceState;
    }

    // Protocol / message examples (conceptual)
    // message SensorUpdate uses SensorDataInterface;
    // message ActuationCommand uses ControlCommandInterface;
}
