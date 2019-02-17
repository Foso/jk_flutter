package de.jensklingenberg.jkflutter

import android.content.ContentValues.TAG
import android.os.Bundle
import android.util.Log
import de.jensklingenberg.jkflutter.channel.BatteryChannel
import de.jensklingenberg.jkflutter.channel.TimerEventChannel

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant
import io.reactivex.Observable
import io.reactivex.disposables.Disposable
import java.util.concurrent.TimeUnit


class MainActivity : FlutterActivity(), MainContract.View {

    lateinit var presenter: MainPresenter

     var timerSubscription: Disposable?=null


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)
        presenter = MainPresenter(this)

        MethodChannel(flutterView, BatteryChannel.CHANNEL).setMethodCallHandler { call, result ->
            when (call.method) {
                BatteryChannel.METHOD_BATTERIE -> {
                    val batteryLevel = presenter.getBatteryLevel(this)
                    if (batteryLevel != -1) {
                        result.success(batteryLevel)
                    } else {
                        result.error("UNAVAILABLE", "Battery level not available.", null)
                    }
                }
                else -> result.notImplemented()
            }
        }



        EventChannel(flutterView, TimerEventChannel.CHANNEL).setStreamHandler(
              object: EventChannel.StreamHandler{
                  override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                      timerSubscription = Observable
                              .interval(0, 1, TimeUnit.SECONDS)
                              .subscribe(
                                      { timer: Long ->
                                          Log.w(TAG, "emitting timer event $timer")
                                          events?.success(timer)
                                      },
                                      { error: Throwable ->
                                          Log.e(TAG, "error in emitting timer", error)
                                          events?.error("STREAM", "Error in processing observable", error.message)
                                      },
                                      { Log.w(TAG, "closing the timer observable") }
                              )

                  }

                  override fun onCancel(arguments: Any?) {
                      timerSubscription?.dispose()
                      timerSubscription=null
                  }

              }
        )

    }


}
