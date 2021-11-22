const loginForm = document.getElementById("login-form");
const loginButton = document.getElementById("login-form-submit");
const loginErrorMsg = document.getElementById("login-error-msg");

loginButton.addEventListener("click", (e) => {
  e.preventDefault();
  const username = loginForm.username.value;
  const password = loginForm.password.value;

  if (!username || !password) {
    loginErrorMsg.style.opacity = 1;
    return;
  }

  // Submit credentials to server for validation instead of client-side check
  loginForm.submit();
});
