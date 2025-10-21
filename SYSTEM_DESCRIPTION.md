# Smart Building Environmental Control System (SB-ECS)

## 1. Overview
The Smart Building Environmental Control System manages indoor climate and lighting conditions across multiple building zones. It continuously senses environmental parameters, evaluates comfort and energy objectives, and issues actuation commands to HVAC, lighting, and ventilation equipment while tracking system health for predictive maintenance.

## 2. Goals (Structured from Requirements)
- Comfort (StakeholderComfortReq): Maintain temperature and humidity within configurable ranges per zone (SystemComfortRangeReq, SystemHumidityRangeReq).
- Air Quality (StakeholderAirQualityReq): Keep CO2 concentration below threshold (SystemCO2LimitReq).
- Energy Efficiency (StakeholderEnergyReq): Reduce aggregate HVAC and lighting energy consumption by at least 20% (SystemEnergyReductionReq).
- Responsiveness (ResponseTimeReq): Update actuation within specified reaction time.
- Measurement Accuracy (AccuracyTemperatureReq): Provide reliable sensor data to support precise control decisions.
- Maintainability (DerivedPredictiveMaintenanceReq): Detect emerging faults for proactive intervention.

## 3. Structural Decomposition
### 3.1 SmartBuildingSystem (Root)
Contains major subsystems as features:
- sensingNetwork
- controlCore
- actuationNetwork
- energyOptimizer
- analyticsService
- zones (collection of Zone entities)

### 3.2 Zone
Represents a physical or functional area (e.g., Office, MeetingRoom). Each Zone has:
- zoneType (classification)
- comfortMode (policy selecting Standard / Eco / HighComfort tuning)
Zones are where environmental requirements are directly applied and verified.

### 3.3 SensingNetwork
Aggregates sensor elements providing raw data:
- Temperature, Humidity, CO2, Occupancy, Illuminance readings.
Supports: SystemComfortRangeReq, SystemHumidityRangeReq, SystemCO2LimitReq, AccuracyTemperatureReq.

### 3.4 ControlCore
Central decision logic executing a Control Loop:
- Integrates sensor data, calculates comfort score, evaluates energy objectives.
- Produces target setpoints for HVAC, lighting, and ventilation.
Supports: SystemComfortRangeReq, SystemEnergyReductionReq, ResponseTimeReq.

### 3.5 ActuationNetwork
Physical command interface that applies control decisions:
- HVAC units, Lighting drivers, Ventilation fans.
Supports: SystemComfortRangeReq, SystemCO2LimitReq, ResponseTimeReq.

### 3.6 EnergyOptimizer
Focuses on optimizing energy consumption given comfort constraints:
- Adjusts control strategies and setpoint biases.
Supports: SystemEnergyReductionReq.

### 3.7 AnalyticsService
Processes historical and real-time data to detect anomalies:
- Predicts potential failures (maintenanceState transitions).
Supports: DerivedPredictiveMaintenanceReq.

## 4. Functional Perspective (Simplified Flow)
1. Sense: Collect temperature, humidity, CO2, occupancy, illuminance values.
2. Analyze Comfort: Compute a comfort score representing deviation from ideal conditions.
3. Optimize Energy: Determine efficient setpoints balancing comfort and energy saving.
4. Actuate: Send commands to HVAC, lighting, ventilation components.
5. Predict Maintenance: Monitor trends for early warnings (fault prevention).

## 5. Requirements Trace (Illustrative Mapping)
| Requirement | Primary Subsystem(s) | Rationale |
|-------------|----------------------|-----------|
| SystemComfortRangeReq | SensingNetwork, ControlCore, ActuationNetwork | Sensor data informs decisions; control logic computes; actuators apply corrections. |
| SystemHumidityRangeReq | SensingNetwork, ControlCore, ActuationNetwork | Same pattern as temperature—humidity data integrated into comfort logic. |
| SystemCO2LimitReq | SensingNetwork, ControlCore, ActuationNetwork | CO2 readings drive ventilation rate adjustments. |
| SystemEnergyReductionReq | EnergyOptimizer, ControlCore | Optimization module biases decisions; control loop implements them. |
| DerivedPredictiveMaintenanceReq | AnalyticsService, SensingNetwork | Sensor histories feed predictive algorithms. |
| ResponseTimeReq | ControlCore, ActuationNetwork | Decision latency plus actuation latency must meet threshold. |
| AccuracyTemperatureReq | SensingNetwork | Sensors must deliver reliable measurement; calibration processes implied. |

## 6. Comfort Policy Modes (ComfortMode)
- Standard: Balanced comfort vs. energy.
- Eco: Prioritizes energy saving; may widen acceptable ranges.
- HighComfort: Tightest control bands; higher energy usage tolerated.
Each mode modulates constraint parameters (min/max temperature, humidity margins) and influences the energy optimization strategy.

## 7. Data & Information Snapshots
A `ZoneEnvironmentalSnapshot` (from information model) captures aggregated readings plus a timestamp — forming the basis for trend analyses, verification, and maintenance predictions.

## 8. Constraints (Conceptual)
- TemperatureWithinRange: Ensures zone temperature remains inside configured min/max.
- HumidityWithinRange: Similar bounding for humidity.
- CO2Below: Ventilation maintains CO2 under threshold (supports air quality requirement).
ComfortScoreCalc (functional package) qualitatively combines deviations into a single metric; exact numerical semantics can be formalized when grammar supports parametric equations.

## 9. Variability (GlobalFeatures)
- EnergySavingMode: Enables energy-biased optimization strategies.
- PredictiveMaintenance: Activates maintenance state monitoring features.
- AdvancedLighting: Allows finer-grained lighting control (requires EnergySavingMode conceptually).
These features permit scenario-based evaluation (e.g., baseline vs. energy optimized vs. predictive enabled).

## 10. Viewpoints (Conceptual)
- RequirementsViewpoint: Focuses on core requirement compliance artifacts.
- EnergyViewpoint: Emphasizes optimization components and related constraints.
Views derived from these viewpoints will filter model content for stakeholder-specific analysis once syntax stabilization is complete.

## 11. Future Enhancements
- Formal satisfy/verify statements linking requirements to part definitions once grammar confirmed.
- Explicit port and flow definitions for sensor and command data paths.
- Adding safety and cybersecurity layers (e.g., OverheatRiskReq, SecureChannelReq).
- Parametric binding connectors for energy balance and comfort equations.
- Detailed state machine for HVAC unit operational transitions.

## 12. Summary
The SB-ECS integrates layered sensing, decision, actuation, optimization, and analytics subsystems to fulfill comfort, air quality, energy efficiency, and maintainability requirements. Structure-to-requirement mapping ensures each obligation has clear responsible model elements, enabling traceability and targeted verification as the textual syntax is refined.
