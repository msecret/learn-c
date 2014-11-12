
  function Stack() {
    this.data = [];
  }

  Stack.prototype.push = function(data) {
    this.data.push(data);
  }

  Stack.prototype.pop = function() {
    return this.data.pop();
  }

  Stack.prototype.peep = function(idx) {
    return this.data[idx];
  }
