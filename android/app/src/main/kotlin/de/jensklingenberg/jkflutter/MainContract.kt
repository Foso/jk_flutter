package de.jensklingenberg.jkflutter

interface MainContract{

    interface View
    interface Presenter{
        fun onCreate()
        fun onGetBatteryLevel()
    }

}