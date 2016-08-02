var Year = function(number) { this.number = number; };

Year.prototype.isLeap = function() {
  if (this.number % 4 == 0) {
    if (this.number % 100 == 0){
      if (this.number % 400 == 0){
        return true;
      }
      return false;
    }
    return true;
  }
  return false;
};

module.exports = Year;
