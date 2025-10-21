# SysML v2 Construct Coverage Matrix

This document lists major categories of SysML v2 constructs and where they appear in the Smart Building Environmental Control System (SB-ECS) example model. The intent is representative coverage for learning and tool capability evaluation.

| Category | Construct / Concept | Example Element | File | Status |
|----------|---------------------|-----------------|------|--------|
| Packages & Namespaces | `package`, imports | `package SmartBuildingECS`, `import requirements` | SmartBuildingRoot.sysml | Implemented |
| Value Types & Units | `quantitykind`, `unit`, `valuetype` | `TemperatureKind`, `Celsius`, `Temperature` | SmartBuildingRoot.sysml | Implemented |
| Enumerations | `enumeration` | `ComfortMode`, `ZoneType` | SmartBuildingRoot.sysml | Implemented |
| Requirements | `requirement`, attributes | `StakeholderComfortReq` | requirements.sysml | Implemented |
| Requirement Relations | refine/derive (commented forms) | `SystemComfortRangeReq` refinement comment | requirements.sysml | Represented (commented syntax) |
| Satisfy | `satisfy` | Comment placeholders | requirements.sysml | Placeholder |
| Verify | `verify` | Comment placeholders | requirements.sysml | Placeholder |
| Structural Definitions | `partdef` | `SmartBuildingSystem` | SmartBuildingRoot.sysml | Implemented |
| Structural Usages | `part` | `SmartBuilding : SmartBuildingSystem` | SmartBuildingRoot.sysml | Implemented |
| Features | `feature` | `zones: Zone[1..*]` | SmartBuildingRoot.sysml | Implemented |
| Constraints | `constraintdef` | `TemperatureWithinRange` | SmartBuildingRoot.sysml | Implemented |
| Actions / Behaviors | (represented via partdefs/actions) | `ControlLoop` (action) | functional.sysml | Draft (needs syntax normalization) |
| Parametrics | constraint usage binding | ComfortScoreCalc placeholder bind | functional.sysml | Placeholder |
| Interfaces | interface (represented as partdefs) | `SensorDataInterface` | interfaces.sysml | Draft (needs syntax normalization) |
| Ports | `portdef` | `SensorDataPort` | logical.sysml | Draft |
| Allocations | `allocation` | Comment placeholders | allocations.sysml | Placeholder |
| Variability | feature model (simplified) | `GlobalFeatures`, `BuildingFeatureModel` | SmartBuildingRoot.sysml / variants.sysml | Draft (syntax normalization) |
| Views & Viewpoints | `viewpoint`, `view` | `ComfortViewpoint`, `ComfortOperationalView` | views.sysml | Draft (syntax normalization) |
| State Machine / States | represented via enumeration/comments | HVAC states comment | behavior.sysml | Placeholder |
| Test / Verification Cases | represented via requirements/comments | `VerificationSupportReq` | requirements.sysml | Placeholder |
| Performance Constraints | constraintdef | `ResponseTimeConstraint` | functional.sysml | Draft |
| Energy / Domain Constraints | constraintdef | `EnergyReductionConstraint` | functional.sysml | Draft |
| Deployment / Technical | partdefs for nodes | `EdgeGateway` | technical.sysml | Draft |
| Information Model | data snapshot partdef | `ZoneEnvironmentalSnapshot` | information.sysml | Draft |
| Analytics / Maintenance | partdefs/actions | `PredictMaintenance` | functional.sysml | Draft |
| Variant Constraints | constraintdef (comment placeholder) | `AdvancedLightingRequiresEnergySaving` | SmartBuildingRoot.sysml | Implemented (commented predicate) |
| Viewpoint Concerns | `viewpoint` concern list | Comfort concern requirement | views.sysml | Draft |
| Metadata / Attributes | requirement attributes | risk attribute on requirements | requirements.sysml | Implemented |

## Notes
1. Some constructs are represented as commented placeholders due to parser/grammar alignment tasks pending (see TODOs).
2. The model focuses on clarity over exhaustive enumeration; additional constructs (flow definitions, explicit binding connectors, succession flows) can be added in future iterations.
3. For tool evaluation, attempt incremental import: start with `SmartBuildingRoot.sysml` then add other files after syntax normalization.

## Planned Normalization Steps
- Replace draft keywords (e.g., `action`, `partdef` if required) with the exact grammar accepted by the target OMG reference implementation you will use.
- Introduce actual `satisfy`/`verify` statements once tool grammar confirmed.
- Convert interface placeholders to either `interface` constructs (if supported) or maintain `partdef` pattern.

## Extension Ideas
- Add safety viewpoint and hazard requirements.
- Introduce cybersecurity constraints (e.g., encryption key length requirement).
- Provide quantitative parametric equations for energy balance with binding connectors.
