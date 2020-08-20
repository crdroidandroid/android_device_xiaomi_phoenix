/*
 * Copyright (C) 2020 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings.fps;

import android.app.ActivityManager;
import android.app.Service;
import android.content.BroadcastReceiver;
import android.content.ComponentName;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.os.Handler;
import android.os.IBinder;
import android.util.Log;

import java.util.List;

public class FrameRateService extends Service {

    private static final String TAG = "FrameRateService";
    private static final boolean DEBUG = true;

    private final Handler mHandler = new Handler();

    private String mPreviousApp;
    private ActivityRunnable mActivityRunnable;

    private BroadcastReceiver mIntentReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            final String action = intent.getAction();
            if (Intent.ACTION_SCREEN_ON.equals(action)) {
                mHandler.postDelayed(mActivityRunnable, 500);
            } else {
                mHandler.removeCallbacks(mActivityRunnable);
                mPreviousApp = "";
            }
        }
    };

    @Override
    public void onCreate() {
        if (DEBUG) Log.d(TAG, "Creating service");
        mActivityRunnable = new ActivityRunnable(this);
        mHandler.postDelayed(mActivityRunnable, 500);
        registerReceiver();
        super.onCreate();
    }

    @Override
    public void onDestroy() {
        if (DEBUG) Log.d(TAG, "Destroying service");
        unregisterReceiver();
        mHandler.removeCallbacks(mActivityRunnable);
        mActivityRunnable = null;
        super.onDestroy();
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (DEBUG) Log.d(TAG, "Starting service");
        return START_STICKY;
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    private void registerReceiver() {
        IntentFilter filter = new IntentFilter();
        filter.addAction(Intent.ACTION_SCREEN_ON);
        filter.addAction(Intent.ACTION_SCREEN_OFF);
        this.registerReceiver(mIntentReceiver, filter);
    }

    private void unregisterReceiver() {
        this.unregisterReceiver(mIntentReceiver);
    }

    private class ActivityRunnable implements Runnable {
        private Context context;

        private ActivityRunnable(Context context) {
            this.context = context;
        }

        @Override
        public void run() {
/*
            ActivityManager manager = context.getSystemService(ActivityManager.class);
            List<ActivityManager.RunningTaskInfo> runningTasks = manager.getRunningTasks(1);
            if (runningTasks != null && runningTasks.size() > 0) {
                ComponentName topActivity = runningTasks.get(0).topActivity;
                String foregroundApp = topActivity.getPackageName();
                if (!foregroundApp.equals(mPreviousApp)) {
                    mPreviousApp = foregroundApp;
                }
*/
                if (DEBUG) Log.d(TAG, "Refreshing FPS");
                FrameRateUtils.refreshFps(context);
                mHandler.postDelayed(this, 1000);
//            }
        }
    }
}
