import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class ZemanCountdownApp extends Application.AppBase {

    var timer;
    var timerCount = 0;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
        timer = new Timer.Timer();
    }

    public function startTimer(){
        //System.println("Starting timer");
        timer.start(method(:timerCallback), 1000, true);
    }

    public function stopTimer(){
        //System.println("Stoping timer");
        timer.stop();
        timerCount = 0;
    }

    function timerCallback() {
        timerCount+=1;
        // Safe brake
        if(timerCount > 300){
            timer.stop();
        }
        //System.println("test"+timerCount);
        WatchUi.requestUpdate();
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
        self.stopTimer();
    }

    // Return the initial view of your application here
    function getInitialView() as Array<Views or InputDelegates>? {
        return [ new ZemanCountdownView() ] as Array<Views or InputDelegates>;
    }

    function getGlanceView() as Array<Views or InputDelegates>? {
        return [ new ZemanCountdownGlanceView() ] as Array<Views or InputDelegates>;
    }

}

function getApp() as ZemanCountdownApp {
    return Application.getApp() as ZemanCountdownApp;
}