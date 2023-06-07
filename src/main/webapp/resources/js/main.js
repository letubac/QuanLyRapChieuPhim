const dangnhap = document.querySelector('.btn.btn-outline-light.me-2')
const modal = document.querySelector('.modal_dangnhap')
const closeLoggin = document.querySelector('.form-tt .iconclose')
const dangky = document.querySelector('.btn.btn-warning')
const modal_dk = document.querySelector('.modal_dangky')
const closeDK = document.querySelector('.login .iconclose1')

dangnhap.onclick = function(){
    modal.style.display = 'flex';
}
closeLoggin.onclick = function(){
    modal.style.display = 'none';
}
dangky.onclick = function(){
    modal_dk.style.display = 'flex';
}
closeDK.onclick = function(){
    modal_dk.style.display = 'none';
}