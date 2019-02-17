package de.jensklingenberg.jkflutter

import android.os.Bundle
import de.jensklingenberg.jkflutter.channel.BatteryChannel

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity(), MainContract.View {

  lateinit var presenter : MainPresenter

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    presenter = MainPresenter(this)

    MethodChannel(flutterView, BatteryChannel.CHANNEL).setMethodCallHandler { call, result ->
      when(call.method) {
        BatteryChannel.METHOD_BATTERIE -> {
          val batteryLevel = presenter.getBatteryLevel(this)
          if (batteryLevel != -1) {
            result.success( batteryLevel)
          } else {
            result.error("UNAVAILABLE", "Battery level not available.", null)
          }
        }
        else -> result.notImplemented()
      }
    }

  }



}