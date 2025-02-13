package com.clothless.andos.and_os

import android.content.Context
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel


/** AndOsPlugin */
class AndOsPlugin : FlutterPlugin, MethodChannel.MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel
    private lateinit var context: Context

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "and_os")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method == "getPlatformVersion") {
            result.success("Android ${android.os.Build.VERSION.RELEASE}")
        } else if(call.method == "isAdbEnabled"){
            result.success(isAdbEnabled())
        } else if(call.method == "isDeviceRooted"){
            result.success(isDeviceRooted())
        } else if(call.method == "isDeveloperModeEnabled"){
            result.success(isDeveloperModeEnabled())
        } else if(call.method == "isAppDebuggable"){
            result.success(isAppDebuggable())
        } else if(call.method == "isAppSignatureValid"){
            val sign = call.argument<String>("signature")
            result.success(isAppSignatureValid(sign!!))
        } else if(call.method == "isFridaDetected"){
            result.success(isFridaDetected())
        } else if(call.method == "isEmulator"){
            result.success(isEmulator())
        }
        else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }

    private fun isAdbEnabled(): Boolean {
        val value = Android(context).isAdbEnabled();
        return value;
    }

    private fun isDeviceRooted(): Boolean {
        val value = Android(context).isDeviceRooted();
        return value;
    }

    private fun isDeveloperModeEnabled(): Boolean {
        val value = Android(context).isDeveloperModeEnabled();
        return value;
    }

    private fun isAppDebuggable(): Boolean {
        val value = Android(context).isAppDebuggable();
        return value;
    }

    private fun isAppSignatureValid(signature: String): Boolean {
        val value = Android(context).isAppSignatureValid(signature);
        return value;
    }

    private fun isFridaDetected(): Boolean {
        val value = Android(context).isFridaDetected();
        return value;
    }

    private fun isEmulator(): Boolean {
        val value = Android(context).isEmulator();
        return value;
    }


}
