// Behavioral models
package behavior {
    // State machine for HVAC unit (conceptual)
    statedef HVACOperatingStates {
        state Idle {}
        state Heating {}
        state Cooling {}
        state Ventilating {}
        // transitions (illustrative comments)
        // transition Idle -> Heating { trigger temperatureBelowMin }
        // transition Heating -> Idle { trigger temperatureWithinRange }
    }

    // Event placeholders
    // event temperatureBelowMin;
    // event temperatureWithinRange;

    // Sequence / interaction example (conceptual)
    // interaction ControlSequence {
    //    lifeline SensingNetwork;
    //    lifeline ControlCore;
    //    lifeline ActuationNetwork;
    //    message sense from SensingNetwork to ControlCore;
    //    message command from ControlCore to ActuationNetwork;
    // }
}
