package com.sketchView.tools;

import android.graphics.Path;
import android.view.MotionEvent;
import android.view.View;

/**
 * Created by keshav on 08/04/17.
 */

public abstract class PathTrackingSketchTool extends SketchTool {

    Path path = new Path();

    PathTrackingSketchTool(View touchView) {
        super(touchView);
    }

    @Override
    public void clear() {
        path.reset();
    }

    @Override
    void onTouchDown(MotionEvent event) {
        path.moveTo(event.getX(), event.getY());
    }

    @Override
    void onTouchMove(MotionEvent event) {
        path.lineTo(event.getX(), event.getY());
        touchView.invalidate();
    }

    @Override
    void onTouchUp(MotionEvent event) {
        path.lineTo(event.getX(), event.getY());
        touchView.invalidate();
    }

    @Override
    void onTouchCancel(MotionEvent event) {
        onTouchUp(event);
    }
}
