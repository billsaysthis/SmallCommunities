$(function() {
  $('#tweets-anywhere').jTweetsAnywhere({
    username: 'billsaysthis',
    count: 20,
    showTweetFeed: {
      showProfileImages: false,
      showUserScreenNames: true,
      paging: {
        mode: 'none'
      }
    },
    onDataRequestHandler: function(stats) {
      if (stats.dataRequestCount < 11) {
        return true;
      }
      else {
        alert("To avoid struggling with Twitter's rate limit, we stop loading data after 10 API calls.");
      }
    }
  });
});