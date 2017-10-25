<ul> <% @artists.each do |artist| %>


  <li> <%= artist.name %>
    <li><form method="post" action="/artist/<%=artist.id%>/delete">
      <input type = "submit" value = "Delete Artist!">
    </form></li>
</li> <% end %> </ul>



<a class="button" href="/artist/new"> Create Artist </a>
<a class="button" href="/album/new"> Create Album </a>
