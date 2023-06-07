
/*function getUrlParameter(name, urlweb) {
   // name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
    var regex = new RegExp('[\\?:/&]' + name + '=([^&#]*)');
    var results = regex.exec(urlweb);
    return results === null ? 'rong' : decodeURIComponent(results[0][4].replace(/\+/g, ' '));
};*/

function getUrlParameter(name, urlweb) {
    var regex = new RegExp('[\\?:/&]' + name + '=([^&#/]*)');
    var results = regex.exec(urlweb);
    if (results === null) {
        return 'rong';
    } else {
        var number = results[1].match(/\d+/);
        if (number === null) {
            return 'rong';
        }
        return number[0];
    }
}

function getDayOfWeek() {

    var days = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    var current_day = new Date();
    var current_day_obj = {};
    var arrDay = [];
    var ma = getUrlParameter(`ma`,location.href);
    Date.prototype.getDayName = function () {
        return days[this.getDay()];
    };

    for (let i = 0; i < 10; i++) {

        var day = current_day.getDate();
        var dayName = current_day.getDayName();
        var month = current_day.getMonth() + 1;
        var year = current_day.getFullYear();
        var fullday = year + "-" + month + "-" + day;

        current_day_obj.day = day;
        current_day_obj.dayName = dayName;
        current_day_obj.month = month;
        current_day_obj.year = year;
        current_day_obj.fullday = fullday;

        arrDay.push(current_day_obj);
        current_day_obj = {}

        current_day.setDate(current_day.getDate() + 1);
    }
    //console.log(arrDay)
    arrDay.forEach((day) => {
        var ul = document.querySelector("#showtimes-list");
        var li = document.createElement("li");
        var a = document.createElement("a");
        var span1 = document.createElement("span");
        var span2 = document.createElement("span");
        
        li.className = "showtimes-list-item";
        a.className = "show-date";
        a.href = "/QuanLyRapChieuPhim/film/detail/ma=" + `${ma}` +  "/" + `${day.fullday}` +".htm";
        span1.className = "week";
        span2.className = "day";

        span1.textContent = day.dayName;
        span2.textContent = `${day.day}-${day.month}`;

        a.appendChild(span1);
        a.appendChild(span2);
        li.appendChild(a);
        ul.appendChild(li);
    });

}
window.onload = getDayOfWeek()