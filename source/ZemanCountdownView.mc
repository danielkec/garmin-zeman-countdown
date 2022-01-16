import Toybox.Graphics;
import Toybox.WatchUi;

class ZemanCountdownView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
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

        var dateView = View.findDrawableById("DateLabel") as Text;
        var view = View.findDrawableById("TimeLabel") as Text;

        var counter = new ZemanCounter();
        counter.count();

        dateView.setText(counter.printDays("$1$ dní"));
        view.setText(counter.printTime("$1$:$2$:$3$"));
        //System.println("view updated");
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
        getApp().stopTimer();
    }
}
