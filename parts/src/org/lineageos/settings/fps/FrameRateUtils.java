/*
 * Copyright (C) 2020 The LineageOS Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
+ * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License
 */
package org.lineageos.settings.fps;

import android.content.Context;
import android.content.Intent;
import android.content.SharedPreferences;
import android.os.Parcel;
import android.os.RemoteException;
import android.os.ServiceManager;
import android.os.UserHandle;

import androidx.preference.PreferenceManager;

public class FrameRateUtils {

    private static final String FPS = "fps";
    private static final String FPS_SERVICE = "fps_service";

    public static void initialize(Context context) {
        if (isServiceEnabled(context))
            startService(context);
    }

    protected static void startService(Context context) {
        context.startServiceAsUser(new Intent(context, FrameRateService.class),
                UserHandle.CURRENT);
        PreferenceManager.getDefaultSharedPreferences(context).edit().putString(FPS_SERVICE, "true").apply();
    }

    protected static void stopService(Context context) {
        context.stopService(new Intent(context, FrameRateService.class));
        PreferenceManager.getDefaultSharedPreferences(context).edit().putString(FPS_SERVICE, "false").apply();
    }

    protected static boolean isServiceEnabled(Context context) {
        return Boolean.valueOf(PreferenceManager.getDefaultSharedPreferences(context).getString(FPS_SERVICE, "false"));
    }

    public static int getFps(Context context) {
        return PreferenceManager.getDefaultSharedPreferences(context).getInt(FPS, 0);
    }

    public static void changeFps(int fps, Context context) {
        // Display
        Parcel data = Parcel.obtain();
        data.writeInterfaceToken("android.ui.ISurfaceComposer");

        if (fps == 120 || fps == 0) {
            data.writeInt(0);
        } else if (fps == 90) {
            data.writeInt(1);
        } else {
            data.writeInt(2);
        }

        try {
            ServiceManager.getService("SurfaceFlinger").transact(1035, data, null, 0);
        } catch (RemoteException e) {
            // nothing we can do
        }
        data.recycle();

        // Save it
        PreferenceManager.getDefaultSharedPreferences(context).edit().putInt(FPS, fps).apply();

        if (fps > 0) {
            startService(context);
        } else {
            stopService(context);
        }
    }

    public static void refreshFps(Context context) {
        int fps = getFps(context);

        if (fps == 0) {
            return;
        }

        // Display
        Parcel data = Parcel.obtain();
        data.writeInterfaceToken("android.ui.ISurfaceComposer");

        if (fps == 120) {
            data.writeInt(0);
        } else if (fps == 90) {
            data.writeInt(1);
        } else {
            data.writeInt(2);
        }

        try {
            ServiceManager.getService("SurfaceFlinger").transact(1035, data, null, 0);
        } catch (RemoteException e) {
            // nothing we can do
        }
        data.recycle();
    }
}
