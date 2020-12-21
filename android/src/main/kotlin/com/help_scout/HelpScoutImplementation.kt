package com.help_scout

import android.content.Context
import com.helpscout.beacon.Beacon
import com.helpscout.beacon.ui.BeaconActivity

class HelpScoutImplementation {

    fun setupBeacon(arguments: Any) {
        val channelArgs = arguments as List<String>;
        val beaconId: String = channelArgs[0];
        try {
            Beacon.Builder()
                    .withBeaconId(beaconId)
                    .build();
            identifyUser(email = channelArgs[1], name = channelArgs[2])
        } catch (e: UnknownError) {
            throw(e);
        }
    }

    fun openBeacon(context: Context) {
        try {
            BeaconActivity.open(context);
        } catch (e: UnknownError) {
            throw(e);
        }
    }

    private fun identifyUser(email: String, name: String) {
        try {
            Beacon.identify(email, name);
        } catch (e: UnknownError) {
            throw(e);
        }
    }
}