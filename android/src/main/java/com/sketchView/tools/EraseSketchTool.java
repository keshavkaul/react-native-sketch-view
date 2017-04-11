package com.sketchView.tools;

import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.PorterDuff;
import android.graphics.PorterDuffXfermode;
import android.view.View;

import com.sketchView.utils.ToolUtils;

/**
 * Created by keshav on 08/04/17.
 */
public class EraseSketchTool extends PathTrackingSketchTool implements ToolThickness {

    private static final float DEFAULT_THICKNESS = 10;

    private Paint paint = new Paint();

    private float toolThickness;

    public EraseSketchTool(View touchView) {
        super(touchView);

        setToolThickness(DEFAULT_THICKNESS);

        PorterDuffXfermode porterDuffXfermode = new PorterDuffXfermode(PorterDuff.Mode.CLEAR);
        paint.setXfermode(porterDuffXfermode);
        paint.setStyle(Paint.Style.STROKE);
    }

    @Override
    public void render(Canvas canvas) {
        touchView.setLayerType(View.LAYER_TYPE_SOFTWARE, null);
        canvas.drawPath(path, paint);
    }

    @Override
    public void setToolThickness(float thickness) {
        toolThickness = thickness;
        paint.setStrokeWidth(ToolUtils.ConvertDPToPixels(touchView.getContext(), toolThickness));
    }

    @Override
    public float getToolThickness() {
        return toolThickness;
    }
}
