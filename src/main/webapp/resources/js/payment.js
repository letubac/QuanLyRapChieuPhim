const container = document.querySelector('.container1');
const seats = document.querySelectorAll('.seat:not(.occupied)');
const count = document.getElementById('count');
const total = document.getElementById('total');
const movieSelect = document.getElementById('movie');
const countSeat = document.getElementById('countSeat');

let ticketPrice = +movieSelect.value;

//Update total and count
function updateSelectedCount() {
  const selectedSeats = document.querySelectorAll('.container1 .seat.selected');
  const selectedSeatsCount = selectedSeats.length;
  count.innerText = selectedSeatsCount;
  total.innerText = selectedSeatsCount * ticketPrice;
}

//Movie Select Event
movieSelect.addEventListener('change', e => {
  ticketPrice = +e.target.value;
  updateSelectedCount();
});

//Seat click event
container.addEventListener('click', e => {
  if (e.target.classList.contains('seat') &&
    !e.target.classList.contains('occupied')) {
    e.target.classList.toggle('selected');
  }
  updateSelectedCount();
});

const $ = document.querySelector.bind(document);
const $$ = document.querySelectorAll.bind(document);

const tabs = $$(".tab-item");
const panes = $$(".tab-pane");

const btnContinue = $("#btn-continue");
const btnContinue1 = $("#btn-continue1");

const tabActive = $(".tab-item.active");
const line = $(".tabs .line");

// SonDN fixed - Active size wrong size on first load.
// Original post: https://www.facebook.com/groups/649972919142215/?multi_permalinks=1175881616551340
requestIdleCallback(function () {
  line.style.left = tabActive.offsetLeft + "px";
  line.style.width = tabActive.offsetWidth + "px";
});

tabs.forEach((tab, index) => {
  const pane = panes[index];

  tab.onclick = function () {
    $(".tab-item.active").classList.remove("active");
    $(".tab-pane.active").classList.remove("active");

    line.style.left = this.offsetLeft + "px";
    line.style.width = this.offsetWidth + "px";

    this.classList.add("active");
    pane.classList.add("active");
  };
});

const tab1 = $("#tab-item-1");
const tab2 = $("#tab-item-2");
const tab3 = $("#tab-item-3");
const pane1 = $("#tab-pane-1");
const pane2 = $("#tab-pane-2");
const pane3 = $("#tab-pane-3");

function updateCountSeat (){
  const selectedSeats = document.querySelectorAll('.container1 .seat.selected');
  const selectedSeatsCount = selectedSeats.length;
  countSeat.innerText = selectedSeatsCount;
 
};

btnContinue.onclick = function () {
  if (tab1.classList.contains("active")) {
    tab1.classList.remove("active");
    pane1.classList.remove("active");
    tab2.classList.add("active");
    pane2.classList.add("active");
    countSeat.innerText = count.innerText;
    console.log("tab2");
  }
  // line.style.left = this.offsetLeft + "px";
  // line.style.width = this.offsetWidth + "px";
};
btnContinue1.onclick = function () {
  if (tab2.classList.contains("active")) {
    tab2.classList.remove("active");
    pane2.classList.remove("active");
    tab3.classList.add("active");
    pane3.classList.add("active");
    console.log("tab3")
  }
}

//
new WOW().init();

/////////////////////////////////////