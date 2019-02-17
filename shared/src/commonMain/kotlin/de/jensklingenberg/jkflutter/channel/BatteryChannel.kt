package de.jensklingenberg.jkflutter.channel



class BatteryChannel{
    companion object {
        val CHANNEL = "samples.flutter.io/battery1"
        val METHOD_BATTERIE= "getBatteryLevel"
    }

}

class TimerEventChannel{
    companion object {
        val CHANNEL = "com.yourcompany.eventchannelsample/stream"
    }

}

