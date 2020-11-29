import consumer from "./consumer"

consumer.subscriptions.create("CommentChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    if ( data.heart.user_id == data.content.user_id ) {
      const html = `<div class="comment-text"><p>☆${ data.user_name }</p><p>${data.content.text}</p></div>`;
      const comments = document.getElementById('comments');
      const newComment = document.getElementById('comment_text');
      comments.insertAdjacentHTML('afterbegin', html);
      newComment.value='';
    } else {
      const html = `<div class="comment-text-another"><p>${ data.user_name }</p><p>もっと聞きたい！</p></div>`;
      const comments = document.getElementById('comments');
      const newComment = document.getElementById('comment_text');
      comments.insertAdjacentHTML('afterbegin', html);
      newComment.value='もっと聞きたい！';
    }
  }
});
