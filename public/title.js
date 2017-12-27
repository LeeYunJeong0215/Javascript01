<script>
// 제목바꾸기

// 1. 버튼을 클릭
//   1.1 버튼에 해당하는 HTML element를 찾는다

// getElementsByTagName => 배열로 리턴
// getElementsByClassName
// getElementsByName
// getElementsById => 1개만 리턴

var btn =document.getElementsByTagName('button')[1]; //버튼이라는 태그이름을 가진 요소를 가져온다.
console.log(btn);

//   1.2 해당 element에 click 이벤트 리스너를 달아준다.
btn.onclick = function(){
    alert("버튼이 눌렸습니다");
    var answer = prompt("제목을 무엇으로 바꾸시겠습니까?");
    console.log(answer);
    // 2. index 제목에 해당하는 부분을 찾아(HTML element 찾기)
    var titles = document.getElementsByClassName('title');
    for(var i=0; i,titles.length; i++){
      // 3. 사용자가 입력한 텍스트로 모두 바꿔줌.
      titles[i].textContent=answer;
    }
  }
// 함수를 선언하는 방법
// 1. var fn1 = function(){}
// 2. function fn2(){}
</script>
