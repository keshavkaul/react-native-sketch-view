package com.sketchView.tools;

import android.graphics.Canvas;
import android.graphics.Color;
import android.graphics.Paint;
import android.view.View;

import com.sketchView.utils.ToolUtils;

/**
 * Created by keshav on 08/04/17.
 */
public class PenSketchTool extends PathTrackingSketchTool implements ToolThickness, ToolColor {

    private static final float DEFAULT_THICKNESS = 5;
    private static final int DEFAULT_COLOR = Color.BLACK;

    private float toolThickness;
    private int toolColor;

    private Paint paint = new Paint();

    public PenSketchTool(View touchView) {
        super(touchView);

        setToolColor(DEFAULT_COLOR);
        setToolThickness(DEFAULT_THICKNESS);

        paint.setStyle(Paint.Style.STROKE);
        paint.setAntiAlias(true);
        paint.setStrokeJoin(Paint.Join.ROUND);
        paint.setStrokeCap(Paint.Cap.ROUND);
    }

    @Override
    public void render(Canvas canvas) {
        canvas.drawPath(path, paint);
    }

    @Override
    public void setToolThickness(float toolThickness) {
        this.toolThickness = toolThickness;
        paint.setStrokeWidth(ToolUtils.ConvertDPToPixels(touchView.getContext(), toolThickness));
    }

    @Override
    public float getToolThickness() {
        return toolThickness;
    }

    @Override
    public void setToolColor(int toolColor) {
        this.toolColor = toolColor;
        paint.setColor(toolColor);
    }

    @Override
    public int getToolColor() {
        return toolColor;
    }
}
