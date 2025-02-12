package com.clothless.andos.and_os

import android.annotation.TargetApi
import android.content.Context
import android.content.pm.PackageManager
import android.content.pm.Signature
import android.os.Build
import android.provider.Settings
import android.util.Base64
import android.util.Log
import java.io.File
import java.security.MessageDigest

class Android(private val context: Context) {

    // Check if USB debugging (ADB) is enabled
    fun isAdbEnabled(): Boolean {
        return Settings.Global.getInt(context.contentResolver, Settings.Global.ADB_ENABLED, 0) == 1
    }

    // Check if the device is rooted
    fun isDeviceRooted(): Boolean {
        val paths = arrayOf(
            "/system/app/Superuser.apk",
            "/sbin/su",
            "/system/bin/su",
            "/system/xbin/su",
            "/data/local/xbin/su",
            "/data/local/bin/su",
            "/system/sd/xbin/su",
            "/system/bin/failsafe/su",
            "/data/local/su"
        )
        for (path in paths) {
            if (File(path).exists()) return true
        }
        return false
    }

    // Check if developer mode is enabled
    fun isDeveloperModeEnabled(): Boolean {
        return Settings.Global.getInt(context.contentResolver, Settings.Global.DEVELOPMENT_SETTINGS_ENABLED, 0) == 1
    }

    // Check if the app is in debug mode
    fun isAppDebuggable(): Boolean {
        return (context.applicationInfo.flags and android.content.pm.ApplicationInfo.FLAG_DEBUGGABLE) != 0
    }

    // Check if the app is signed with the expected signature
    @TargetApi(Build.VERSION_CODES.FROYO)
    fun isAppSignatureValid(expectedSignature: String): Boolean {
        try {
            val packageName = context.packageName
            val packageManager = context.packageManager
            val packageInfo = packageManager.getPackageInfo(packageName, PackageManager.GET_SIGNATURES)

            // Get the signature
            val signatures: Array<Signature> = packageInfo.signatures
            if (signatures.isEmpty()) {
                return false
            }

            // Compute the SHA-256 hash of the signature
            val signature = signatures[0].toByteArray()
            val md = MessageDigest.getInstance("SHA-256")
            val digest = md.digest(signature)
            val currentSignature = Base64.encodeToString(digest, Base64.NO_WRAP)

            // Compare with the expected signature
            return currentSignature == expectedSignature
        } catch (e: Exception) {
            Log.e("SignatureChecker", "Error checking signature", e)
            return false
        }
    }

    // Check if Frida is detected (common hooking tool)
    fun isFridaDetected(): Boolean {
        try {
            val files = arrayOf(
                "/data/local/tmp/frida-server",
                "/data/local/tmp/re.frida.server",
                "/data/local/tmp/frida-agent.so"
            )
            for (file in files) {
                if (File(file).exists()) return true
            }
        } catch (e: Exception) {
        }
        return false
    }

    // Check if the app is running on an emulator
    fun isEmulator(): Boolean {
        return (Build.FINGERPRINT.startsWith("generic")
                || Build.FINGERPRINT.startsWith("unknown")
                || Build.MODEL.contains("google_sdk")
                || Build.MODEL.contains("Emulator")
                || Build.MODEL.contains("Android SDK built for x86")
                || Build.MANUFACTURER.contains("Genymotion")
                || (Build.BRAND.startsWith("generic") && Build.DEVICE.startsWith("generic"))
                || Build.PRODUCT == "google_sdk")
    }
}
