const display = document.querySelector('.display');
const buttons = document.querySelectorAll('button');
var evaluated = 0;

buttons.forEach(function (button) {
  button.addEventListener('click', calculate);
});

function calculate(event) {
  const buttonVal = event.target.value;

  if (buttonVal == '=' && display.value !== '') {
    display.value = eval(display.value);
    stored_display = display.value;
    evaluated = 1;
  } else if (buttonVal == '=' & evaluated == 1) {
    display.value = eval(stored_display + display.value);
  } else if (buttonVal == 'C') {
    display.value = '';
    evaluated = 0;
  } else{
    display.value += buttonVal;
  }

  display.value.toFixed(4).replace(/\.?0+$/, '');
}