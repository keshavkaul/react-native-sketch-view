package com.sketchView.utils;

import android.content.Context;
import android.util.DisplayMetrics;
import android.util.TypedValue;

/**
 * Created by keshav on 10/04/17.
 */

public class ToolUtils {

    public static float ConvertDPToPixels(Context context, float dp) {
        DisplayMetrics dm = context.getResources().getDisplayMetrics();
        return TypedValue.applyDimension(TypedValue.COMPLEX_UNIT_DIP, dp, dm);
    }

}
