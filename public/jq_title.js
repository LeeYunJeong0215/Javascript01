<script>
// 제목바꾸기

// 1. 버튼을 클릭
//   1.1 버튼에 해당하는 HTML element를 찾는다

// getElementsByTagName => 배열로 리턴
// getElementsByClassName
// getElementsByName
// getElementsById => 1개만 리턴

// css selector
// $('button') //= document.getElementsByClassName
// $('.button') // = document.getElementsByClassNameclass
// $('#button') //= document.getElementsById

// JQuery로 자바스크립트 코드 바꾸기
var btn = $('button'); // =document.getElementsByTagName('button')[1]; //버튼이라는 태그이름을 가진 요소를 가져온다.
console.log(btn);


$(document).ready(function() { //= btn.onclick = function(){ } = $(function(){})
// 1. 버튼을 클릭하면
  //1.1 버튼을 찾아서
  var btn = $('.change-title');
  //1.2 클릭 이벤트 리스너를 달아준다.
  btn.on('click', function(){
    alert("버튼이 눌렸습니다");
    var str = prompt("제목을 무엇으로 바꾸시겠습니까?");
    // 2. title에 해당하는 부분을 찾아서
    // 3. 내가 입력한 문자열로 바꿔준다.
    $('.title').text(str);
  })

});
</script>
