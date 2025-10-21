# SPES-Based SysML v2 Example Model: Smart Building Environmental Control

This workspace contains a learning-focused SysML v2 example model aligned with the SPES (Software Platform Embedded Systems) methodology, targeting a Smart Building Environmental Control System (SB-ECS). The goal is to exercise a broad coverage of OMG SysML v2 constructs for evaluating tool feature support.

## Domain Overview
The Smart Building Environmental Control System manages climate (temperature, humidity, CO2), lighting adaptation, energy optimization, occupancy-based comfort, and predictive maintenance across multiple building zones.

## SPES Methodology Mapping
SPES layers/viewpoints addressed:
- Requirements View: Stakeholder, system, quality, regulatory requirements.
- Functional View: Abstract functions and services (sense, decide, actuate, optimize).
- Logical View: Logical subsystems (Sensing Network, Control Core, Actuation Network, Energy Optimizer, Analytics).
- Technical / Deployment View: Physical devices, controllers, gateways, cloud services.
- Behavioral View: State machines, activities, interactions.
- Information View: Data/value types, enumerations, units, semantic structures.
- Variability View: Feature variants (EnergySavingMode, PredictiveMaintenance, AdvancedLighting).
- Test & Verification View: TestCases, scenarios, requirement verification links.
- Performance & Parametric View: Constraints for energy, response time, accuracy.

## Folder Structure
```
model/
  SmartBuildingRoot.sysml
  requirements.sysml
  functional.sysml
  logical.sysml
  technical.sysml
  interfaces.sysml
  information.sysml
  behavior.sysml
  parametrics.sysml
  variants.sysml
  verification.sysml
  views.sysml
  allocations.sysml
```

## Usage
Import `SmartBuildingRoot.sysml` into your SysML v2-compliant tool. Subpackages are referenced there. Each file is curated to demonstrate distinct constructs.

## Goals & Coverage
The model attempts to cover: package, namespace, import, requirement, refine, derive, satisfy, verify, part definition, part usage, feature, port, interface, signal, action, activity, state machine, transition, event, guard, script (opaque behavior), constraint definition, constraint usage, param binding, variant/feature modeling, view, viewpoint, allocation, enumeration, value type, unit, quantity kind, test case, result, scenario, interaction, sequence, usage relationships.

## Disclaimer
This is an original pedagogical example. No text from the official OMG specification is reproduced. Adapt/extend as needed.

## Next Steps
See `variants.sysml` and `parametrics.sysml` for extension points (e.g., add HVAC advanced predictive analytics model).
