Histories = function() {
  this.quizLength = null;
  this.quizCurrent = -1;
  this.score = 0;
  this.seconds = 7;
  this.timing = this.seconds;
  this.container = $('#trivia');
}

Histories.prototype.init = function() {
  $.getJSON('/histories.json', this.handleData.bind(this));
  $('#trivia').on('click', '.btn.btn-primary-questions', this.checkAnswer.bind(this));
}

Histories.prototype.handleData = function(data) {
  this.data = data;
  this.quizLength = data.length;

  this.nextQuestion();
  $('div.timer strong').text(this.seconds)
  this.interval = window.setInterval(this.timer.bind(this), 1000);
}

Histories.prototype.checkAnswer = function(e) {
  var rightIndex = this.container.data('rightIndex');
  var selectedIndex = $(e.target).data('index');

  if (selectedIndex == rightIndex) {
    alert('And boom goes the dynamite! You are right!');
    this.score += 1;
  }
  else {
    alert('Negative. Not the right answer. On to the next one.');
  }
  this.nextQuestion();
}


Histories.prototype.nextQuestion = function() {
  this.quizCurrent += 1;
  this.timing = this.seconds;

  if (this.quizCurrent >= this.quizLength) {
    this.finish();
    return;
  }

  var question = this.data[this.quizCurrent];
  var answers = question.answers.split(',');
  var rightIndex = parseInt(question.correcta, 10) - 1;

  // TODO this shold be server side only
  this.container.data('rightIndex', rightIndex);

  var questionElem = $('<div>').html((this.quizCurrent + 1) + '.  ' + question.question + '</div>');
  var answersElems = answers.map(function(answer, index) {
    answerElem = $('<button class="btn btn-primary-questions" data-index="' + index + '">').html(answer.trim());
    return answerElem;
  });

  this.container.empty().append(questionElem).append(answersElems);
}

Histories.prototype.timer = function() {
  this.timing--;

  if (this.timing <= 0) {
    this.nextQuestion();
  }

  $('div.timer strong').text(this.timing);

}

Histories.prototype.finish = function() {
  window.clearInterval(this.interval);
  this.container.html('Your score was ' + this.score + ' correct out of ' + this.quizLength + ' questions.<br><br>See where you rank below<br><br>Return to the lobby to start another TopDog battle and test your wits.');
  $('div.timer').hide();
}
