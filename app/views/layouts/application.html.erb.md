<!DOCTYPE html>
<html>
  <head>
    <title><%= full_title(yield(:title)) %></title>
    <%= stylesheet_link_tag "application", media: "all",
                                           "data-turbolinks-track" => true %>
    <%= javascript_include_tag "application", "data-turbolinks-track" => true %>
    <%= csrf_meta_tags %>
    <%= render 'layouts/shim' %>
  </head>
  <body>
  <div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&version=v2.3&appId=105538052810287";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script>
    <%= render 'layouts/header' %>
    <div class="container">
      <% flash.each do |message_type, message| %>
         <%= content_tag(:div, message, class: "alert alert-#{message_type}") %>
      <% end %>
      <%= yield %>
   <!--   <%= render 'layouts/footer' %>-->
      <%= debug(params) if Rails.env.development? %>
    </div>
</div>
  </body>
</html>


