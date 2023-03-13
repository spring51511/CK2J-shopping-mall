<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>

<main>
<section>
	<div id="categoryName"><h2>회원가입</h2></div>
<form method="POST" id="joinForm">


	<table id="purchaseDelivery" style="margin-top: 50px;">
		<tr>
			<th>아이디</th>
			<td>
				<input type="text" name="user_id" pattern="^[a-zA-Z0-9]+$"required autofocus>
				<button class="dupCheck">중복확인</button>
				<span class="dupResult"></span>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="user_pwd" required>
				<span class="pw1Check"></span>
			</td>
		</tr>
		<tr>
			<th>비밀번호 확인</th>
			<td>
				<input type="password" name="pwCheck">
				<span class="pw2Check"></span>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="user_name" required>
			</td>
		</tr>
		<tr>
			<th>연락처</th>
			<td>
				<input type="text" name="user_phone" required  placeholder="ex)010-0000-0000" pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{3,4}" maxlength="13">
			</td>
		</tr>
		<tr>
			<th>이메일</th>
			<td>
				<input type="email" name="user_email" required>
			</td>
		</tr>
		<tr>
			<th>이메일 수신여부</th>
			<td>
				<label><input type="radio" name="email_check" value="Y" required>예</label>
				<label><input type="radio" name="email_check" value="N" required>아니오</label>
			</td>
		</tr>
		<tr>
			<th>생년월일</th>
			<td>
				<input type="date" name="user_birth" required>
			</td>
		</tr>
		<tr>
			<th>성별</th>
			<td>
				<label><input type="radio" name="user_gender" value="남성" required>남성</label>
				<label><input type="radio" name="user_gender" value="여성" required>여성</label>
			</td>
		</tr>
	</table>
<div class="checkAll">
	<label class="checkAll">
		모두 동의
		<input type="checkbox" name="checkAll">
	</label>
</div>	
<div class="agreementDiv">
	<fieldset class="agreementFieldset">
		<p>
			<textarea class="agreement">${agreement1 }</textarea>
		</p>
		<p class="agreementCheck">
			<label>
				[필수]이용약관 동의
				<input type="checkbox" name="agreement">
			</label>
		</p>
	</fieldset>
</div>
	
<div class="agreementDiv">
	<fieldset class="agreementFieldset">
		<p>
			<textarea class="agreement">${agreement2 }</textarea>
		</p>
		<p class="agreementCheck">
			<label class="agreementCheck">
				[필수]개인정보 수집 및 이용 동의
				<input type="checkbox" name="agreement">
			</label>
		</p>
	</fieldset>
</div>

<div class="agreementDiv">	
	<fieldset class="agreementFieldset">
		<p>
			<textarea class="agreement">${agreement3 }</textarea>
		</p>
		<p class="agreementCheck">
			<label class="agreementCheck">
				[필수]쇼핑정보 수신 동의
				<input type="checkbox" name="agreement">
			</label>
		</p>
	</fieldset>
</div>	
	<div style="width: 90%; margin: auto; text-align: center;">
		<input type="submit" class="joinBtn" value="회원 가입">
	</div>
</form>
</section>
</main>
<div style="height: 600px;"></div>

<script>

// ##### 비밀번호 형식 확인 코드
 	const user_pwd = document.querySelector('input[name="user_pwd"]')
    const pw1Check = document.querySelector('span.pw1Check')
    
    const pwCheck = document.querySelector('input[name="pwCheck"]')
    const pw2Check = document.querySelector('span.pw2Check')

        function passwordCheck(event) {
            const exp = /^(?=.*?[0-9])(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[!@#$%^&*]).{8,16}$/
            if(event.target.value.match(exp) == null) {
            	pw1Check.innerText = '영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자.'
            		pw1Check.style.color = 'red'
            }
            else {
            	pw1Check.innerText = '사용가능합니다.'
            		pw1Check.style.color = 'blue'
            }
        }
	
	 	 function passwordCheck2(event) {
	        
	         console.log(user_pwd.value)
	         console.log(pwCheck.value)
	         
	         if(user_pwd.value == pwCheck.value) {
	         	pw2Check.innerText = '사용가능합니다'
	         		pw2Check.style.color = 'blue'
	         }
	         else {
	         	pw2Check.innerText = '비밀번호가 일치하지 않습니다.'
	         		pw2Check.style.color = 'red'
	         }
	     }
	
 	user_pwd.onkeyup = passwordCheck
 	pwCheck.onkeyup = passwordCheck2

</script>

<script>


// ####################### 아이디 중복 체크
	const inputId = document.querySelector('input[name="user_id"]')
	const dupcheck = document.querySelector('.dupCheck')
	const dupResult = document.querySelector('span.dupResult')
			
	dupcheck.onclick = function(event){
		event.preventDefault()
		const url = '${cpath}/user/join/dupCheck/' + inputId.value
		fetch(url)
		.then(resp => resp.text())
		.then(text => {
			console.log(text)
			dupResult.innerText = text
		})
				
	}
	
</script>

 <script>
         const btnSubmit = document.querySelector('input[type="submit"]')
        		
 		btnSubmit.onclick = function(event){
        	const agreeLabels = document.querySelectorAll('input[name="agreement"]:checked').length == 3 ? true : false
     		if(agreeLabels == false){
         		alert('약관을 동의해주세요')
         		event.preventDefault()
         		return
         	}if(pw1Check.innerText != '사용가능합니다.'){
 				alert('비밀번호는 영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 8자~16자.로 작성되어야 합니다.')
 				event.preventDefault()
 				return
 			}if(pw2Check.innerText != '사용가능합니다'){
 				alert('비밀번호를 확인해주세요')
 				event.preventDefault()
 				return
 			}if(dupResult.innerText != '사용 가능한 ID입니다'){
 				alert('아이디를 확인해주세요')
 				event.preventDefault()
 				return
 			}
 		}
        
    </script>
    
    <script> // 모두 동의 기능
    	const checkAllBtn = document.querySelector('input[name="checkAll"]')
    	checkAllBtn.onclick = checkAgreementAll
    	
    	function checkAgreementAll(event){
    		const agreeLabels = document.querySelectorAll('input[name="agreement"]')
    		if(event.target.checked == true){
    			agreeLabels.forEach(e => {
    				e.checked = true;
    			})
    		}else {
    			agreeLabels.forEach(e => {
    				e.checked = false;
    			})
    		}
    	}
    </script>
    

</body>
</html>