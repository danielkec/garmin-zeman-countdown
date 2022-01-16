import Toybox.Graphics;
import Toybox.WatchUi;

class ZemanCountdownGlanceView extends WatchUi.GlanceView {

    function initialize() {
        GlanceView.initialize();
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
        getApp().startTimer();
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);

        var counter = new ZemanCounter();
        counter.count();
        
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(0, 0, Graphics.FONT_XTINY, "ZEMAN", Graphics.TEXT_JUSTIFY_LEFT);

        var spaceX = 2;
        var dayX = (365*5)/(dc.getWidth());
        var remainingX = (counter.getDays()/dayX) - 1;
        var pastX = (((365*5)-counter.getDays())/dayX)-1;

        dc.setColor(Graphics.COLOR_ORANGE, Graphics.COLOR_BLACK);
        dc.fillRectangle(0, 30, remainingX, 5);
        dc.setColor(Graphics.COLOR_BLUE, Graphics.COLOR_BLACK);
        dc.fillRectangle(remainingX+spaceX, 30, dc.getWidth(), 5);
        
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
        dc.drawText(0, 40, Graphics.FONT_XTINY, counter.print("$1$d $2$h $3$m $4$s"), Graphics.TEXT_JUSTIFY_LEFT);
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
        //System.println("glance hide");
        getApp().stopTimer();
    }
}
