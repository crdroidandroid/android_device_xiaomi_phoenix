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

import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.drawable.Icon;
import android.os.SystemProperties;
import android.service.quicksettings.Tile;
import android.service.quicksettings.TileService;

import org.lineageos.settings.R;

public class FrameRateTile extends TileService {

    @Override
    public void onStartListening() {
        super.onStartListening();

        Icon icon;
        int fps = FrameRateUtils.getFps(this);

        switch (fps) {
            case 0:
            default:
                icon = Icon.createWithResource(this, R.drawable.ic_frame_rate_mode_120);
                break;
            case 60:
                icon = Icon.createWithResource(this, R.drawable.ic_frame_rate_mode_60);
                break;
            case 90:
                icon = Icon.createWithResource(this, R.drawable.ic_frame_rate_mode_90);
                break;
            case 120:
                icon = Icon.createWithResource(this, R.drawable.ic_frame_rate_mode_120);
                break;
        }

        getQsTile().setIcon(icon);
        getQsTile().setState(fps > 0 ? Tile.STATE_ACTIVE : Tile.STATE_INACTIVE);
        getQsTile().updateTile();
    }

    @Override
    public void onClick() {
        super.onClick();
        int newFps;
        Icon icon;
        switch (FrameRateUtils.getFps(this)) {
            case 90:
                newFps = 120;
                icon = Icon.createWithResource(this, R.drawable.ic_frame_rate_mode_120);
                break;
            case 120:
                newFps = 0;
                icon = Icon.createWithResource(this, R.drawable.ic_frame_rate_mode_120);
                break;
            case 0:
            default:
                newFps = 60;
                icon = Icon.createWithResource(this, R.drawable.ic_frame_rate_mode_60);
                break;
            case 60:
                newFps = 90;
                icon = Icon.createWithResource(this, R.drawable.ic_frame_rate_mode_90);
                break;
        }
        FrameRateUtils.changeFps(newFps, this);
        getQsTile().setState(newFps > 0 ? Tile.STATE_ACTIVE : Tile.STATE_INACTIVE);
        getQsTile().setIcon(icon);
        getQsTile().updateTile();
    }
}
