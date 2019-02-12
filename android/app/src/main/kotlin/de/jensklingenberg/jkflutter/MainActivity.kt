package de.jensklingenberg.jkflutter

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity(), MainContract.View {

  private val CHANNEL = "samples.flutter.io/battery1"
  lateinit var presenter : MainPresenter

  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    GeneratedPluginRegistrant.registerWith(this)
    presenter = MainPresenter(this)

    MethodChannel(flutterView, CHANNEL).setMethodCallHandler { call, result ->
      when(call.method) {
        "getBatteryLevel" -> {
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