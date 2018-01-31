<div class="jumbotron jumbotron-fluid">
    <p class="display-4 text-success"><em>Your favorite posts:</em> </p>
</div>

<div class="row">
  <% @favorites.each do |fav| %>
    <div class="col-sm-6 col-md-4 col-lg-3">

      <div class="card border-info mb-3">

          <div class="image-modal">
            <% if fav.post.pic_link %>
              <img src="<%=fav.post.pic_link%> " alt="<%=fav.post.pic_link%>" class="img-fluid myImg mx-auto d-block img-main">
            <% else %>
              <img src="<%=fav.post.image_url%> " alt="<%=fav.post.image_url%>" class="img-fluid myImg mx-auto d-block img-main">
            <% end %>
            <div class="moda myModa">
              <span class="close">&times;</span>
              <img src="" class="moda-content img01" >
              <div class="caption"></div>
            </div>
          </div>

          <div class="row">

            <div class="col d-flex justify-content-center">
              <% if favorited?(fav.post) %>
                <form action="/favorite" method="Post">
                  <input type="hidden" name="post_id" value="<%=fav.post.id%>">
                  <button type="submit" class="btn btn-outline-success fs"><i class="fa fa-star" aria-hidden="true"></i></i></button>
                </form>
              <% else %>
                <form action="/favorite" method="Post">
                  <input type="hidden" name="post_id" value="<%=fav.post.id%>">
                  <button type="submit" class="btn btn-outline-success fso"><i class="fa fa-star-o" aria-hidden="true"></i></button>
                </form>
              <% end %>
            </div>

            <div class="col d-flex justify-content-center">
              <span class="like-count"><%= fav.post.likes.total_count %></span>
            </div>

            <div class="col d-flex justify-content-center">
              <% if liked?(fav.post) %>
                <form action="/like/Post/<%=fav.post.id%>" method="post">
                  <button type="submit" class="btn btn-outline-success fh"><i class="fa fa-heart" aria-hidden="true"></i></button>
                </form>
              <% else %>
                <form action="/like/Post/<%=fav.post.id%>" method="post">
                  <button type="submit" class="btn btn-outline-success fho"><i class="fa fa-heart-o" aria-hidden="true"></i></button>
                </form>
              <% end %>
            </div>

          </div>

          <div class="info">
            <span class="name">
              <a href="/users/<%=fav.post.author.id%>">
                <%=fav.post.author.username%>:
              </a>
            </span>

            <span class="description">
              <a href="/posts/<%=fav.post.id%>">
                  <% if fav.post.description && fav.post.description.length > 50 %>
                    <%=fav.post.description[0..50]%>...
                  <% else %>
                    <%=fav.post.description%>
                  <% end %>
              </a>
            </span>

            <div class="float-right comments">
              <% if fav.post.comments.any? %>
                <a href="/posts/<%=fav.post.id%>">
                  <span><i class="fa fa-comments" aria-hidden="true"></i></span>
                </a>
              <% else %>
                <a href="/posts/<%=fav.post.id%>">
                  <span><i class="fa fa-comments-o" aria-hidden="true"></i></span>
                </a>
              <% end %>
            </div>

          </div>

      </div>

    </div>
  <% end %>
</div>
