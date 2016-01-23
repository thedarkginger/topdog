
Histories = function() {
  this.quizCurrent = 0;
  this.score = 0;
  this.seconds = 7;
  this.timing = this.seconds;
  this.container = $('#trivia');
  this.participationId = null;
}

Histories.prototype.init = function() {
  $('#trivia').on('click', '.btn.btn-primary-questions', this.checkAnswer.bind(this));
  $('div.timer strong').text(this.seconds)

  this.start();
}

Histories.prototype.start = function() {
  var that = this;

  $.getJSON('/api/start', function(participation) {
    that.participationId = participation.id;
    that.interval = window.setInterval(that.timer.bind(that), 1000);
    that.nextQuestion();
  })
}

Histories.prototype.nextQuestion = function() {
  this.quizCurrent += 1;
  this.timing = this.seconds;
  var that = this;

  $.getJSON('/api/show_question/' + this.participationId, function(questionData) {
    if (questionData.finished) {
      that.finish();
      return;
    }

    var questionElem = $('<div>').html((that.quizCurrent) + '.  ' + questionData.question + '</div>');
    var answersElems = questionData.answers.map(function(answer, index) {
      answerElem = $('<button class="btn btn-primary-questions" data-index="' + (index + 1) + '">').html(answer);
      return answerElem;
    });

    that.container.empty().append(questionElem).append(answersElems);
  });
}

Histories.prototype.checkAnswer = function(e) {
  var selectedIndex = $(e.target).data('index');
  var that = this;

  $.getJSON('/api/validate_answer/' + this.participationId + '/' + this.quizCurrent, { answer: selectedIndex }, function(data) {
    if (data.result) {

        swal({ title: "Good job!", text: "You were right!", type: "success", confirmButtonText: "Next" }, 
          function(isConfirm) {
          that.nextQuestion();
        }
          ); 
      that.score += 1;
    }
    else {
      swal({ title: "Woof!", text: "That wasn't correct...", type: "error", confirmButtonText: "Next" }, 
        function(isConfirm) {
          that.nextQuestion();
        }
        ); 
    }
  });
}

 Histories.prototype.timer = function() {
    var that = this;

   this.timing--;
   $('div.timer strong').text(this.timing);
   if (this.timing <= 0) {
    self.stop(); 
   $.getJSON('/api/skip_question/' + this.participationId, function() {
    that.nextQuestion();
   })
  }
 }

Histories.prototype.finish = function() {
  window.clearInterval(this.interval);
  $('div.timer').hide();
   var para = $('.temp_information').data('temp');
  console.log(para);  
  this.container.html('Your score was ' + this.score + ' correct out of ' + (this.quizCurrent - 1) + ' questions.<br><br>Now see if you were TopDog in the' + '<a style="text-decoration: none;" href="' + para + '"> Scoreboard</a>' + ' for this game.');
}

