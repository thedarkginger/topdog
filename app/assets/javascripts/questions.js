$.urlParam = function(name, url) {
    if (!url) {
     url = window.location.href;
    }
    var results = new RegExp('[\\?&]' + name + '=([^&#]*)').exec(url);
    if (!results) { 
        return undefined;
    }
    return results[1] || undefined;
}



Questions = function() {
  this.quizCurrent = 0;
  this.score = 0;
  this.seconds = 10;
  this.timing = this.seconds;
  this.container = $('#trivia');
  this.quizId = null;
}

Questions.prototype.init = function() {
  $('#trivia').on('click', '.btn.btn-primary-questions', this.checkAnswer.bind(this));
  $('div.timer strong').text(this.seconds)

  // console.log('I am inside this init method');

  this.start();
}

Questions.prototype.start = function() {
  var that = this;

  // console.log('I am inside this start method');

  $.getJSON('/api/start', function(participation) {
    that.participationId = participation.id;
    console.log("participation" + participation.id); 
    that.interval = window.setInterval(that.timer.bind(that), 1000);
    that.nextQuestion();
  })
}

Questions.prototype.nextQuestion = function() {
  this.quizCurrent += 1;
  this.timing = this.seconds;
  var that = this;

  // console.log('I am inside this next question method');

  var categoryId = $.urlParam('game_id'); 

  $.getJSON('/api/show_question/' + this.participationId + '/' + categoryId, function(questionData) {

     console.log("question2" + questionData);
    if (questionData.finished) {
      that.finish();
      return;
    }

   //  console.log("question" + questionData);
    var questionElem = $('<div class="questiontext">').html((that.quizCurrent) + '.  ' + questionData.question_text + '</div>');
    var answersElems = questionData.answers.map(function(answer, index) {
      answerElem = $('<button class="btn btn-primary-questions" data-index="' + (index + 1) + '">').html(answer);
      return answerElem;
    });

    that.container.empty().append(questionElem).append(answersElems);
  });
}

Questions.prototype.checkAnswer = function(e) {
  console.log("checkanswer: " + $(e.target).data('index'));
  var selectedIndex = $(e.target).data('index');
  var that = this;

  console.log('I am inside this check answer method');

  $.getJSON('/api/validate_answer/' + this.participationId + '/' + this.quizCurrent, { answer: selectedIndex }, function(data) {
    if (data.result) {

        swal({ title: "Good job!", text: "You were right!", type: "success", timer: 1200, showConfirmButton: false } 
          ); 
      that.score += 1;
    }
    else {
      swal({ title: "Woof!", text: "That wasn't correct...", type: "error", timer: 1200, showConfirmButton: false } 
        ); 
    }
          that.nextQuestion();
  });
}

Questions.prototype.timer = function() {
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

Questions.prototype.finish = function() {
  window.clearInterval(this.interval);
  $('div.timer').hide();
   var para = $('.temp_information').data('temp');
  console.log(para);  
  this.container.html('Your score was ' + this.score + ' correct out of ' + (this.quizCurrent - 1) + ' questions.<br><br>Now see if you were TopDog in the' + '<a style="text-decoration: none;" href="' + para + '"> Scoreboard</a>' + ' for this game.');
}