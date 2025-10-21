# Smart Building Environmental Control System (SB-ECS) Model Documentation

## 1. Purpose
This document explains the SysML v2 example model structured using SPES methodology layers for a Smart Building Environmental Control System. It serves as a learning artifact and a basis for assessing SysML v2 tool feature support.

## 2. Domain Overview
The SB-ECS monitors and controls environmental parameters (temperature, humidity, CO2, lighting, occupancy) across zones to balance comfort and energy efficiency while providing predictive maintenance analytics.

## 3. SPES Layer Mapping
| SPES Layer | Model Artifact(s) | Description |
|------------|-------------------|-------------|
| Requirements | `requirements.sysml` | Stakeholder, system, quality requirements with refinement and derivation comments. |
| Functional | `functional.sysml` | Actions representing sensing, analysis, optimization, actuation, and maintenance prediction sequence. |
| Logical | `logical.sysml` | Abstract subsystems: sensing, control core, actuation network, energy optimizer, analytics. |
| Technical / Deployment | `technical.sysml` | Physical nodes (edge gateway, zone controllers, cloud services). |
| Behavioral | `behavior.sysml` | HVAC operating states (commented) representing the operational lifecycle. |
| Information | `information.sysml` | Data snapshot structure and enumerations for optimization algorithms. |
| Parametric | `parametrics.sysml`, `functional.sysml` | Constraint definitions for comfort scoring, energy reduction, response time. |
| Variability | `SmartBuildingRoot.sysml`, `variants.sysml` | Global feature toggles (EnergySavingMode, PredictiveMaintenance, etc.). |
| Verification & Test | `requirements.sysml`, `verification.sysml` | Verification-oriented requirements and placeholder test cases. |
| Views & Viewpoints | `views.sysml` | Stakeholder-focused viewpoints (comfort, energy, air quality). |
| Allocation & Trace | `allocations.sysml` | Placeholder mapping comments for refinement, satisfaction, verification. |

## 4. Layer Interactions
1. Sensing feeds Control Loop (functional) which impacts Actuation Network (logical) realized by Zone Controllers (technical).
2. Requirements drive constraints (parametric) and optimization strategies (functional + logical).
3. Variability toggles features altering optimization behavior and maintenance analytics.
4. Viewpoints filter model concerns for targeted stakeholder analyses.

## 5. Key Constructs Explained
- Requirement: Defines a textual obligation; hierarchical relations expressed via refinement comments to avoid grammar conflicts until confirmed.
- Part Definition (partdef): Structural type capturing features (composition relationships) used to build system architecture.
- Constraint Definition (constraintdef): Abstract parametric relation; actual mathematical expression may be tool-specific.
- Feature Model: Represents variant selection; simplified to feature listing with optional semantics.
- Viewpoint & View: Viewpoint declares concerns; View instantiates a representation focusing on those concerns.

## 6. Comfort & Energy Control Flow (Conceptual)
1. SenseEnvironment collects readings.
2. AnalyzeComfort computes a comfort score using environmental deltas.
3. OptimizeEnergy chooses actuator targets balancing comfort vs. energy.
4. ControlActuators dispatches commands to HVAC, lighting, ventilation devices.
5. PredictMaintenance monitors trends for early fault detection.

## 7. Parametric Relationships (Illustrative)
- TemperatureWithinRange(t,min,max): Ensures zone temperature remains inside bounds.
- EnergyReductionConstraint(baseline,current): Aims for >=20% reduction.
- ComfortScoreCalc: Aggregates normalized deviations; actual numeric evaluation deferred until tool binding syntax confirmed.

## 8. Variability Impacts
Activating EnergySavingMode biases optimization toward lower energy usage; PredictiveMaintenance enables maintenanceState feature analytics; AdvancedLighting affects lighting driver strategies.

## 9. Viewpoint Usage Scenario
Stakeholder queries comfort compliance: Load ComfortOperationalView to see requirements, associated zones, and current constraints (once bindings implemented).

## 10. Extension Recommendations
- Add binding connectors for parametric equations linking to part features.
- Introduce explicit flow definitions for sensor data and control commands.
- Model safety hazards (e.g., overheating risk) with mitigation requirements.
- Add cybersecurity viewpoint (encryption, authentication requirements).
- Provide sequence interaction for maintenance alert scenario.

## 11. Tool Import Strategy
1. Start with `SmartBuildingRoot.sysml` to establish base types.
2. Incrementally import `requirements.sysml`, then `functional.sysml` after syntax normalization.
3. Progress through structural packages (logical, technical) and parametrics.
4. Finally add variants, views, and verification placeholders.

## 12. PDF Generation Instructions (Windows PowerShell)
Use Pandoc (install if not present) to convert markdown files to PDF. Ensure a LaTeX engine (e.g., MiKTeX) is available.

```powershell
# Optional: install pandoc (if winget available)
winget install --id=JohnMacFarlane.Pandoc -e

# Generate PDFs
pandoc README.md -o README.pdf
pandoc COVERAGE.md -o COVERAGE.pdf
pandoc DOCUMENTATION.md -o DOCUMENTATION.pdf
```

## 13. Traceability Approach (Planned)
- Introduce explicit `satisfy` statements after confirming grammar.
- Maintain a cross-reference table linking requirement IDs to structural and functional elements.

## 14. Known Gaps
- Syntax normalization required for action, interface, view, feature model constructs.
- Absence of explicit flow/port direction semantics.
- No concrete test execution semantics (verificationcases placeholder).

## 15. Next Steps
Refer to `COVERAGE.md` for construct status and prioritize syntax normalization tasks.
