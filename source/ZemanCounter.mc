import Toybox.Lang;
import Toybox.Time;
import Toybox.Time.Gregorian;

class ZemanCounter {
    
    var options = {
        :year   => 2023,
        :month  => 3,
        :day    => 8,
        :hour   => 0
    };

    var days;
    var hours;
    var minutes;
    var seconds;

    public function count(){
        var today = new Time.Moment(Time.now().value());
        var mandateEnd = Gregorian.moment(options);

        var remainingDuration = today.subtract(mandateEnd);

        var remainingSec = remainingDuration.value();

        var _second = 1;
        var _minute = _second * 60;
        var _hour = _minute * 60;
        var _day = _hour * 24;

        days = Math.floor(remainingSec / _day);
        hours = Math.floor((remainingSec % _day) / _hour);
        minutes = Math.floor((remainingSec % _hour) / _minute);
        seconds = Math.floor((remainingSec % _minute) / _second);
    }

    public function getDays(){
        return days;
    }

    public function getHours(){
        return hours;
    }

    public function getMinutes(){
        return minutes;
    }

    public function getSeconds(){
        return seconds;
    }

    public function printTime(mask){
        return Lang.format(mask, [pad(hours, 2), pad(minutes, 2), pad(seconds, 2)]);
    }

    public function printDays(mask){
        return Lang.format(mask, [days]);
    }

    public function print(mask){
        return Lang.format(mask, [days, pad(hours, 2), pad(minutes, 2), pad(seconds, 2)]);
    }

    function pad(num, size) as String {
        var s = "0" + num;
        var l = s.length();
        if(l > size){
            return s.substring(l - size, l);
        } else {
            return s;
        }
    }
}