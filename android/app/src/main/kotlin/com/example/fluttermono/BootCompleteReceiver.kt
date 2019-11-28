package com.suyetech.ezhan.esite

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import com.example.fluttermono.MainActivity

class BootCompleteReceiver : BroadcastReceiver() {

    override fun onReceive(context: Context, intent: Intent) {
        if (Intent.ACTION_BOOT_COMPLETED == intent.action) {
            val thisIntent = Intent(context, MainActivity::class.java)
            thisIntent.action = "android.intent.action.MAIN"
            thisIntent.addCategory("android.intent.category.LAUNCHER")
            thisIntent.flags = Intent.FLAG_ACTIVITY_NEW_TASK
            context.startActivity(thisIntent)
        }
    }
}
