$(function() {
  $('#flash').fadeOut(2000, "linear");

  $("nav ul").superfish({ 
    pathClass:  'current',
    disableHI: true
  }); 
  
  $('#tweets-anywhere').jTweetsAnywhere({
    username: scTwitterAccount,
    count: 20,
    showTweetFeed: {
      showProfileImages: false,
      showUserScreenNames: false,
      paging: {
        mode: 'none'
      }
    },
    onDataRequestHandler: function(stats) {
      if (stats.dataRequestCount < 11) {
        return true;
      } else {
        apprise("To avoid struggling with Twitter's rate limit, we stop loading data after 10 API calls.");
      }
    }
  });
});
