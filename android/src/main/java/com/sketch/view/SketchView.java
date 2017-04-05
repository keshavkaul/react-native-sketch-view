package com.sketch.view;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.SurfaceHolder;
import android.view.SurfaceView;
import android.view.View;

/**
 * Created by keshav on 05/04/17.
 */

public class SketchView extends View {

    public SketchView(Context context) {
        super(context);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        Paint p = new Paint();
        p.setColor(Color.BLUE);
        canvas.drawLine(0, 0, canvas.getWidth(), canvas.getHeight(), p);
    }
}
